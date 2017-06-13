
`include "MONOPIX.sv"


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
        conf_in = '0;
        conf_in.COL_PULSE_SEL[447] = 1;
        conf_in.nEN_HITOR_OUT = 4'b0101;
        
        conf_in.SET_IBUFP_L = 4'h5;
    end
   
    MONOPIX dut (
        .DEF_CONF_PAD(def_conf),
        .CLK_CONF_PAD(clk_conf & en_conf_clk),
        .LD_CONF_PAD(ld_conf),
        .SI_CONF_PAD(si_conf),
        .SO_CONF_PAD(so_conf)
    );
    
    integer shif_cnt;
    
    initial begin
        clk_conf = 0;
        forever #1us clk_conf = ~clk_conf;
    end
    
    initial begin
        shif_cnt = 0;
        ld_conf = 0;
        def_conf = 1;
        en_conf_clk = 1;
        
        forever begin
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
    end

endmodule
