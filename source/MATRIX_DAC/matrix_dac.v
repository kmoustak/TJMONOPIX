//Verilog HDL for "TJ_Monopix_01", "matrix_dac" "functional"

//`include "../sim/mono_pixel.sv"

module matrix_dac ( DIG_MON_COMP, DIG_MON_HV, DIG_MON_PMOS, DIG_MON_PMOS_NOSF,
Data_COMP, Data_HV, Data_PMOS, Data_PMOS_NOSF, nTOK_COMP, nTOK_HV, nTOK_PMOS,
nTOK_PMOS_NOSF, BiasSF, DACMON_IBIAS, DACMON_ICASN, DACMON_IDB, DACMON_IRESET,
DACMON_ITHR, DACMON_VCASN_DAC, DACMON_VH, DACMON_VL, DACMON_VRESET_P, GNDA,
GNDA_IDAC, GNDA_VDAC, GNDD, GNDP, HV_DIODE, OUTA_MON_L, OUTA_MON_R, PSUB, PWELL,
VCASN_DAC_MON_L, VCASN_DAC_MON_R, VCASN_MON_L, VCASN_MON_R, VDDA, VDDA_IDAC,
VDDA_VDAC, VDDD, VDDP, VPC, VPCNOSF, BcidMtx, DIG_MON_SEL, FREEZE_COMP, FREEZE_HV,
FREEZE_PMOS, FREEZE_PMOS_NOSF, INJ_IN, INJ_IN_MON_L, INJ_IN_MON_R, INJ_ROW,
MASKD, MASKH, MASKV, Read_COMP, Read_HV, Read_PMOS, Read_PMOS_NOSF, SET_IBIAS,
SET_IBUFN_L, SET_IBUFN_R, SET_IBUFP_L, SET_IBUFP_R, SET_ICASN, SET_IDB, SET_IRESET,
SET_IRESET_BIT, SET_ITHR, SET_VCASN, SET_VCLIP, SET_VH, SET_VL, SET_VRESET_D,
SET_VRESET_P, SWCNTL_DACMONI, SWCNTL_DACMONV, SWCNTL_IBIAS, SWCNTL_ICASN, SWCNTL_IDB,
SWCNTL_IREF, SWCNTL_IRESET, SWCNTL_ITHR, SWCNTL_VCASN, SWCNTL_VCLIP, SWCNTL_VH,
SWCNTL_VL, SWCNTL_VRESET_D, SWCNTL_VRESET_P, nRST );

//POWER
  inout VDDA;
  inout VDDA_IDAC;
  inout VDDA_VDAC;
  inout VDDD;
  inout VDDP;
  inout HV_DIODE;

  inout GNDA;
  inout GNDA_IDAC;
  inout GNDA_VDAC;
  inout GNDD;
  inout GNDP;
  inout PSUB;
  inout PWELL;

//Analog
  inout BiasSF;
  inout VPC;
  inout VPCNOSF;

  //Analog out
  inout  [3:0] OUTA_MON_L;
  inout  [3:0] OUTA_MON_R;
  inout VCASN_DAC_MON_L;
  inout VCASN_DAC_MON_R;
  inout VCASN_MON_L;
  inout VCASN_MON_R;

  //Analog in-out (override/monitor)
  inout DACMON_IBIAS;
  inout DACMON_IDB;
  inout DACMON_ITHR;
  inout DACMON_IRESET;
  inout DACMON_ICASN;

  inout DACMON_VRESET_P;
  inout DACMON_VL;
  inout DACMON_VH;
  inout DACMON_VCASN_DAC;

//Digital Input
  //Configuration DAC
  input  [127:0] SET_VRESET_P;
  input  [127:0] SET_VH;
  input  [127:0] SET_VL;
  input  [127:0] SET_VCASN;
  input  [127:0] SET_VRESET_D;
  input  [127:0] SET_VCLIP;

  input  [127:0] SET_IBIAS;
  input  [127:0] SET_IDB;
  input  [127:0] SET_ITHR;
  input  [127:0] SET_IRESET;
  input  [127:0] SET_ICASN;

  input  [3:0] SET_IBUFN_L;
  input  [3:0] SET_IBUFN_R;
  input  [3:0] SET_IBUFP_L;
  input  [3:0] SET_IBUFP_R;

  input SET_IRESET_BIT;

  input SWCNTL_DACMONI;
  input SWCNTL_DACMONV;
  input SWCNTL_IBIAS;
  input SWCNTL_ICASN;
  input SWCNTL_IDB;
  input SWCNTL_IREF;
  input SWCNTL_IRESET;
  input SWCNTL_ITHR;
  input SWCNTL_VCASN;
  input SWCNTL_VCLIP;
  input SWCNTL_VH;
  input SWCNTL_VL;
  input SWCNTL_VRESET_D;
  input SWCNTL_VRESET_P;

  //Configuration Matrix
  input  [447:0] MASKV;
  input  [223:0] MASKH;
  input  [447:0] MASKD;

  input  [223:0] INJ_ROW;
  input  [447:0] DIG_MON_SEL;

  //Pulsing
  input  [447:0] INJ_IN;
  input INJ_IN_MON_L;
  input INJ_IN_MON_R;

  //Readout
  input nRST;
  input  [1343:0] BcidMtx;
  input  [55:0] Read_PMOS_NOSF;
  input  [55:0] Read_PMOS;
  input  [55:0] Read_COMP;
  input  [55:0] Read_HV;
  input  [55:0] FREEZE_PMOS_NOSF;
  input  [55:0] FREEZE_PMOS;
  input  [55:0] FREEZE_COMP;
  input  [55:0] FREEZE_HV;

//Digital Output
  //HITOR
  output  [111:0] DIG_MON_PMOS_NOSF;
  output  [111:0] DIG_MON_PMOS;
  output  [111:0] DIG_MON_COMP;
  output  [111:0] DIG_MON_HV;

  //Readout
  output  [55:0] nTOK_PMOS_NOSF;
  output  [55:0] nTOK_PMOS;
  output  [55:0] nTOK_COMP;
  output  [55:0] nTOK_HV;
  output  [1175:0] Data_PMOS_NOSF;
  output  [1175:0] Data_PMOS;
  output  [1175:0] Data_COMP;
  output  [1175:0] Data_HV;
  
endmodule
