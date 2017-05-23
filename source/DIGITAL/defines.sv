
`ifndef DEFINES_SV
`define DEFINES_SV

typedef struct packed {
    
    logic [0:447]   COL_PULSE_SEL;
    logic [0:0]     INJ_IN_MON_L;
    logic [0:0]     INJ_IN_MON_R;
        
    logic [0:223]    INJ_ROW;
    logic [0:447]    MASKV;
    logic [0:223]    MASKH;
    logic [0:447]    MASKD;
    logic [0:447]    DIG_MON_SEL;
    
    logic [127:0]    IBIAS;
    logic [127:0]    ITHR;
    logic [127:0]    IDB;
    logic [127:0]    IRESET;
    logic [127:0]    ICASN;
    
    logic [127:0]    VCASN;
    logic [127:0]    VRESET_D;
    logic [127:0]    VL;
    logic [127:0]    VH;
    logic [127:0]    VCLIP;
    logic [127:0]    VRESET_P;
    logic [0:0]      IRESET_BIT;
    
    logic [3:0]  IBUFN_R;
    logic [3:0]  IBUFP_R;
    logic [3:0]  IBUFP_L;
    logic [3:0]  IBUFN_L;
    
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
    
    
    logic [3:0] EN_TEST_PATTERN;
    
    logic [55:0] EN_PMOS;
    logic [55:0] EN_PMOS_DPW;
    logic [55:0] EN_COMP;
    logic [55:0] EN_HV;
    
    logic [3:0] EN_HITOR_OUT;
    logic [3:0] EN_OUT;
    
} t_conf;


`endif // DEFINES_SV