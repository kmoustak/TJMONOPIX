
`include "DIGITAL/defines.sv"
`include "DIGITAL/readout.sv"
`include "DIGITAL/cnfg_reg.v"

`include "MATRIX_DAC/matrix_dac.v"
`include "PADS/PAD_ANALOG.v"
`include "PADS/PAD_AVDD.v"
`include "PADS/PAD_AVSS.v"
`include "PADS/PAD_DVDD.v"
`include "PADS/PAD_DVSS.v"
`include "PADS/PAD_PWELL.v"
`include "PADS/PAD_SUB.v"

module MONOPIX(
    
    // digital
    input DEF_CONF_PAD,
    input CLK_CONF_PAD,
    input LD_CONF_PAD,
    input SI_CONF_PAD,
    output SO_CONF_PAD,
    
    input RST_N_PAD,
    input CLK_BX_PAD, 
    input CLK_OUT_PAD,
    input RESET_BCID_PAD,
    input READ_PMOS_PAD, READ_PMOS_DPW_PAD, READ_COMP_PAD, READ_HV_PAD,
    input FREEZE_PMOS_PAD, FREEZE_PMOS_DPW_PAD, FREEZE_COMP_PAD, FREEZE_HV_PAD,
    output TOKEN_PMOS_PAD, TOKEN_PMOS_DPW_PAD, TOKEN_COMP_PAD, TOKEN_HV_PAD,
    output OUT_PMOS_PAD, OUT_PMOS_DPW_PAD, OUT_COMP_PAD, OUT_HV_PAD,
    
    input PULSE_PAD,
    output [3:0] HIT_OR_PAD,
    
    // analog
    inout DACMON_IBIAS_PAD,
    inout DACMON_ICASN_PAD, 
    inout DACMON_IDB_PAD, 
    inout DACMON_IRESET_PAD,
    inout DACMON_ITHR_PAD, 
    inout DACMON_VH_PAD, 
    inout DACMON_VL_PAD, 
    inout DACMON_VRESET_P_PAD, 
    
    inout BIAS_SF_PAD,
    input VPS_PAD, 
    input [0:3]  OUTA_MON_L_PAD,  //ANALOG PAD -> INOUT
    input [0:3]  OUTA_MON_R_PAD,  //ANALOG PAD -> INOUT
    
    // power nets
    inout       VDD_PER,
    inout       GND_PER,
    
    inout       AVDD_DAC, // DAC analog Supply
    inout       AVSS_DAC, // DAC Analog Ground

    inout       DVDD, // Digital Supply
    inout       DVSS, // Digital Ground

    inout       AVDD, // Analog Supply
    inout       AVSS, // Analog Ground

    inout       SUB,   // Die substrate bias
    inout       PWELL,  // Die substrate bias under the pixel matrix
    
    inout       HV_DIODE
);

    //
    //   IO
    //
    
    //Configuration
    t_conf conf;
    wire DefConf, ClkConf, LdConf, SiConf, SoConf; 
        
    //Readout
    wire ClkBx, ClkOut;
    wire ResetBcid;
    wire ReadPmos, ReadPmosDpw, ReadComp, ReadHv;
    wire FreezePmos, FreezePmosDpw, FreezeComp, FreezeHv;
    wire OutPmos, OutPmosDpw, OutComp, OutHv;
    wire TokenPmos, TokenPmosDpw, TokenComp, TokenHv;
    //
    wire nRST;
    wire Pulse;
    
    logic [3:0] HitOr;
    
    //analog
    //DACMON -> ANALOG PADS
    wire DACMON_IBIAS; 
    wire DACMON_ICASN; 
    wire DACMON_IDB; 
    wire DACMON_IRESET;
    wire DACMON_ITHR; 
    wire DACMON_VH; 
    wire DACMON_VL; 
    wire DACMON_VRESET_P; 
    
    wire BiasSF, Vpc;  //ANALOG PAD -> INOUT
    wire [0:3]  OUTA_MON_L;  //ANALOG PAD -> INOUT
    wire [0:3]  OUTA_MON_R;  //ANALOG PAD -> INOUT
    
    wire HV_DIODE; 
    wire PSUB; 
    wire PWELL; 
    
    wire GNDA_IDAC; 
    wire VDDA_IDAC; 
    
    wire VDDA_VDAC;
    wire GNDA_VDAC; 
    
    wire VDDA;
    wire GNDA;
    
    wire VDDD;
    wire GNDD; 
    
    wire VDD_PER;
    wire GND_PER;
    

    Pulldown_pol_IO PAD_DEF_CONF ( .CIN(DefConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DEF_CONF_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_CLK_CONF ( .CIN(ClkConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(CLK_CONF_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_LD_CONF ( .CIN(LdConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(LD_CONF_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_SI_CONF ( .CIN(SiConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(SI_CONF_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_SO_CONF ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(SO_CONF_PAD), .SUB(SUB), .DOUT(SoConf), .OEN(1'b1) );
        
    Pulldown_pol_IO PAD_RST_N ( .CIN(nRST), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(RST_N_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_CLK_BX ( .CIN(ClkBx), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(CLK_BX_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_CLK_OUT ( .CIN(ClkOut), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(CLK_OUT_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_RESET_BCID ( .CIN(ResetBcid), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(RESET_BCID_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_PULSE ( .CIN(Pulse), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(PULSE_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    
    Pulldown_pol_IO PAD_READ_PMOS ( .CIN(ReadPmos), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(READ_PMOS_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_PMOS ( .CIN(FreezePmos), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(FREEZE_PMOS_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_PMOS ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(TOKEN_PMOS_PAD), .SUB(SUB), .DOUT(TokenPmos), .OEN(conf.EN_OUT[0]) );
    Pulldown_pol_IO PAD_OUT_PMOS ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUT_PMOS_PAD), .SUB(SUB), .DOUT(OutPmos), .OEN(conf.EN_OUT[0]) );
    
    Pulldown_pol_IO PAD_READ_PMOS_DPW ( .CIN(ReadPmosDpw), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(READ_PMOS_DPW_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_PMOS_DPW ( .CIN(FreezePmosDpw), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(FREEZE_PMOS_DPW_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_PMOS_DPW ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(TOKEN_PMOS_DPW_PAD), .SUB(SUB), .DOUT(TokenPmosDpw), .OEN(conf.EN_OUT[1]) );
    Pulldown_pol_IO PAD_OUT_PMOS_DPW ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUT_PMOS_DPW_PAD), .SUB(SUB), .DOUT(OutPmosDpw), .OEN(conf.EN_OUT[1]) );
    
    Pulldown_pol_IO PAD_READ_COMP ( .CIN(ReadComp), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(READ_COMP_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_COMP ( .CIN(FreezeComp), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(FREEZE_COMP_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_COMP ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(TOKEN_COMP_PAD), .SUB(SUB), .DOUT(TokenComp), .OEN(conf.EN_OUT[2]) );
    Pulldown_pol_IO PAD_OUT_COMP ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUT_COMP_PAD), .SUB(SUB), .DOUT(OutComp), .OEN(conf.EN_OUT[2]) );
    
    Pulldown_pol_IO PAD_READ_HV ( .CIN(ReadHv), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(READ_HV_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_HV ( .CIN(FreezeHv), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(FREEZE_HV_PAD), .SUB(SUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_HV ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(TOKEN_HV_PAD), .SUB(SUB), .DOUT(TokenHv), .OEN(conf.EN_OUT[3]) );
    Pulldown_pol_IO PAD_OUT_HV ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUT_HV_PAD), .SUB(SUB), .DOUT(OutHv), .OEN(conf.EN_OUT[3]) );
    
    Pulldown_pol_IO PAD_HIT_OR0 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(HIT_OR_PAD[0]), .SUB(SUB), .DOUT(HitOr[0]), .OEN(conf.EN_HITOR_OUT[0]) );
    Pulldown_pol_IO PAD_HIT_OR1 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(HIT_OR_PAD[1]), .SUB(SUB), .DOUT(HitOr[1]), .OEN(conf.EN_HITOR_OUT[1]) );
    Pulldown_pol_IO PAD_HIT_OR2 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(HIT_OR_PAD[2]), .SUB(SUB), .DOUT(HitOr[2]), .OEN(conf.EN_HITOR_OUT[2]) );
    Pulldown_pol_IO PAD_HIT_OR3 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(HIT_OR_PAD[3]), .SUB(SUB), .DOUT(HitOr[3]), .OEN(conf.EN_HITOR_OUT[3]) );
        

    PAD_ANALOG PAD_DACMON_IBIAS ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_IBIAS), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_IBIAS_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_ICASN ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_ICASN), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_ICASN_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_IDB ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_IDB), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_IDB_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_IRESET ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_IRESET), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_IRESET_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_ITHR ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_ITHR), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_ITHR_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_VH ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_VH), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_VH_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_VL ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_VL), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_VL_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_DACMON_VRESET_P ( .AVDD(VDDA), .AVSS(GNDA), .CIN(DACMON_VRESET_P), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(DACMON_VRESET_P_PAD), .SUB(SUB) );
    
    PAD_ANALOG PAD_BIAS_SF ( .AVDD(VDDA), .AVSS(GNDA), .CIN(BiasSF), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(BIAS_SF_PAD), .SUB(SUB) );
    PAD_ANALOG PAD_VPS ( .AVDD(VDDA), .AVSS(GNDA), .CIN(Vpc), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(VPS_PAD), .SUB(SUB) );
    
    PAD_ANALOG PAD_OUTA_MON_L0 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_L[0]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_L_PAD[0]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_L1( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_L[1]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_L_PAD[1]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_L2 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_L[2]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_L_PAD[2]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_L3 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_L[3]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_L_PAD[3]), .SUB(SUB) );
    
    PAD_ANALOG PAD_OUTA_MON_R0 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_R[0]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_R_PAD[0]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_R1( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_R[1]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_R_PAD[1]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_R2 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_R[2]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_R_PAD[2]), .SUB(SUB) );
    PAD_ANALOG PAD_OUTA_MON_R3 ( .AVDD(VDDA), .AVSS(GNDA), .CIN(OUTA_MON_R[3]), .DVDD(VDD_PER), .DVSS(GND_PER), .PAD(OUTA_MON_R_PAD[3]), .SUB(SUB) );
    
    localparam DVDD_POWER_PADS = 4;
    localparam SUB_PADS = 4;
    localparam AVDD_POWER_PADS = 4;
    
    PAD_PWELL PAD_PWELL ( .AVDD ( AVDD ), .AVSS ( AVSS ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ), .PWELL(PWELL) );  
    
    genvar i;
    generate 
        for (i=0;i<DVDD_POWER_PADS;i=i+1)
        begin : DIGITAL
           PAD_DVDD        INST_PAD_DVDD (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ) );
           PAD_DVSS        INST_PAD_DVSS (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ) );
        end
   endgenerate

   generate 
        for (i=0;i<AVDD_POWER_PADS;i=i+1)
        begin : DIGITAL
           PAD_AVDD        INST_PAD_DVDD (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ) );
           PAD_AVSS        INST_PAD_DVSS (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ) );
        end
   endgenerate

   generate 
      for (i=0;i<SUB_PADS;i=i+1)
        begin : SUBSTRATE
           PAD_SUB         INST_PAD_SUB (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDD_PER ), .DVSS ( GND_PER ), .SUB ( SUB ) );
        end
   endgenerate
    
   //TODO: HV_DIODE
   //TODO: DIGITAL_MATRIX

    
    //
    //   CONFIGURATION
    //
    
    t_conf default_conf;
    always_comb begin
        default_conf = '0;
        
    //****DEFAULT CONFIGURATION****//
    //----------PULSING------------//
    default_conf.COL_PULSE_SEL = 0;
    default_conf.INJ_IN_MON_L = 0;
    default_conf.INJ_IN_MON_R = 0;
    default_conf.INJ_ROW = 0;
    //----------MASKING------------//
    default_conf.MASKV = 1;
    default_conf.MASKH = 1;  //(nMASKH=HITOR_SEL_ROW)
    default_conf.MASKD = 1;
    //---------4-bit DAC-----------//
    //Value=16/(binary_to_decimal)*max current
    //1st stage
    default_conf.IBUFP_L = 4'h5; // (30uA max, 2uA LSB, default=10uA)
    default_conf.IBUFP_R = 4'h5; // (30uA max, 2uA LSB, default=10uA)
    //2nd stage - Driver
    default_conf.IBUFN_L = 4'h9; // (300uA max, 20uA LSB, default=180uA)
    default_conf.IBUFN_R = 4'h9; // (300uA max, 20uA LSB, default=180uA)

    //------------DAC-------------//
    //SET VOLTAGE DAC - ONE HOT ENCODING
    //VCASN, VCLIP no buffer
    //Source follower buffer for VRESETx, VH,VL. VRESET level shift=555mV, VL,VH level shift=385mV
    //VRESETxx max = #88 (1.25V + 0.55V), VH,VL max = #100 (1.415V+0.385V), VH,VL min = #36 (0.515V + 0.385V), VH>VL
    //Value = 1.8/127 * (#SET LINE (0 to 127) + S.F level shift), MAX=1.8V, LSB=14.17mV, MIN=S.F level shift
    default_conf.SWCNTL_VRESET_P = 128'h00000000000000000000000000010000; //(LINE #17 default=800mV (245mV+555mV))
    default_conf.SWCNTL_VH = 128'h00000000000080000000000000000000; //(LINE #79 default=1.5V (1.1V+385mV)
    default_conf.SWCNTL_VL = 128'h00000000000000000000100000000000; //(LINE #44 default=1V (620mV+385mV))
    default_conf.SWCNTL_VCASN = 128'h00000000000000000000010000000000; //(LINE #40 default=570mV)
    //NOT USED IN MONOPIX
    default_conf.SWCNTL_VRESET_D = 128'h00000000000000000000200000000000; //(LINE #45 default=1.19V (645mV+555mV))
    default_conf.SWCNTL_VCLIP = 128'h00000000000000000000000000000000; //(LINE #0 default=0V)

    //SET CURRENT DAC - THERMOMETER ENCODING, START FROM THE MIDDLE
    //Value = 128/(#lines active)*max current
    default_conf.SWCNTL_IBIAS = {{41{1'b0}},{46{1'b1}},{41{1'b0}}}; // (1.4uA max, 10.9nA LSB, default = 500nA)
    default_conf.SWCNTL_IDB = {{49{1'b0}},{29{1'b1}},{50{1'b0}}}; // (2.24uA max, 17.5nA LSB, default = 500nA)
    default_conf.SWCNTL_ITHR = {{60{1'b0}},{8{1'b1}},{60{1'b0}}}; // (17.5nA max, 137pA LSB, default = 1.1nA)
    default_conf.SWCNTL_IRESET = {{56{1'b0}},{15{1'b1}},{57{1'b0}}}; //4.7// (4.375nA max, 34.2pA LSB, default = 512pA)
    default_conf.SWCNTL_ICASN = {{45{1'b0}},{38{1'b1}},{45{1'b0}}}; // (560nA max, 4.375nA LSB, default = 166nA) VCASN = 572mV
    //SET IRESET BIT (1= HIGH LEAKAGE MODE, 0=LOW LEAKAGE MODE)
    //LOW LEAKAGE -> 43.75pA max, 342fA LSB  HIGH LEAKAGE -> 4.375nA max, 34.2pA LSB
    default_conf.IRESET_BIT = 1;

    //SET SWCNTL - MONITOR/OVERRIDE
    //SWCNTLxx    MONITOR SWCNTL    OPERATION
    //   0                0           NORMAL
    //   0              1           MONITOR
        //   1                0           OVERRIDE/NORMAL OTHERS
        //   1                1           OVERRIDE/MONITOR OTHERS
    //MONITOR SWCNTL
    //default_conf.SWCNTL_DACNMONV = 0;
    //default_conf.SWCNTL_DACNMONI = 0;
    //SWCNTLxx
    //default_conf.SWCNTL_VCASN = 0;
    default_conf.SWCNTL_IREF = 0;
    //default_conf.SWCNTL_IBIAS = 0;
    //default_conf.SWCNTL_ITHR = 0;
    //default_conf.SWCNTL_IDB = 0;
    //default_conf.SWCNTL_IRESET = 0;
    //default_conf.SWCNTL_ICASN = 0;
    //NOT USED IN MONOPIX
    //default_conf.SWCNTL_VRESET_D = 0;
    //default_conf.SWCNTL_VCLIP = 0;

    end 

    localparam CONF_SIZE = $bits(t_conf);
    cnfg_reg #(.SIZE(CONF_SIZE)) global_cnfg  (
            .DefConf(DefConf), 
            .clk(ClkConf), 
            .ld(LdConf), 
            .si(SiConf), 
            .so(SoConf),
            .DefVal(default_conf), 
            .Out(conf)
         );

    //
    //   MATRIX_DAC
    //
    
    logic SET_IRESET_BIT;

    logic  SWCNTL_DACMONI; 
    logic  SWCNTL_DACMONV; 
    logic  SWCNTL_IBIAS; 
    logic  SWCNTL_ICASN;
    logic  SWCNTL_IDB; 
    logic  SWCNTL_IREF; 
    logic  SWCNTL_IRESET; 
    logic  SWCNTL_ITHR; 
    logic  SWCNTL_VCASN;
    logic  SWCNTL_VCLIP; 
    logic  SWCNTL_VH; 
    logic  SWCNTL_VL; 
    logic  SWCNTL_VRESET_D;
    logic  SWCNTL_VRESET_P;

    //monitoring
    logic [111:0]  DIG_MON_COMP;
    logic [111:0]  DIG_MON_PMOS_DPW;
    logic [111:0]  DIG_MON_HV;
    logic [111:0]  DIG_MON_PMOS;
    

    logic [127:0]  SET_ICASN;
    logic [127:0]  SET_VRESET_P;
    logic [447:0]  DIG_MON_SEL;
    logic [223:0]  INJ_ROW;
    logic [127:0]  SET_ITHR;
    logic [127:0]  SET_VRESET_D;
    logic [3:0]  IBUFN_R_SET;
    logic [127:0]  SET_VL;
    logic [127:0]  SET_IDB;
    logic [127:0]  SET_IBIAS;
    logic [223:0]  MASKH;
    logic [447:0]  INJ_IN;//PULSING DIGITAL 
    logic INJ_IN_MON_L; //PULSING extra
    logic INJ_IN_MON_R; //PULSING extra
    
    logic [127:0]  SET_IRESET;
    logic [127:0]  SET_VCASN;
    logic [3:0]  IBUFP_R_SET;
    logic [447:0]  MASKV;
    logic [127:0]  SET_VCLIP;
    logic [3:0]  IBUFP_L_SET;
    logic [3:0]  IBUFN_L_SET;
    logic [447:0]  MASKD;
    logic [127:0]  SET_VH;
    
    
    logic [1343:0]  BcidMtx;
    
    logic [55:0]  nTOK_COMP;
    logic [55:0]  FREEZE_COMP;
    logic [55:0]  Read_COMP;
    logic [1175:0]  Data_COMP;
    
    logic [55:0]  nTOK_HV;
    logic [55:0]  FREEZE_HV;
    logic [55:0]  Read_HV;
    logic [1175:0]  Data_HV;
    
    logic [55:0]  nTOK_PMOS;
    logic [55:0]  Read_PMOS;
    logic [55:0]  FREEZE_PMOS;
    logic [1175:0]  Data_PMOS;
     
    logic [55:0]  nTOK_PMOS_DPW;
    logic [55:0]  FREEZE_PMOS_DPW;
    logic [55:0]  Read_PMOS_DPW;
    logic [1175:0]  Data_PMOS_DPW;

    matrix_dac matrix_dac (.*); 
     
    always_comb begin
        SET_IRESET_BIT = conf.IRESET_BIT;
        SET_ICASN = conf.ICASN;
        SET_VRESET_P = conf.VRESET_P;
        DIG_MON_SEL = conf.DIG_MON_SEL;
        INJ_ROW = conf.INJ_ROW;
        SET_ITHR = conf.ITHR;
        SET_VRESET_D = conf.VRESET_D;
        IBUFN_R_SET = conf.IBUFN_R;
        SET_VL = conf.VL;
        SET_IDB = conf.IDB;
        SET_IBIAS = conf.IBIAS;
        MASKH = conf.MASKH;
        
        INJ_IN = {448{Pulse}} &  conf.COL_PULSE_SEL;
        INJ_IN_MON_L = Pulse &  conf.INJ_IN_MON_L;
        INJ_IN_MON_R = Pulse &  conf.INJ_IN_MON_R;
        
        SET_IRESET = conf.IRESET;
        SET_VCASN = conf.VCASN;
        IBUFP_R_SET  = conf.IBUFP_R;
        MASKV = conf.MASKV;
        SET_VCLIP = conf.VCLIP;
        IBUFP_L_SET  = conf.IBUFP_L;
        IBUFN_L_SET  = conf.IBUFN_L;
        MASKD  = conf.MASKD;
        SET_VH  = conf.VH;
        
        SWCNTL_DACMONI  = conf.SWCNTL_DACMONI; 
        SWCNTL_DACMONV  = conf.SWCNTL_DACMONV; 
        SWCNTL_IBIAS  = conf.SWCNTL_IBIAS; 
        SWCNTL_ICASN  = conf.SWCNTL_ICASN;
        SWCNTL_IDB  = conf.SWCNTL_IDB; 
        SWCNTL_IREF  = conf.SWCNTL_IREF; 
        SWCNTL_IRESET  = conf.SWCNTL_IRESET; 
        SWCNTL_ITHR  = conf.SWCNTL_ITHR; 
        SWCNTL_VCASN  = conf.SWCNTL_VCASN;
        SWCNTL_VCLIP  = conf.SWCNTL_VCLIP; 
        SWCNTL_VH  = conf.SWCNTL_VH; 
        SWCNTL_VL  = conf.SWCNTL_VL; 
        SWCNTL_VRESET_D  = conf.SWCNTL_VRESET_D;
        SWCNTL_VRESET_P  = conf.SWCNTL_VRESET_P;

    end
    
    assign VDD_Per = VDD_PER;
    assign GND_Per = GND_PER;
    //TODO: PSUB

    //
    //   READOUT
    //    
    logic reset_ff;
    always_ff@(posedge ClkBx)
        reset_ff <= ResetBcid;
    
    
    logic [5:0] bcid_bin;
    logic [5:0] bcid_gray;
    always_ff@(posedge ClkBx)
        if(reset_ff)
            bcid_bin <= 0;
        else
            bcid_bin <= bcid_bin +1;
    assign bcid_gray = (bcid_bin >> 1) ^ bcid_bin;

    wire [3:0][0:335] bcid_matrix_type;
    assign BcidMtx = bcid_matrix_type;
        
    readout readout_PMOS
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadPmos),
        .Freeze(FreezePmos), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[0]),
        .Enable(conf.EN_PMOS),
        .DataOut(DataOutPmos),
        .TokenOut(TokenPmos),
        .TokColB(nTOK_PMOS),
        .DataCol(Data_PMOS),
        .ReadCol(Read_PMOS),
        .FreezeCol(FREEZE_PMOS),
        .BcidCol(bcid_matrix_type[0])
    );
    
    readout readout_PMOS_DPW
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadPmosDpw),
        .Freeze(FreezePmosDpw), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[1]),
        .Enable(conf.EN_PMOS_DPW),
        .DataOut(DataOutPmosDpw),
        .TokenOut(TokenPmosDpw),
        .TokColB(nTOK_PMOS_DPW),
        .DataCol(Data_PMOS_DPW),
        .ReadCol(Read_PMOS_DPW),
        .FreezeCol(FREEZE_PMOS_DPW),
        .BcidCol(bcid_matrix_type[1])
    );
    
    readout readout_COMP
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadComp),
        .Freeze(FreezeComp), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[2]),
        .Enable(conf.EN_COMP),
        .DataOut(DataOutComp),
        .TokenOut(TokenComp),
        .TokColB(nTOK_COMP),
        .DataCol(Data_COMP),
        .ReadCol(Read_COMP),
        .FreezeCol(FREEZE_COMP),
        .BcidCol(bcid_matrix_type[2])
    );
    
    readout readout_HV
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadHv),
        .Freeze(FreezeHv), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[3]),
        .Enable(conf.EN_HV),
        .DataOut(DataOutHv),
        .TokenOut(TokenHv),
        .TokColB(nTOK_HV),
        .DataCol(Data_HV),
        .ReadCol(Read_HV),
        .FreezeCol(FREEZE_HV),
        .BcidCol(bcid_matrix_type[3])
    );
    
    always_comb begin
        HitOr[0] = |DIG_MON_PMOS;
        HitOr[1] = |DIG_MON_PMOS_DPW;
        HitOr[2] = |DIG_MON_COMP;
        HitOr[3] = |DIG_MON_HV;
    end
    
    
endmodule
