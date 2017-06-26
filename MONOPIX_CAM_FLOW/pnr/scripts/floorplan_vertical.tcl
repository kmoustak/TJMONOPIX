
## List of modifications
##
## 2015 03 17 CAM Modified according to the refactoring of the netlist


############################
# Die and core geometry
############################

setDrawView fplan     ;
deleteAllFPObjects    ;
floorPlan -site CoreSite -d 18200 9000 25.0 150 25.0 8510.0
win;

############################k
# Specify box dimentitions
############################

set box1 [split [join [dbGet top.fPlan.box]]]
set X0 [lindex $box1 0]
set Y0 [lindex $box1 1]
set X1 [lindex $box1 2]
set Y1 [lindex $box1 3]



############################
# Specify black boxes
############################


################################################################################
# Module and instances boundaries and placement
################################################################################
placeInstance matrix_dac 20.0 520.0 R0

################################ PAD PLACEMENT ##################################

placeInstance DIGITAL_P_0_INST_PAD_DVDD 51.9 0.0 R0
placeInstance DIGITAL_G_0_INST_PAD_DVSS 171.9 0.0 R0
placeInstance DIGITAL_P_1_INST_PAD_DVDD 291.9 0.0 R0
placeInstance DIGITAL_G_1_INST_PAD_DVSS 411.9 0.0 R0
placeInstance DIGITAL_P_2_INST_PAD_DVDD 531.9 0.0 R0
placeInstance DIGITAL_G_2_INST_PAD_DVSS 651.9 0.0 R0
placeInstance DIGITAL_P_3_INST_PAD_DVDD 771.9 0.0 R0
placeInstance DIGITAL_G_3_INST_PAD_DVSS 891.9 0.0 R0
placeInstance DIGITAL_P_4_INST_PAD_DVDD 1011.9 0.0 R0
placeInstance DIGITAL_G_4_INST_PAD_DVSS 1131.9 0.0 R0
placeInstance DIGITAL_P_5_INST_PAD_DVDD 1251.9 0.0 R0
placeInstance DIGITAL_G_5_INST_PAD_DVSS 1371.9 0.0 R0
placeInstance DIGITAL_P_6_INST_PAD_DVDD 1491.9 0.0 R0
placeInstance DIGITAL_G_6_INST_PAD_DVSS 1611.9 0.0 R0
placeInstance DIGITAL_P_7_INST_PAD_DVDD 1731.9 0.0 R0
placeInstance DIGITAL_G_7_INST_PAD_DVSS 1851.9 0.0 R0
placeInstance DIGITAL_P_8_INST_PAD_DVDD 1971.9 0.0 R0
placeInstance DIGITAL_G_8_INST_PAD_DVSS 2091.9 0.0 R0
placeInstance DIGITAL_P_9_INST_PAD_DVDD 2211.9 0.0 R0
placeInstance DIGITAL_G_9_INST_PAD_DVSS 2331.9 0.0 R0
placeInstance DIGITAL_P_10_INST_PAD_DVDD 2451.9 0.0 R0
placeInstance DIGITAL_G_10_INST_PAD_DVSS 2571.9 0.0 R0
placeInstance DIGITAL_P_11_INST_PAD_DVDD 2691.9 0.0 R0
placeInstance PAD_READ_PMOS_NOSF 2811.9 0.0 R0
placeInstance DIGITAL_G_11_INST_PAD_DVSS 2931.9 0.0 R0
placeInstance PAD_FREEZE_PMOS_NOSF 3051.9 0.0 R0
placeInstance DIGITAL_P_12_INST_PAD_DVDD 3171.9 0.0 R0
placeInstance PAD_TOKEN_PMOS_NOSF 3291.9 0.0 R0
placeInstance DIGITAL_G_12_INST_PAD_DVSS 3411.9 0.0 R0
placeInstance PAD_OUT_PMOS_NOSF 3531.9 0.0 R0
placeInstance DIGITAL_P_13_INST_PAD_DVDD 3651.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS_NOSF 3771.9 0.0 R0
placeInstance DIGITAL_G_13_INST_PAD_DVSS 3891.9 0.0 R0
placeInstance PAD_nOUT_PMOS_NOSF 4011.9 0.0 R0
placeInstance DIGITAL_P_14_INST_PAD_DVDD 4131.9 0.0 R0
placeInstance PAD_HIT_OR0 4251.9 0.0 R0
placeInstance DIGITAL_G_14_INST_PAD_DVSS 4371.9 0.0 R0
placeInstance PAD_nHIT_OR0 4491.9 0.0 R0
placeInstance DIGITAL_P_15_INST_PAD_DVDD 4611.9 0.0 R0
placeInstance DIGITAL_G_15_INST_PAD_DVSS 4731.9 0.0 R0
placeInstance DIGITAL_P_16_INST_PAD_DVDD 4851.9 0.0 R0
placeInstance DIGITAL_G_16_INST_PAD_DVSS 4971.9 0.0 R0
placeInstance DIGITAL_P_17_INST_PAD_DVDD 5091.9 0.0 R0
placeInstance DIGITAL_G_17_INST_PAD_DVSS 5211.9 0.0 R0
placeInstance DIGITAL_P_18_INST_PAD_DVDD 5331.9 0.0 R0
placeInstance DIGITAL_G_18_INST_PAD_DVSS 5451.9 0.0 R0
placeInstance DIGITAL_P_19_INST_PAD_DVDD 5571.9 0.0 R0
placeInstance DIGITAL_G_19_INST_PAD_DVSS 5691.9 0.0 R0
placeInstance DIGITAL_P_20_INST_PAD_DVDD 5811.9 0.0 R0
placeInstance DIGITAL_G_20_INST_PAD_DVSS 5931.9 0.0 R0
placeInstance DIGITAL_P_21_INST_PAD_DVDD 6051.9 0.0 R0
placeInstance PAD_READ_PMOS 6171.9 0.0 R0
placeInstance DIGITAL_G_21_INST_PAD_DVSS 6291.9 0.0 R0
placeInstance PAD_FREEZE_PMOS 6411.9 0.0 R0
placeInstance DIGITAL_P_22_INST_PAD_DVDD 6531.9 0.0 R0
placeInstance PAD_TOKEN_PMOS 6651.9 0.0 R0
placeInstance DIGITAL_G_22_INST_PAD_DVSS 6771.9 0.0 R0
placeInstance PAD_OUT_PMOS 6891.9 0.0 R0
placeInstance DIGITAL_P_23_INST_PAD_DVDD 7011.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS 7131.9 0.0 R0
placeInstance DIGITAL_G_23_INST_PAD_DVSS 7251.9 0.0 R0
placeInstance PAD_nOUT_PMOS 7371.9 0.0 R0
placeInstance DIGITAL_P_24_INST_PAD_DVDD 7491.9 0.0 R0
placeInstance PAD_HIT_OR1 7611.9 0.0 R0
placeInstance DIGITAL_G_24_INST_PAD_DVSS 7731.9 0.0 R0
placeInstance PAD_nHIT_OR1 7851.9 0.0 R0
placeInstance DIGITAL_P_25_INST_PAD_DVDD 7971.9 0.0 R0
placeInstance PAD_DEF_CONF 8091.9 0.0 R0
placeInstance DIGITAL_G_25_INST_PAD_DVSS 8211.9 0.0 R0
placeInstance PAD_CLK_CONF 8331.9 0.0 R0
placeInstance DIGITAL_P_26_INST_PAD_DVDD 8451.9 0.0 R0
placeInstance PAD_LD_CONF 8571.9 0.0 R0
placeInstance DIGITAL_G_26_INST_PAD_DVSS 8691.9 0.0 R0
placeInstance PAD_SI_CONF 8811.9 0.0 R0
placeInstance DIGITAL_P_27_INST_PAD_DVDD 8931.9 0.0 R0
placeInstance PAD_SO_CONF 9051.9 0.0 R0
placeInstance DIGITAL_G_27_INST_PAD_DVSS 9171.9 0.0 R0
placeInstance PAD_RST_N 9291.9 0.0 R0
placeInstance DIGITAL_P_28_INST_PAD_DVDD 9411.9 0.0 R0
placeInstance PAD_CLK_BX 9531.9 0.0 R0
placeInstance DIGITAL_G_28_INST_PAD_DVSS 9651.9 0.0 R0
placeInstance PAD_CLK_OUT 9771.9 0.0 R0
placeInstance DIGITAL_P_29_INST_PAD_DVDD 9891.9 0.0 R0
placeInstance PAD_RESET_BCID 10011.9 0.0 R0
placeInstance DIGITAL_G_29_INST_PAD_DVSS 10131.9 0.0 R0
placeInstance PAD_PULSE 10251.9 0.0 R0
placeInstance DIGITAL_P_30_INST_PAD_DVDD 10371.9 0.0 R0
placeInstance DIGITAL_G_30_INST_PAD_DVSS 10491.9 0.0 R0
placeInstance DIGITAL_P_31_INST_PAD_DVDD 10611.9 0.0 R0
placeInstance DIGITAL_G_31_INST_PAD_DVSS 10731.9 0.0 R0
placeInstance DIGITAL_P_32_INST_PAD_DVDD 10851.9 0.0 R0
placeInstance DIGITAL_G_32_INST_PAD_DVSS 10971.9 0.0 R0
placeInstance DIGITAL_P_33_INST_PAD_DVDD 11091.9 0.0 R0
placeInstance DIGITAL_G_33_INST_PAD_DVSS 11211.9 0.0 R0
placeInstance DIGITAL_P_34_INST_PAD_DVDD 11331.9 0.0 R0
placeInstance DIGITAL_G_34_INST_PAD_DVSS 11451.9 0.0 R0
placeInstance DIGITAL_P_35_INST_PAD_DVDD 11571.9 0.0 R0
placeInstance DIGITAL_G_35_INST_PAD_DVSS 11691.9 0.0 R0
placeInstance DIGITAL_P_36_INST_PAD_DVDD 11811.9 0.0 R0
placeInstance PAD_READ_COMP 11931.9 0.0 R0
placeInstance DIGITAL_G_36_INST_PAD_DVSS 12051.9 0.0 R0
placeInstance PAD_FREEZE_COMP 12171.9 0.0 R0
placeInstance DIGITAL_P_37_INST_PAD_DVDD 12291.9 0.0 R0
placeInstance PAD_TOKEN_COMP 12411.9 0.0 R0
placeInstance DIGITAL_G_37_INST_PAD_DVSS 12531.9 0.0 R0
placeInstance PAD_OUT_COMP 12651.9 0.0 R0
placeInstance DIGITAL_P_38_INST_PAD_DVDD 12771.9 0.0 R0
placeInstance PAD_nTOKEN_COMP 12891.9 0.0 R0
placeInstance DIGITAL_G_38_INST_PAD_DVSS 13011.9 0.0 R0
placeInstance PAD_nOUT_COMP 13131.9 0.0 R0
placeInstance DIGITAL_P_39_INST_PAD_DVDD 13251.9 0.0 R0
placeInstance PAD_HIT_OR2 13371.9 0.0 R0
placeInstance DIGITAL_G_39_INST_PAD_DVSS 13491.9 0.0 R0
placeInstance PAD_nHIT_OR2 13611.9 0.0 R0
placeInstance DIGITAL_P_40_INST_PAD_DVDD 13731.9 0.0 R0
placeInstance DIGITAL_G_40_INST_PAD_DVSS 13851.9 0.0 R0
placeInstance DIGITAL_P_41_INST_PAD_DVDD 13971.9 0.0 R0
placeInstance DIGITAL_G_41_INST_PAD_DVSS 14091.9 0.0 R0
placeInstance DIGITAL_P_42_INST_PAD_DVDD 14211.9 0.0 R0
placeInstance DIGITAL_G_42_INST_PAD_DVSS 14331.9 0.0 R0
placeInstance DIGITAL_P_43_INST_PAD_DVDD 14451.9 0.0 R0
placeInstance DIGITAL_G_43_INST_PAD_DVSS 14571.9 0.0 R0
placeInstance DIGITAL_P_44_INST_PAD_DVDD 14691.9 0.0 R0
placeInstance DIGITAL_G_44_INST_PAD_DVSS 14811.9 0.0 R0
placeInstance DIGITAL_P_45_INST_PAD_DVDD 14931.9 0.0 R0
placeInstance DIGITAL_G_45_INST_PAD_DVSS 15051.9 0.0 R0
placeInstance DIGITAL_P_46_INST_PAD_DVDD 15171.9 0.0 R0
placeInstance DIGITAL_G_46_INST_PAD_DVSS 15291.9 0.0 R0
placeInstance DIGITAL_P_47_INST_PAD_DVDD 15411.9 0.0 R0
placeInstance DIGITAL_G_47_INST_PAD_DVSS 15531.9 0.0 R0
placeInstance DIGITAL_P_48_INST_PAD_DVDD 15651.9 0.0 R0
placeInstance DIGITAL_G_48_INST_PAD_DVSS 15771.9 0.0 R0
placeInstance DIGITAL_P_49_INST_PAD_DVDD 15891.9 0.0 R0
placeInstance DIGITAL_G_49_INST_PAD_DVSS 16011.9 0.0 R0
placeInstance DIGITAL_P_50_INST_PAD_DVDD 16131.9 0.0 R0
placeInstance DIGITAL_G_50_INST_PAD_DVSS 16251.9 0.0 R0
placeInstance PAD_READ_HV 16371.9 0.0 R0
placeInstance DIGITAL_P_51_INST_PAD_DVDD 16491.9 0.0 R0
placeInstance PAD_FREEZE_HV 16611.9 0.0 R0
placeInstance DIGITAL_G_51_INST_PAD_DVSS 16731.9 0.0 R0
placeInstance PAD_TOKEN_HV 16851.9 0.0 R0
placeInstance DIGITAL_P_52_INST_PAD_DVDD 16971.9 0.0 R0
placeInstance PAD_OUT_HV 17091.9 0.0 R0
placeInstance DIGITAL_G_52_INST_PAD_DVSS 17211.9 0.0 R0
placeInstance PAD_nTOKEN_HV 17331.9 0.0 R0
placeInstance DIGITAL_P_53_INST_PAD_DVDD 17451.9 0.0 R0
placeInstance PAD_nOUT_HV 17571.9 0.0 R0
placeInstance DIGITAL_G_53_INST_PAD_DVSS 17691.9 0.0 R0
placeInstance PAD_HIT_OR3 17811.9 0.0 R0
placeInstance DIGITAL_P_54_INST_PAD_DVDD 17931.9 0.0 R0
placeInstance PAD_nHIT_OR3 18051.9 0.0 R0

