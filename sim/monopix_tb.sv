
`define TEST_DC 4

`include "MONOPIX.sv"

module gray2bin(gray, bin);
    input [5:0] gray;
    output [5:0]  bin;

    assign bin = {gray[5], bin[5] ^ gray[4], bin[4] ^ gray[3], bin[3] ^ gray[2], bin[2] ^ gray[1], bin[1] ^ gray[0]};
endmodule

module control_tb(
            input wire clk_bx, clk_out, 
            output reg read, freeze,
            
            input wire reset,
            input wire token,
            input wire data_in,
            output reg [26:0] data_out,
            output reg data_out_strobe
          );


enum {NOP, TOKEN_WAIT, READ, DATA} state, next_state;

always@(posedge clk_bx)
 if(reset)
     state <= NOP;
  else
     state <= next_state;
     
logic [7:0] DelayCnt;

always@(*) begin : set_next_state
    next_state = state; //default
    case (state)
        NOP:
            if(token)
                next_state = TOKEN_WAIT;   
        TOKEN_WAIT: 
            if(DelayCnt == 2)
                next_state = READ;
        READ:
            if(DelayCnt == 1)
                next_state = DATA;  
        DATA: 
            if(DelayCnt == 5)
            begin
                if(token)
                    next_state = TOKEN_WAIT; 
                else
                    next_state = NOP;
            end           
    endcase
end
     
always@(posedge clk_bx)
if(reset || (next_state == TOKEN_WAIT && state != TOKEN_WAIT) || (next_state == READ && state != READ)  || (next_state == DATA && state != DATA) )
    DelayCnt <= 0;
