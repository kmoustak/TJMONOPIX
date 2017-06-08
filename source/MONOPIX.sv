`include "DIGITAL/defines.sv"
`include "DIGITAL/readout.sv"
`include "DIGITAL/cnfg_reg.v"

`include "MATRIX_DAC/matrix_dac.v"
`include "PADS/PAD_DVDD.v"
`include "PADS/PAD_DVSS.v"
`include "PADS/Pulldown_pol_IO.v"

module MONOPIX(
    
    // digital
    input DEF_CONF_PAD, //IO Pulldown PAD
    input CLK_CONF_PAD, //IO Pulldown PAD
    input LD_CONF_PAD, //IO Pulldown PAD
    input SI_CONF_PAD, //IO Pulldown PAD
    output SO_CONF_PAD, //IO Pulldown PAD
    input RST_N_PAD, //IO Pulldown PAD
    input CLK_BX_PAD, //IO Pulldown PAD
    input CLK_OUT_PAD, //IO Pulldown PAD
    input RESET_BCID_PAD, //IO Pulldown PAD
    input READ_PMOS_NOSF_PAD, READ_PMOS_PAD, READ_COMP_PAD, READ_HV_PAD, //IO Pulldown PAD
    input FREEZE_PMOS_NOSF_PAD, FREEZE_PMOS_PAD, FREEZE_COMP_PAD, FREEZE_HV_PAD, //IO Pulldown PAD
    output TOKEN_PMOS_NOSF_PAD, TOKEN_PMOS_PAD, TOKEN_COMP_PAD, TOKEN_HV_PAD, //IO Pulldown PAD
    output OUT_PMOS_NOSF_PAD, OUT_PMOS_PAD, OUT_COMP_PAD, OUT_HV_PAD, //IO Pulldown PAD
    
    input PULSE_PAD, //IO Pulldown PAD
    output [3:0] HIT_OR_PAD, //IO Pulldown PAD
    
    // Analog -> Analog Pads
    inout BiasSF,  // Analog Pad IBIAS
    inout VPC,     // Analog Pad ANALOG
    inout VPCNOSF, // Analog Pad NORES

    inout DACMON_IBIAS, // Analog PAD IANALOG
    inout DACMON_IDB,   // Analog PAD IANALOG
    inout DACMON_ITHR,  // Analog PAD IANALOG
    inout DACMON_IRESET, // Analog PAD IANALOG
    inout DACMON_ICASN,  // Analog PAD IANALOG

    inout DACMON_VRESET_P,  // Analog PAD IANALOG
    inout DACMON_VL,  // Analog PAD IANALOG
    inout DACMON_VH,  // Analog PAD IANALOG
    inout DACMON_VCASN_DAC,  // Analog PAD IANALOG
    
    inout [3:0]  OUTA_MON_L, //Analog PAD ANALOG
    inout [3:0]  OUTA_MON_R, //Analog PAD ANALOG
    inout VCASN_MON_L,       //Analog PAD ANALOG
    inout VCASN_DAC_MON_L,   //Analog PAD ANALOG
    inout VCASN_MON_R,       //Analog PAD ANALOG
    inout VCASN_DAC_MON_R,   //Analog PAD ANALOG

    // Power Nets
    inout       VDDA, // Analog Supply
    inout       GNDA, // Analog Ground

    inout       VDDD, // Digital Supply
    inout       GNDD, // Digital Ground
    
    // DAC power domains will be shorted on the PAD
    inout       VDDA_IDAC, // IDAC analog Supply
    inout       GNDA_IDAC, // IDAC Analog Ground

    inout       VDDA_VDAC, // IDAC analog Supply
    inout       GNDA_VDAC, // IDAC Analog Ground

    inout       VDDP,  // Periphery Digital Supply
    inout       GNDP,  // Periphery Digital Ground
    
    inout       PSUB,   // Die PSUBstrate bias
    inout       PWELL,  // Die PSUBstrate bias under the pixel matrix
    
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
    wire ReadPMOS_NOSF, ReadPMOS, ReadCOMP, ReadHV;
    wire FreezePMOS_NOSF, FreezePMOS, FreezeCOMP, FreezeHV;
    wire OutPMOS_NOSF, OutPMOS, OutCOMP, OutHv;
    wire TokenPMOS_NOSF, TokenPMOS, TokenCOMP, TokenHV;
    //
    wire nRST;
    wire Pulse;
    
    logic [3:0] HitOr;

    Pulldown_pol_IO PAD_DEF_CONF ( .CIN(DefConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(DEF_CONF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_CLK_CONF ( .CIN(ClkConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(CLK_CONF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_LD_CONF ( .CIN(LdConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(LD_CONF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_SI_CONF ( .CIN(SiConf), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(SI_CONF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_SO_CONF ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(SO_CONF_PAD), .SUB(PSUB), .DOUT(SoConf), .OEN(1'b1) );
        
    Pulldown_pol_IO PAD_RST_N ( .CIN(nRST), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(RST_N_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_CLK_BX ( .CIN(ClkBx), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(CLK_BX_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_CLK_OUT ( .CIN(ClkOut), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(CLK_OUT_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) ); 
    Pulldown_pol_IO PAD_RESET_BCID ( .CIN(ResetBcid), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(RESET_BCID_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_PULSE ( .CIN(Pulse), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(PULSE_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    
    Pulldown_pol_IO PAD_READ_PMOS_NOSF ( .CIN(ReadPMOS_NOSF), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(READ_PMOS_NOSF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_PMOS_NOSF ( .CIN(FreezePMOS_NOSF), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(FREEZE_PMOS_NOSF_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_PMOS_NOSF ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(TOKEN_PMOS_NOSF_PAD), .SUB(PSUB), .DOUT(TokenPMOS_NOSF), .OEN(conf.EN_OUT[0]) );
    Pulldown_pol_IO PAD_OUT_PMOS_NOSF ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(OUT_PMOS_NOSF_PAD), .SUB(PSUB), .DOUT(OutPMOS_NOSF), .OEN(conf.EN_OUT[0]) );
    
    Pulldown_pol_IO PAD_READ_PMOS ( .CIN(ReadPMOS_NOSF), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(READ_PMOS_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_PMOS ( .CIN(FreezePMOS_NOSF), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(FREEZE_PMOS_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_PMOS ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(TOKEN_PMOS_PAD), .SUB(PSUB), .DOUT(TokenPMOS_NOSF), .OEN(conf.EN_OUT[1]) );
    Pulldown_pol_IO PAD_OUT_PMOS ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(OUT_PMOS_PAD), .SUB(PSUB), .DOUT(OutPMOS_NOSF), .OEN(conf.EN_OUT[1]) );
    
    Pulldown_pol_IO PAD_READ_COMP ( .CIN(ReadCOMP), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(READ_COMP_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_COMP ( .CIN(FreezeCOMP), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(FREEZE_COMP_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_COMP ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(TOKEN_COMP_PAD), .SUB(PSUB), .DOUT(TokenCOMP), .OEN(conf.EN_OUT[2]) );
    Pulldown_pol_IO PAD_OUT_COMP ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(OUT_COMP_PAD), .SUB(PSUB), .DOUT(OutCOMP), .OEN(conf.EN_OUT[2]) );
    
    Pulldown_pol_IO PAD_READ_HV ( .CIN(ReadHV), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(READ_HV_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_FREEZE_HV ( .CIN(FreezeHV), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(FREEZE_HV_PAD), .SUB(PSUB), .DOUT(), .OEN(1'b0) );
    Pulldown_pol_IO PAD_TOKEN_HV ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(TOKEN_HV_PAD), .SUB(PSUB), .DOUT(TokenHV), .OEN(conf.EN_OUT[3]) );
    Pulldown_pol_IO PAD_OUT_HV ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(OUT_HV_PAD), .SUB(PSUB), .DOUT(OutHV), .OEN(conf.EN_OUT[3]) );
    
    Pulldown_pol_IO PAD_HIT_OR0 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(HIT_OR_PAD[0]), .SUB(PSUB), .DOUT(HitOr[0]), .OEN(conf.EN_HITOR_OUT[0]) );
    Pulldown_pol_IO PAD_HIT_OR1 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(HIT_OR_PAD[1]), .SUB(PSUB), .DOUT(HitOr[1]), .OEN(conf.EN_HITOR_OUT[1]) );
    Pulldown_pol_IO PAD_HIT_OR2 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(HIT_OR_PAD[2]), .SUB(PSUB), .DOUT(HitOr[2]), .OEN(conf.EN_HITOR_OUT[2]) );
    Pulldown_pol_IO PAD_HIT_OR3 ( .CIN(), .AVDD(VDDA), .AVSS(GNDA), .DVDD(VDDP), .DVSS(GNDP), .PAD(HIT_OR_PAD[3]), .SUB(PSUB), .DOUT(HitOr[3]), .OEN(conf.EN_HITOR_OUT[3]) );
        
    localparam DVDD_POWER_PADS = 4;
    localparam AVDD_POWER_PADS = 4;
    
// POWER PADS IN PERIPHERY GENERATED IN DIGITAL FLOW?? OR NOT??? HOW MANY?
    genvar i;
    generate 
        for (i=0;i<DVDD_POWER_PADS;i=i+1)
        begin : DIGITAL
           PAD_DVDD        INST_PAD_DVDD (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDDP ), .DVSS ( GNDP ), .SUB ( PSUB ));
           PAD_DVSS        INST_PAD_DVSS (.AVDD ( VDDA ), .AVSS ( GNDA ), .DVDD ( VDDP ), .DVSS ( GNDP ), .SUB ( PSUB ));
        end
   endgenerate



   //TODO: DIGITAL_MATRIX ????
    
    //
    //   CONFIGURATION
    //
    
    t_conf default_conf;
    always_comb begin
        //default_conf = '0;
        
        //****DEFAULT CONFIGURATION****//
        //----------TEST PATTERN-------//
        default_conf.EN_TEST_PATTERN = '0;
        //----------READOUT ENABLE-----//
        default_conf.EN_PMOS_NOSF = '1;
        default_conf.EN_PMOS = '1;
        default_conf.EN_COMP = '1;
        default_conf.EN_HV = '1;
        default_conf.EN_OUT = '1;
        //--------HITOR OUT ENABLE-----//
        default_conf.EN_HITOR_OUT = '0;
        //----------PULSING------------//
        default_conf.COL_PULSE_SEL = '0;
        default_conf.INJ_IN_MON_L = 0;
        default_conf.INJ_IN_MON_R = 0;
        default_conf.INJ_ROW = '0;
        //----------MASKING------------//
        default_conf.MASKV = '1;
        default_conf.MASKH = '1;  //(nMASKH=HITOR_SEL_ROW)
        default_conf.MASKD = '1;
        //------HIT_OR_COLUMN_ENABLE---//
        default_conf.DIG_MON_SEL = '0;
        //---------4-bit DAC-----------//
        //Value=16/(binary_to_decimal)*max current
        //1st stage
        default_conf.SET_IBUFP_L = 4'h5; // (30uA max, 2uA LSB, default=10uA)
        default_conf.SET_IBUFP_R = 4'h5; // (30uA max, 2uA LSB, default=10uA)
        //2nd stage - Driver
        default_conf.SET_IBUFN_L = 4'h9; // (300uA max, 20uA LSB, default=180uA)
        default_conf.SET_IBUFN_R = 4'h9; // (300uA max, 20uA LSB, default=180uA)

        //------------DAC-------------//
        //SET VOLTAGE DAC - ONE HOT ENCODING
        //VCASN, VCLIP no buffer
        //Source follower buffer for VRESETx, VH,VL. VRESET level shift=555mV, VL,VH level shift=385mV
        //VRESETxx max = #88 (1.25V + 0.55V), VH,VL max = #100 (1.415V+0.385V), VH,VL min = #36 (0.515V + 0.385V), VH>VL
        //Value = 1.8/127 * (#SET LINE (0 to 127) + S.F level shift), MAX=1.8V, LSB=14.17mV, MIN=S.F level shift
        default_conf.SET_VRESET_P = 128'h00000000000000000000000000010000; //(LINE #17 default=800mV (245mV+555mV))
        default_conf.SET_VH = 128'h00000000000080000000000000000000; //(LINE #79 default=1.5V (1.1V+385mV)
        default_conf.SET_VL = 128'h00000000000000000000100000000000; //(LINE #44 default=1V (620mV+385mV))
        default_conf.SET_VCASN = 128'h00000000000000000000010000000000; //(LINE #40 default=570mV)
        //NOT USED IN MONOPIX
        default_conf.SET_VRESET_D = 128'h00000000000000000000200000000000; //(LINE #45 default=1.19V (645mV+555mV))
        default_conf.SET_VCLIP = 128'h00000000000000000000000000000000; //(LINE #0 default=0V)

        //SET CURRENT DAC - THERMOMETER ENCODING, START FROM THE MIDDLE
        //Value = 128/(#lines active)*max current
        default_conf.SET_IBIAS = {{41{1'b0}},{46{1'b1}},{41{1'b0}}}; // (1.4uA max, 10.9nA LSB, default = 500nA)
        default_conf.SET_IDB = {{49{1'b0}},{29{1'b1}},{50{1'b0}}}; // (2.24uA max, 17.5nA LSB, default = 500nA)
        default_conf.SET_ITHR = {{60{1'b0}},{8{1'b1}},{60{1'b0}}}; // (17.5nA max, 137pA LSB, default = 1.1nA)
        default_conf.SET_IRESET = {{56{1'b0}},{15{1'b1}},{57{1'b0}}}; //4.7// (4.375nA max, 34.2pA LSB, default = 512pA)
        default_conf.SET_ICASN = {{45{1'b0}},{38{1'b1}},{45{1'b0}}}; // (560nA max, 4.375nA LSB, default = 166nA) VCASN = 572mV
        //SET IRESET BIT (1= HIGH LEAKAGE MODE, 0=LOW LEAKAGE MODE)
        //LOW LEAKAGE -> 43.75pA max, 342fA LSB  HIGH LEAKAGE -> 4.375nA max, 34.2pA LSB
        default_conf.SET_IRESET_BIT = 1;

        //SET SWCNTL - MONITOR/OVERRIDE
        //SWCNTLxx    MONITOR SWCNTL    OPERATION
        //   0                0           NORMAL
        //   0                1           MONITOR
        //   1                0           OVERRIDE/NORMAL OTHERS
        //   1                1           OVERRIDE/MONITOR OTHERS
        //MONITOR SWCNTL
        default_conf.SWCNTL_DACMONI = 0;
        default_conf.SWCNTL_DACMONV = 0;
        //SWCNTLxx
        default_conf.SWCNTL_VRESET_P = 0;
        default_conf.SWCNTL_VH = 0;
        default_conf.SWCNTL_VL = 0;
        default_conf.SWCNTL_VCASN = 0;

        default_conf.SWCNTL_IREF = 0;
        default_conf.SWCNTL_IBIAS = 0;
        default_conf.SWCNTL_IDB = 0;
        default_conf.SWCNTL_ITHR = 0;
        default_conf.SWCNTL_IRESET = 0;
        default_conf.SWCNTL_ICASN = 0;
        //NOT USED IN MONOPIX
        default_conf.SWCNTL_VRESET_D = 0;
        default_conf.SWCNTL_VCLIP = 0;

    end 

    localparam CONF_SIZE = $bits(t_conf);
    cnfg_reg #(.SIZE(CONF_SIZE)) global_cnfg  (
            .DefConf(DefConf), 
            .clk(ClkConf), 
            .ld(LdConf), 
            .si(SiConf), 
            .so(SoConf),
            .DefVal(default_conf), 
            .Out(conf),
            .OutSr()
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

    // HITOR monitoring
    logic [111:0]  DIG_MON_PMOS_NOSF;
    logic [111:0]  DIG_MON_PMOS;
    logic [111:0]  DIG_MON_COMP;
    logic [111:0]  DIG_MON_HV;
  
    //DAC
    logic [127:0]  SET_IBIAS;
    logic [127:0]  SET_IDB;
    logic [127:0]  SET_ITHR;
    logic [127:0]  SET_IRESET;
    logic [127:0]  SET_ICASN;

    logic [127:0]  SET_VRESET_P;
    logic [127:0]  SET_VH;
    logic [127:0]  SET_VL;
    logic [127:0]  SET_VCASN;
    logic [127:0]  SET_VRESET_D;
    logic [127:0]  SET_VCLIP;

    logic [3:0]  SET_IBUFP_L;
    logic [3:0]  SET_IBUFP_R;
    logic [3:0]  SET_IBUFN_L;
    logic [3:0]  SET_IBUFN_R;

    logic [447:0]  DIG_MON_SEL;
    logic [223:0]  INJ_ROW;

    //Matrix
    logic [447:0]  MASKV;
    logic [223:0]  MASKH;
    logic [447:0]  MASKD;

    //Pulsing
    logic [447:0]  INJ_IN;//PULSING DIGITAL 
    logic INJ_IN_MON_L; //PULSING extra
    logic INJ_IN_MON_R; //PULSING extra
    
   
    //Readout    
    logic [1343:0]  BcidMtx;
    
    logic [55:0]  nTOK_PMOS_NOSF;
    logic [55:0]  Read_PMOS_NOSF;
    logic [55:0]  FREEZE_PMOS_NOSF;
    logic [1175:0]  Data_PMOS_NOSF;

    logic [55:0]  nTOK_PMOS;
    logic [55:0]  FREEZE_PMOS;
    logic [55:0]  Read_PMOS;
    logic [1175:0]  Data_PMOS;

    logic [55:0]  nTOK_COMP;
    logic [55:0]  FREEZE_COMP;
    logic [55:0]  Read_COMP;
    logic [1175:0]  Data_COMP;
    
    logic [55:0]  nTOK_HV;
    logic [55:0]  FREEZE_HV;
    logic [55:0]  Read_HV;
    logic [1175:0]  Data_HV;
    

    matrix_dac matrix_dac (.*); 
     
    always_comb begin
        //DAC
        SET_VRESET_P = conf.SET_VRESET_P;
        SET_VH  = conf.SET_VH;
        SET_VL = conf.SET_VL;
        SET_VCASN = conf.SET_VCASN;
        SET_VRESET_D = conf.SET_VRESET_D;
        SET_VCLIP = conf.SET_VCLIP;

        SET_IBIAS = conf.SET_IBIAS;
        SET_IDB = conf.SET_IDB;
        SET_ITHR = conf.SET_ITHR;
        SET_IRESET = conf.SET_IRESET;
        SET_ICASN = conf.SET_ICASN;

        SET_IRESET_BIT = conf.SET_IRESET_BIT;

        SET_IBUFN_L  = conf.SET_IBUFN_L;
        SET_IBUFN_R = conf.SET_IBUFN_R;
        SET_IBUFP_L  = conf.SET_IBUFP_L;
        SET_IBUFP_R  = conf.SET_IBUFP_R;
        
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
       
        //Matrix
        MASKV = conf.MASKV;
        MASKH = conf.MASKH;
        MASKD  = conf.MASKD;
        INJ_ROW = conf.INJ_ROW;
        DIG_MON_SEL = conf.DIG_MON_SEL;

        //Pulsing
        INJ_IN = {448{Pulse}} &  conf.COL_PULSE_SEL;
        INJ_IN_MON_L = Pulse &  conf.INJ_IN_MON_L;
        INJ_IN_MON_R = Pulse &  conf.INJ_IN_MON_R;
    end
    

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

    wire [3:0][335:0] bcid_matrix_type;
    assign BcidMtx = bcid_matrix_type;
        
    readout readout_PMOS_NOSF
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadPMOS_NOSF),
        .Freeze(FreezePMOS_NOSF), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[0]),
        .Enable(conf.EN_PMOS_NOSF),
        .DataOut(DataOutPMOS_NOSF),
        .TokenOut(TokenPMOS_NOSF),
        .TokColB(nTOK_PMOS_NOSF),
        .DataCol(Data_PMOS_NOSF),
        .ReadCol(Read_PMOS_NOSF),
        .FreezeCol(FREEZE_PMOS_NOSF),
        .BcidCol(bcid_matrix_type[0])
    );
    
    readout readout_PMOS
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadPMOS),
        .Freeze(FreezePMOS), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[1]),
        .Enable(conf.EN_PMOS),
        .DataOut(DataOutPMOS),
        .TokenOut(TokenPMOS),
        .TokColB(nTOK_PMOS),
        .DataCol(Data_PMOS),
        .ReadCol(Read_PMOS),
        .FreezeCol(FREEZE_PMOS),
        .BcidCol(bcid_matrix_type[1])
    );
    
    readout readout_COMP
    (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(ReadCOMP),
        .Freeze(FreezeCOMP), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[2]),
        .Enable(conf.EN_COMP),
        .DataOut(DataOutCOMP),
        .TokenOut(TokenCOMP),
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
        .Read(ReadHV),
        .Freeze(FreezeHV), 
        .Bcid(bcid_gray),
        .EnTestPattern(conf.EN_TEST_PATTERN[3]),
        .Enable(conf.EN_HV),
        .DataOut(DataOutHV),
        .TokenOut(TokenHV),
        .TokColB(nTOK_HV),
        .DataCol(Data_HV),
        .ReadCol(Read_HV),
        .FreezeCol(FREEZE_HV),
        .BcidCol(bcid_matrix_type[3])
    );
    
    always_comb begin
        HitOr[0] = |DIG_MON_PMOS_NOSF;
        HitOr[1] = |DIG_MON_PMOS;
        HitOr[2] = |DIG_MON_COMP;
        HitOr[3] = |DIG_MON_HV;
    end

endmodule