############################ FILLER PLACEMENT ##################################

placeInstance FILLER_0_INST_decoupling_cap_filler 1519 00 R0
placeInstance FILLER_1_INST_decoupling_cap_filler 2719 00 R0
placeInstance FILLER_2_INST_decoupling_cap_filler 3919 00 R0
placeInstance FILLER_3_INST_decoupling_cap_filler 5119 00 R0
placeInstance FILLER_4_INST_decoupling_cap_filler 6319 00 R0
placeInstance FILLER_5_INST_decoupling_cap_filler 7519 00 R0
placeInstance FILLER_6_INST_decoupling_cap_filler 8719 00 R0
placeInstance FILLER_7_INST_decoupling_cap_filler 9919 00 R0
placeInstance FILLER_8_INST_decoupling_cap_filler 11119 00 R0
placeInstance FILLER_9_INST_decoupling_cap_filler 12319 00 R0
placeInstance FILLER_10_INST_decoupling_cap_filler 13519 00 R0
placeInstance FILLER_11_INST_decoupling_cap_filler 14719 00 R0
placeInstance FILLER_12_INST_decoupling_cap_filler 15919 00 R0
placeInstance FILLER_13_INST_decoupling_cap_filler 17119 00 R0
placeInstance FILLER_14_INST_decoupling_cap_filler 18319 00 R0
placeInstance FILLER_15_INST_decoupling_cap_filler 19519 00 R0
placeInstance FILLER_16_INST_decoupling_cap_filler 20719 00 R0
placeInstance FILLER_17_INST_decoupling_cap_filler 21919 00 R0
placeInstance FILLER_18_INST_decoupling_cap_filler 23119 00 R0
placeInstance FILLER_19_INST_decoupling_cap_filler 24319 00 R0
placeInstance FILLER_20_INST_decoupling_cap_filler 25519 00 R0
placeInstance FILLER_21_INST_decoupling_cap_filler 26719 00 R0
placeInstance FILLER_22_INST_decoupling_cap_filler 27919 00 R0
placeInstance FILLER_23_INST_decoupling_cap_filler 29119 00 R0
placeInstance FILLER_24_INST_decoupling_cap_filler 30319 00 R0
placeInstance FILLER_25_INST_decoupling_cap_filler 31519 00 R0
placeInstance FILLER_26_INST_decoupling_cap_filler 32719 00 R0
placeInstance FILLER_27_INST_decoupling_cap_filler 33919 00 R0
placeInstance FILLER_28_INST_decoupling_cap_filler 35119 00 R0
placeInstance FILLER_29_INST_decoupling_cap_filler 36319 00 R0
placeInstance FILLER_30_INST_decoupling_cap_filler 37519 00 R0
placeInstance FILLER_31_INST_decoupling_cap_filler 38719 00 R0
placeInstance FILLER_32_INST_decoupling_cap_filler 39919 00 R0
placeInstance FILLER_33_INST_decoupling_cap_filler 41119 00 R0
placeInstance FILLER_34_INST_decoupling_cap_filler 42319 00 R0
placeInstance FILLER_35_INST_decoupling_cap_filler 43519 00 R0
placeInstance FILLER_36_INST_decoupling_cap_filler 44719 00 R0
placeInstance FILLER_37_INST_decoupling_cap_filler 45919 00 R0
placeInstance FILLER_38_INST_decoupling_cap_filler 47119 00 R0
placeInstance FILLER_39_INST_decoupling_cap_filler 48319 00 R0
placeInstance FILLER_40_INST_decoupling_cap_filler 49519 00 R0
placeInstance FILLER_41_INST_decoupling_cap_filler 50719 00 R0
placeInstance FILLER_42_INST_decoupling_cap_filler 51919 00 R0
placeInstance FILLER_43_INST_decoupling_cap_filler 53119 00 R0
placeInstance FILLER_44_INST_decoupling_cap_filler 54319 00 R0
placeInstance FILLER_45_INST_decoupling_cap_filler 55519 00 R0
placeInstance FILLER_46_INST_decoupling_cap_filler 56719 00 R0
placeInstance FILLER_47_INST_decoupling_cap_filler 57919 00 R0
placeInstance FILLER_48_INST_decoupling_cap_filler 59119 00 R0
placeInstance FILLER_49_INST_decoupling_cap_filler 60319 00 R0
placeInstance FILLER_50_INST_decoupling_cap_filler 61519 00 R0
placeInstance FILLER_51_INST_decoupling_cap_filler 62719 00 R0
placeInstance FILLER_52_INST_decoupling_cap_filler 63919 00 R0
placeInstance FILLER_53_INST_decoupling_cap_filler 65119 00 R0
placeInstance FILLER_54_INST_decoupling_cap_filler 66319 00 R0
placeInstance FILLER_55_INST_decoupling_cap_filler 67519 00 R0
placeInstance FILLER_56_INST_decoupling_cap_filler 68719 00 R0
placeInstance FILLER_57_INST_decoupling_cap_filler 69919 00 R0
placeInstance FILLER_58_INST_decoupling_cap_filler 71119 00 R0
placeInstance FILLER_59_INST_decoupling_cap_filler 72319 00 R0
placeInstance FILLER_60_INST_decoupling_cap_filler 73519 00 R0
placeInstance FILLER_61_INST_decoupling_cap_filler 74719 00 R0
placeInstance FILLER_62_INST_decoupling_cap_filler 75919 00 R0
placeInstance FILLER_63_INST_decoupling_cap_filler 77119 00 R0
placeInstance FILLER_64_INST_decoupling_cap_filler 78319 00 R0
placeInstance FILLER_65_INST_decoupling_cap_filler 79519 00 R0
placeInstance FILLER_66_INST_decoupling_cap_filler 80719 00 R0
placeInstance FILLER_67_INST_decoupling_cap_filler 81919 00 R0
placeInstance FILLER_68_INST_decoupling_cap_filler 83119 00 R0
placeInstance FILLER_69_INST_decoupling_cap_filler 84319 00 R0
placeInstance FILLER_70_INST_decoupling_cap_filler 85519 00 R0
placeInstance FILLER_71_INST_decoupling_cap_filler 86719 00 R0
placeInstance FILLER_72_INST_decoupling_cap_filler 87919 00 R0
placeInstance FILLER_73_INST_decoupling_cap_filler 89119 00 R0
placeInstance FILLER_74_INST_decoupling_cap_filler 90319 00 R0
placeInstance FILLER_75_INST_decoupling_cap_filler 91519 00 R0
placeInstance FILLER_76_INST_decoupling_cap_filler 92719 00 R0
placeInstance FILLER_77_INST_decoupling_cap_filler 93919 00 R0
placeInstance FILLER_78_INST_decoupling_cap_filler 95119 00 R0
placeInstance FILLER_79_INST_decoupling_cap_filler 96319 00 R0
placeInstance FILLER_80_INST_decoupling_cap_filler 97519 00 R0
placeInstance FILLER_81_INST_decoupling_cap_filler 98719 00 R0
placeInstance FILLER_82_INST_decoupling_cap_filler 99919 00 R0
placeInstance FILLER_83_INST_decoupling_cap_filler 101119 00 R0
placeInstance FILLER_84_INST_decoupling_cap_filler 102319 00 R0
placeInstance FILLER_85_INST_decoupling_cap_filler 103519 00 R0
placeInstance FILLER_86_INST_decoupling_cap_filler 104719 00 R0
placeInstance FILLER_87_INST_decoupling_cap_filler 105919 00 R0
placeInstance FILLER_88_INST_decoupling_cap_filler 107119 00 R0
placeInstance FILLER_89_INST_decoupling_cap_filler 108319 00 R0
placeInstance FILLER_90_INST_decoupling_cap_filler 109519 00 R0
placeInstance FILLER_91_INST_decoupling_cap_filler 110719 00 R0
placeInstance FILLER_92_INST_decoupling_cap_filler 111919 00 R0
placeInstance FILLER_93_INST_decoupling_cap_filler 113119 00 R0
placeInstance FILLER_94_INST_decoupling_cap_filler 114319 00 R0
placeInstance FILLER_95_INST_decoupling_cap_filler 115519 00 R0
placeInstance FILLER_96_INST_decoupling_cap_filler 116719 00 R0
placeInstance FILLER_97_INST_decoupling_cap_filler 117919 00 R0
placeInstance FILLER_98_INST_decoupling_cap_filler 119119 00 R0
placeInstance FILLER_99_INST_decoupling_cap_filler 120319 00 R0
placeInstance FILLER_100_INST_decoupling_cap_filler 121519 00 R0
placeInstance FILLER_101_INST_decoupling_cap_filler 122719 00 R0
placeInstance FILLER_102_INST_decoupling_cap_filler 123919 00 R0
placeInstance FILLER_103_INST_decoupling_cap_filler 125119 00 R0
placeInstance FILLER_104_INST_decoupling_cap_filler 126319 00 R0
placeInstance FILLER_105_INST_decoupling_cap_filler 127519 00 R0
placeInstance FILLER_106_INST_decoupling_cap_filler 128719 00 R0
placeInstance FILLER_107_INST_decoupling_cap_filler 129919 00 R0
placeInstance FILLER_108_INST_decoupling_cap_filler 131119 00 R0
placeInstance FILLER_109_INST_decoupling_cap_filler 132319 00 R0
placeInstance FILLER_110_INST_decoupling_cap_filler 133519 00 R0
placeInstance FILLER_111_INST_decoupling_cap_filler 134719 00 R0
placeInstance FILLER_112_INST_decoupling_cap_filler 135919 00 R0
placeInstance FILLER_113_INST_decoupling_cap_filler 137119 00 R0
placeInstance FILLER_114_INST_decoupling_cap_filler 138319 00 R0
placeInstance FILLER_115_INST_decoupling_cap_filler 139519 00 R0
placeInstance FILLER_116_INST_decoupling_cap_filler 140719 00 R0
placeInstance FILLER_117_INST_decoupling_cap_filler 141919 00 R0
placeInstance FILLER_118_INST_decoupling_cap_filler 143119 00 R0
placeInstance FILLER_119_INST_decoupling_cap_filler 144319 00 R0
placeInstance FILLER_120_INST_decoupling_cap_filler 145519 00 R0
placeInstance FILLER_121_INST_decoupling_cap_filler 146719 00 R0
placeInstance FILLER_122_INST_decoupling_cap_filler 147919 00 R0
placeInstance FILLER_123_INST_decoupling_cap_filler 149119 00 R0
placeInstance FILLER_124_INST_decoupling_cap_filler 150319 00 R0
placeInstance FILLER_125_INST_decoupling_cap_filler 151519 00 R0
placeInstance FILLER_126_INST_decoupling_cap_filler 152719 00 R0
placeInstance FILLER_127_INST_decoupling_cap_filler 153919 00 R0
placeInstance FILLER_128_INST_decoupling_cap_filler 155119 00 R0
placeInstance FILLER_129_INST_decoupling_cap_filler 156319 00 R0
placeInstance FILLER_130_INST_decoupling_cap_filler 157519 00 R0
placeInstance FILLER_131_INST_decoupling_cap_filler 158719 00 R0
placeInstance FILLER_132_INST_decoupling_cap_filler 159919 00 R0
placeInstance FILLER_133_INST_decoupling_cap_filler 161119 00 R0
placeInstance FILLER_134_INST_decoupling_cap_filler 162319 00 R0
placeInstance FILLER_135_INST_decoupling_cap_filler 163519 00 R0
placeInstance FILLER_136_INST_decoupling_cap_filler 164719 00 R0
placeInstance FILLER_137_INST_decoupling_cap_filler 165919 00 R0
placeInstance FILLER_138_INST_decoupling_cap_filler 167119 00 R0
placeInstance FILLER_139_INST_decoupling_cap_filler 168319 00 R0
placeInstance FILLER_140_INST_decoupling_cap_filler 169519 00 R0
placeInstance FILLER_141_INST_decoupling_cap_filler 170719 00 R0
placeInstance FILLER_142_INST_decoupling_cap_filler 171919 00 R0
placeInstance FILLER_143_INST_decoupling_cap_filler 173119 00 R0
placeInstance FILLER_144_INST_decoupling_cap_filler 174319 00 R0
placeInstance FILLER_145_INST_decoupling_cap_filler 175519 00 R0
placeInstance FILLER_146_INST_decoupling_cap_filler 176719 00 R0
placeInstance FILLER_147_INST_decoupling_cap_filler 177919 00 R0
placeInstance FILLER_148_INST_decoupling_cap_filler 179119 00 R0
placeInstance FILLER_149_INST_decoupling_cap_filler 180319 00 R0

 
setNanoRouteMode -quiet -dbSkipAnalog true