else if(DelayCnt != '1)
    DelayCnt <= DelayCnt + 1;

always@(posedge clk_bx)
    read <= (state == READ); 

always@(posedge clk_bx)
    freeze <= (state == TOKEN_WAIT || next_state == READ );

reg [1:0] read_dly;
always@(posedge clk_bx)
    read_dly[1:0] <= {read_dly[0], read};
    
reg [1:0] read_out_dly;
always@(posedge clk_out)
    read_out_dly <= {read_out_dly[0], read_dly[1]};
    
reg load;
always@(posedge clk_out)
    load <= read_out_dly[0] & !read_out_dly[1];
    
reg [6:0] cnt;
always@(posedge clk_out)
    if(reset)
        cnt <= -1;
    else if(load)
        cnt <= 0;
    else if(cnt != '1)
        cnt <= cnt + 1;

reg [26:0] ser;
always@(posedge clk_out)
    ser <= {ser[25:0],data_in};

wire store_data;
assign store_data = (cnt == 27);

always@(posedge clk_out)
    if(reset)
        data_out <= 0;
    else if(store_data)
        data_out <= ser;
         
always@(posedge clk_out)
    if(store_data)
        data_out_strobe <= 1;
    else 
        data_out_strobe <= 0;
        
endmodule 

typedef struct packed {
    
    logic [5:0] col;
    logic [5:0] te;
    logic [5:0] le;
    logic [8:0] row;
    
} t_data; 

module monopix_tb();

    logic def_conf;
    logic clk_conf;
    logic ld_conf;
    logic si_conf;
    logic so_conf;
    logic en_conf_clk;
    
    t_conf conf_in;
    logic [$bits(conf_in)-1:0] conf_reg;
    assign conf_reg = conf_in;
    
    initial begin
        //----------TEST PATTERN-------//
	conf_in.EN_TEST_PATTERN = '0;
	//----------READOUT ENABLE-----//
	conf_in.EN_PMOS_NOSF = '1;
	conf_in.EN_PMOS = '1;
	conf_in.EN_COMP = '1;
	conf_in.EN_HV = '1;
	conf_in.EN_OUT = '0;
	conf_in.nEN_OUT = '1;
	//--------HITOR OUT ENABLE-----//
	conf_in.EN_HITOR_OUT = '1;
	conf_in.nEN_HITOR_OUT = '1;
	//----------PULSING------------//
	conf_in.COL_PULSE_SEL = '0;
	conf_in.INJ_IN_MON_L = 0;
	conf_in.INJ_IN_MON_R = 0;
	conf_in.INJ_ROW = '0;
	//----------MASKING------------//
	conf_in.MASKV = '1;
	conf_in.MASKH = '1;  //(nMASKH=HITOR_SEL_ROW)
	conf_in.MASKD = '1;
	//------HIT_OR_COLUMN_ENABLE---//
	conf_in.DIG_MON_SEL = '0;
	//---------4-bit DAC-----------//
	//1st stage
	conf_in.SET_IBUFP_L = 4'h5; // (30uA max, 2uA LSB, default=10uA)
	conf_in.SET_IBUFP_R = 4'h5; // (30uA max, 2uA LSB, default=10uA)
	//2nd stage - Driver
	conf_in.SET_IBUFN_L = 4'h9; // (300uA max, 20uA LSB, default=180uA)
	conf_in.SET_IBUFN_R = 4'h9; // (300uA max, 20uA LSB, default=180uA)

	//------------DAC-------------//
	//SET VOLTAGE DAC - ONE HOT ENCODING
	conf_in.SET_VRESET_P = 128'h00000000000000000000000000010000; //(LINE #17 default=800mV (245mV+555mV))
	conf_in.SET_VH = 128'h00000000000080000000000000000000; //(LINE #79 default=1.5V (1.1V+385mV)
	conf_in.SET_VL = 128'h00000000000000000000100000000000; //(LINE #44 default=1V (620mV+385mV))
	conf_in.SET_VCASN = 128'h00000000000000000000010000000000; //(LINE #40 default=570mV)
	//NOT USED IN MONOPIX
	conf_in.SET_VRESET_D = 128'h00000000000000000000200000000000; //(LINE #45 default=1.19V (645mV+555mV))
	conf_in.SET_VCLIP = 128'h00000000000000000000000000000000; //(LINE #0 default=0V)

	//SET CURRENT DAC - THERMOMETER ENCODING, START FROM THE MIDDLE
	//Value = 128/(#lines active)*max current
	conf_in.SET_IBIAS = {{41{1'b0}},{46{1'b1}},{41{1'b0}}}; // (1.4uA max, 10.9nA LSB, default = 500nA)
	conf_in.SET_IDB = {{49{1'b0}},{29{1'b1}},{50{1'b0}}}; // (2.24uA max, 17.5nA LSB, default = 500nA)
	conf_in.SET_ITHR = {{60{1'b0}},{8{1'b1}},{60{1'b0}}}; // (17.5nA max, 137pA LSB, default = 1.1nA)
	conf_in.SET_IRESET = {{56{1'b0}},{15{1'b1}},{57{1'b0}}}; //4.7// (4.375nA max, 34.2pA LSB, default = 512pA)
	conf_in.SET_ICASN = {{45{1'b0}},{38{1'b1}},{45{1'b0}}}; // (560nA max, 4.375nA LSB, default = 166nA) VCASN = 572mV
	//SET IRESET BIT (1= HIGH LEAKAGE MODE, 0=LOW LEAKAGE MODE)
	conf_in.SET_IRESET_BIT = 1;
	//MONITOR SWCNTL
	conf_in.SWCNTL_DACMONI = 0;
	conf_in.SWCNTL_DACMONV = 0;
	//SWCNTLxx
	conf_in.SWCNTL_VRESET_P = 0;
	conf_in.SWCNTL_VH = 0;
	conf_in.SWCNTL_VL = 0;
	conf_in.SWCNTL_VCASN = 0;
	conf_in.SWCNTL_IREF = 0;
	conf_in.SWCNTL_IBIAS = 0;
	conf_in.SWCNTL_IDB = 0;
	conf_in.SWCNTL_ITHR = 0;
	conf_in.SWCNTL_IRESET = 0;
	conf_in.SWCNTL_ICASN = 0;
	//NOT USED IN MONOPIX
	conf_in.SWCNTL_VRESET_D = 0;
	conf_in.SWCNTL_VCLIP = 0;

//------------------changes of defconf-------------------//
        conf_in.COL_PULSE_SEL[7] = 1;
        conf_in.COL_PULSE_SEL[6] = 1;
        conf_in.INJ_ROW[0] = 1;
        conf_in.INJ_ROW[100] = 1;
        conf_in.INJ_ROW[223] = 1;

    end
   
   
    logic rst_n, clk_bx, clk_out, reset_bcid;
    
    logic read_pmos_nosf, read_pmos, read_comp, read_hv;
    logic freeze_pmos_nosf, freeze_pmos, freeze_comp, freeze_hv;
    logic token_pmos_nosf, token_pmos, token_comp, token_hv;
    logic data_pmos_nosf, data_pmos, data_comp, data_hv; 
    logic inj_pulse;
    
    MONOPIX dut (
        .DEF_CONF_PAD(def_conf),
        .CLK_CONF_PAD(clk_conf & en_conf_clk),
        .LD_CONF_PAD(ld_conf),
        .SI_CONF_PAD(si_conf),
        .SO_CONF_PAD(so_conf),
        
        .RST_N_PAD(rst_n),
        .CLK_BX_PAD(clk_bx), 
        .CLK_OUT_PAD(clk_out),
        .RESET_BCID_PAD(reset_bcid),
        
        .READ_PMOS_NOSF_PAD(read_pmos_nosf), .READ_PMOS_PAD(read_pmos), .READ_COMP_PAD(read_comp), .READ_HV_PAD(read_hv),
        .FREEZE_PMOS_NOSF_PAD(freeze_pmos_nosf), .FREEZE_PMOS_PAD(freeze_pmos), .FREEZE_COMP_PAD(freeze_comp), .FREEZE_HV_PAD(freeze_hv),
        
        .TOKEN_PMOS_NOSF_PAD(token_pmos_nosf), .TOKEN_PMOS_PAD(token_pmos), .TOKEN_COMP_PAD(token_comp), .TOKEN_HV_PAD(token_hv), 
        .OUT_PMOS_NOSF_PAD(data_pmos_nosf), .OUT_PMOS_PAD(data_pmos), .OUT_COMP_PAD(data_comp), .OUT_HV_PAD(data_hv),
        
        .PULSE_PAD(inj_pulse)
    
        
    );
//    assign clk_out = clk_bx;
    
    integer shif_cnt;
    
    logic [224:0][447:0] ana_hit;
    assign dut.MONOPIX_TOP.ANA_HIT = ana_hit;
    
    initial begin
        clk_conf = 0;
        forever #12.5ns clk_conf = ~clk_conf;
    end
    
    initial begin
        shif_cnt = 0;
        ld_conf = 0;
        def_conf = 1;
        en_conf_clk = 1;
        ana_hit = 0;
        inj_pulse = 0;
        
        repeat($bits(conf_in) + 5) begin
            @(negedge clk_conf)
        
            if(shif_cnt < $bits(conf_in)) 
                si_conf <= conf_reg[$bits(conf_in) - 1 - shif_cnt];
            
            if(shif_cnt == $bits(conf_in))
                en_conf_clk <= 0;
            
            if(shif_cnt == $bits(conf_in) + 1)
                ld_conf <= 1;
            else
                ld_conf <= 0;
             
            if(shif_cnt > $bits(conf_in) + 3)
                def_conf = 0;
             
            shif_cnt <= shif_cnt +1;
        end

        repeat(59) @(negedge clk_conf);
	
	//repeat(21) @(negedge clk_bx);

        ana_hit[0][0] = 1;
        #25ns ana_hit[2][447] = 1;  
        #200ns ana_hit[0][0] = 0;
        #25ns ana_hit[2][447] = 0;
        #200ns inj_pulse = 1;
        #100ns inj_pulse = 0;

        en_conf_clk = 1;
        #98175ns  en_conf_clk = 0;
    end
    

    initial begin
       reset_bcid = 1;
       repeat (3) @(negedge clk_bx);
       reset_bcid <= 0;
    end
    
    initial begin
        rst_n = 0;
        clk_bx = 0;
        #1us rst_n = 1;

        #1us clk_bx = 0;
        
        forever 
            #12.5ns clk_bx = ~clk_bx;

    end

    initial begin
      clk_out = 0;
	#1us clk_out = 0;
       
        forever 
	    #3.125ns clk_out = ~clk_out;

    end
    
    
    initial begin
        //read_pmos_nosf = 0;
        read_pmos = 0;
        read_comp = 0;
        //read_hv = 0;
        //freeze_pmos_nosf = 0;
        freeze_pmos = 0;
        freeze_comp = 0;
        //freeze_hv = 0;
    end
    

  
    t_data data_out_pmos_nosf;
    logic data_strobe_pmos_nosf;
    control_tb control_pmos_nosf(
        .clk_bx(clk_bx), .clk_out(clk_out), 
        .read(read_pmos_nosf), .freeze(freeze_pmos_nosf),
        
        .reset(reset_bcid),
        .token(token_pmos_nosf),
        .data_in(data_pmos_nosf),
        .data_out(data_out_pmos_nosf),
        .data_out_strobe(data_strobe_pmos_nosf)
    );
    
    logic [5:0] le_bin_pmos_nosf, te_bin_pmos_nosf;
    gray2bin gba(data_out_pmos_nosf.le, le_bin_pmos_nosf);
    gray2bin gbb(data_out_pmos_nosf.te, te_bin_pmos_nosf);
    
    always@(negedge clk_out) begin
        if(data_strobe_pmos_nosf)
            $display("pmos_nosf: COL=%d, ROW=%d, gLE=%d, gTE=%d", data_out_pmos_nosf.col, data_out_pmos_nosf.row, le_bin_pmos_nosf, te_bin_pmos_nosf) ;
    end
    
    control_tb control_hv(
        .clk_bx(clk_bx), .clk_out(clk_out), 
        .read(read_hv), .freeze(freeze_hv),
        
        .reset(reset_bcid),
        .token(token_hv),
        .data_in(data_hv),
        .data_out(),
        .data_out_strobe()
    );
          
        
endmodule
