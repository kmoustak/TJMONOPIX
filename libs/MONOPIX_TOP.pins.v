module MONOPIX_TOP ( DIG_MON_COMP, DIG_MON_HV, DIG_MON_PMOS, DIG_MON_PMOS_NOSF,
Data_COMP, Data_HV, Data_PMOS, Data_PMOS_NOSF, nTOK_COMP, nTOK_HV, nTOK_PMOS,
nTOK_PMOS_NOSF, BiasSF_PAD, DACMON_IBIAS_PAD, DACMON_ICASN_PAD, DACMON_IDB_PAD,
DACMON_IRESET_PAD, DACMON_ITHR_PAD, DACMON_VCASN_DAC_PAD, DACMON_VH_PAD, DACMON_VL_PAD,
DACMON_VRESET_P_PAD, GNDA, GNDA_DAC, GNDD, GNDP, HV_DIODE, OUTA_MON_L_PAD, OUTA_MON_R_PAD,
PSUB, PWELL, VCASN_DAC_MON_L_PAD, VCASN_DAC_MON_R_PAD, VCASN_MON_L_PAD, VCASN_MON_R_PAD,
VDDA, VDDA_DAC, VDDD, VDDP, VPCNOSF, VPC_PAD, BcidMtx, DIG_MON_SEL, FREEZE_COMP,
FREEZE_HV, FREEZE_PMOS, FREEZE_PMOS_NOSF, INJ_IN, INJ_IN_MON_L, INJ_IN_MON_R,
INJ_ROW, MASKD, MASKH, MASKV, Read_COMP, Read_HV, Read_PMOS, Read_PMOS_NOSF,
SET_IBIAS, SET_IBUFN_L, SET_IBUFN_R, SET_IBUFP_L, SET_IBUFP_R, SET_ICASN, SET_IDB,
SET_IRESET, SET_IRESET_BIT, SET_ITHR, SET_VCASN, SET_VCLIP, SET_VH, SET_VL,
SET_VRESET_D, SET_VRESET_P, SWCNTL_DACMONI, SWCNTL_DACMONV, SWCNTL_IBIAS, SWCNTL_ICASN,
SWCNTL_IDB, SWCNTL_IREF, SWCNTL_IRESET, SWCNTL_ITHR, SWCNTL_VCASN, SWCNTL_VCLIP,
SWCNTL_VH, SWCNTL_VL, SWCNTL_VRESET_D, SWCNTL_VRESET_P, nRST );

//POWER
  inout VDDA;
  inout VDDA_DAC;
  inout VDDD;
  inout VDDP;
  inout HV_DIODE;

  inout GNDA;
  inout GNDA_DAC;
  inout GNDD;
  inout GNDP;
  inout PSUB;
  inout PWELL;

//Analog
  inout BiasSF_PAD;
  inout VPC_PAD;
  inout VPCNOSF;

  //Analog out
  inout  [3:0] OUTA_MON_L_PAD;
  inout  [3:0] OUTA_MON_R_PAD;
  inout VCASN_DAC_MON_L_PAD;
  inout VCASN_DAC_MON_R_PAD;
  inout VCASN_MON_L_PAD;
  inout VCASN_MON_R_PAD;

  //Analog in-out (override/monitor)
  inout DACMON_IBIAS_PAD;
  inout DACMON_IDB_PAD;
  inout DACMON_ITHR_PAD;
  inout DACMON_IRESET_PAD;
  inout DACMON_ICASN_PAD;

  inout DACMON_VRESET_P_PAD;
  inout DACMON_VL_PAD;
  inout DACMON_VH_PAD;
  inout DACMON_VCASN_DAC_PAD;

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
  input  [223:0] nRST;
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