set topPinPatts { DEF_CONF_PAD CLK_CONF_PAD LD_CONF_PAD SI_CONF_PAD SO_CONF_PAD RST_N_PAD CLK_BX_PAD CLK_OUT_PAD RESET_BCID_PAD READ_PMOS_NOSF_PAD READ_PMOS_PAD READ_COMP_PAD READ_HV_PAD FREEZE_PMOS_NOSF_PAD FREEZE_PMOS_PAD FREEZE_COMP_PAD FREEZE_HV_PAD TOKEN_PMOS_NOSF_PAD TOKEN_PMOS_PAD TOKEN_COMP_PAD TOKEN_HV_PAD OUT_PMOS_NOSF_PAD OUT_PMOS_PAD OUT_COMP_PAD OUT_HV_PAD PULSE_PAD HIT_OR_PAD[3] HIT_OR_PAD[2] HIT_OR_PAD[1] HIT_OR_PAD[0] BiasSF VPC VPCNOSF DACMON_BIAS DACMON_IDB DACMON_ITHR DACMON_IRESET DACMON_ICASN DACMON_VRESET_P DACMON_VL DACMON_VH DACMON_VCASN_DAC OUTA_MON_L[3] OUTA_MON_L[2] OUTA_MON_L[1] OUTA_MON_L[0] OUTA_MON_R[3] OUTA_MON_R[2] OUTA_MON_R[1] OUTA_MON_R[0] VCASN_MON_L VCASN_DAC_MON_L VCASN_MON_R VCASN_DAC_MON_R VDDA GNDA VDDD GNDD VDDA_IDAC GNDA_IDAC VDDA_VDAC GNDA_VDAC VDDP GNDP PSUB PWELL HV_DIODE TOKEN_PMOS_NOSF_N_PAD TOKEN_PMOS_N_PAD TOKEN_COMP_N_PAD TOKEN_HV_N_PAD OUT_PMOS_NOSF_N_PAD OUT_PMOS_N_PAD OUT_COMP_N_PAD OUT_HV_N_PAD HIT_OR_N_PAD[0] HIT_OR_N_PAD[1] HIT_OR_N_PAD[2] HIT_OR_N_PAD[3] DACMON_IBIAS}

foreach topPinPatt $topPinPatts {
    set topPinPtrs [dbGet -p top.terms.name $topPinPatt]
    if { $topPinPtrs ne 0x0} {
        dbSet [dbGet -p top.nets.name $topPinPatt].isAnalog 1
        dbSet [dbGet -p top.nets.name $topPinPatt].isTrialRouted 1
        dbSet [dbGet -p top.nets.name $topPinPatt].isDontTouch 1
        dbSet [dbGet -p top.nets.name $topPinPatt].skipRouting 1

        foreach pin $topPinPtrs {
            set termPtr [lindex [dbGet $pin.net.allTerms] end]
            set termName [dbGet $termPtr.name]
            set pin_name [dbget $pin.name]
            set pin_pt [dbGet $termPtr.pt]
            set pin_layer [dbGet $termPtr.layer.name]

            puts "Top-level pin $pin_name will be moved to INST pin $termName location and fixed in place"
            editPin -fixedPin 1 -layer $pin_layer -pin $pin_name -assign $pin_pt -snap MGRID -pinDepth 0.25 -pinWidth 0.25 -side inside -fixOverlap 0 -honorConstraint 0 

         }
    }   
}

#saveDesign $SAVE_DESIGN_FP_FILE
#saveFPlan $SAVE_FP_FILE
saveDesign -cellview "$oaLibName $DESIGN fplan"

