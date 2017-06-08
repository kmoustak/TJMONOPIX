
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win



set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set floorplan_default_site CoreSite
set fpIsMaxIoHeight 0
set init_gnd_net GNDP
set init_lef_file {/cadence/kits/TOWER/ts18is/std_cells_TOWER_Cds6_Iphc/SRC/Std_cells/FS120_STD_Cells_0_18um_2005_12/DW_TOWER_tsl18fs120/2005.12/cds/lef/tsl18_6lm_tech.lef /cadence/kits/TOWER/ts18is/std_cells_TOWER_Cds6_Iphc/SRC/Std_cells/FS120_STD_Cells_0_18um_2005_12/DW_TOWER_tsl18fs120/2005.12/cds/lef/tsl18fs120.lef ../libs/matrix_dac.lef ../libs/PAD_DVDD.lef ../libs/PAD_DVSS.lef ../libs/Pulldown_pol_IO.lef ../libs/decoupling_cap_filler.lef}
set init_oa_search_lib {}
set init_pwr_net {VDDP }
set init_verilog output/r2g.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design



globalNetConnect VDDP -type pgpin -pin VDD -inst *
globalNetConnect GNDP -type pgpin -pin VSS -inst *

globalNetConnect VDDP -type pgpin -pin VDDP -inst *
globalNetConnect GNDP -type pgpin -pin GNDP -inst *

globalNetConnect VDDP -type pgpin -pin VDD_Per -inst *
globalNetConnect GNDP -type pgpin -pin GND_Per -inst *

globalNetConnect VDDP -type pgpin -pin DVDD -inst *
globalNetConnect GNDP -type pgpin -pin DVSS -inst *



#floorPlan -site CoreSite -d 18200 9000 10.0 130 10.0 8400

floorPlan -site CoreSite -d 18200 9000 25.0 145 25.0 8500.0

placeInstance matrix_dac 20.0 520.0 R0

################################ PAD PLACEMENT ##################################

placeInstance DIGITAL[0].INST_PAD_DVDD 71.9 0.0 R0
placeInstance DIGITAL[0].INST_PAD_DVSS 191.9 0.0 R0
placeInstance DIGITAL[1].INST_PAD_DVDD 311.9 0.0 R0
placeInstance DIGITAL[1].INST_PAD_DVSS 431.9 0.0 R0
placeInstance DIGITAL[2].INST_PAD_DVDD 551.9 0.0 R0
placeInstance DIGITAL[2].INST_PAD_DVSS 671.9 0.0 R0
placeInstance DIGITAL[3].INST_PAD_DVDD 791.9 0.0 R0
placeInstance DIGITAL[3].INST_PAD_DVSS 911.9 0.0 R0
placeInstance DIGITAL[4].INST_PAD_DVDD 1031.9 0.0 R0
placeInstance DIGITAL[4].INST_PAD_DVSS 1151.9 0.0 R0
placeInstance DIGITAL[5].INST_PAD_DVDD 1271.9 0.0 R0
placeInstance DIGITAL[5].INST_PAD_DVSS 1391.9 0.0 R0
placeInstance DIGITAL[6].INST_PAD_DVDD 1511.9 0.0 R0
placeInstance DIGITAL[6].INST_PAD_DVSS 1631.9 0.0 R0
placeInstance DIGITAL[7].INST_PAD_DVDD 1751.9 0.0 R0
placeInstance DIGITAL[7].INST_PAD_DVSS 1871.9 0.0 R0
placeInstance DIGITAL[8].INST_PAD_DVDD 1991.9 0.0 R0
placeInstance DIGITAL[8].INST_PAD_DVSS 2111.9 0.0 R0
placeInstance DIGITAL[9].INST_PAD_DVDD 2231.9 0.0 R0
placeInstance DIGITAL[9].INST_PAD_DVSS 2351.9 0.0 R0
placeInstance DIGITAL[10].INST_PAD_DVDD 2471.9 0.0 R0
placeInstance DIGITAL[10].INST_PAD_DVSS 2591.9 0.0 R0
placeInstance DIGITAL[11].INST_PAD_DVDD 2711.9 0.0 R0
placeInstance DIGITAL[11].INST_PAD_DVSS 2831.9 0.0 R0
placeInstance PAD_READ_PMOS_NOSF 2951.9 0.0 R0
placeInstance DIGITAL[12].INST_PAD_DVDD 3071.9 0.0 R0
placeInstance PAD_FREEZE_PMOS_NOSF 3191.9 0.0 R0
placeInstance DIGITAL[12].INST_PAD_DVSS 3311.9 0.0 R0
placeInstance PAD_TOKEN_PMOS_NOSF 3431.9 0.0 R0
placeInstance DIGITAL[13].INST_PAD_DVDD 3551.9 0.0 R0
placeInstance PAD_OUT_PMOS_NOSF 3671.9 0.0 R0
placeInstance DIGITAL[13].INST_PAD_DVSS 3791.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS_NOSF 3911.9 0.0 R0
placeInstance DIGITAL[14].INST_PAD_DVDD 4031.9 0.0 R0
placeInstance PAD_nOUT_PMOS_NOSF 4151.9 0.0 R0
placeInstance DIGITAL[14].INST_PAD_DVSS 4271.9 0.0 R0
placeInstance PAD_HIT_OR0 4391.9 0.0 R0
placeInstance DIGITAL[15].INST_PAD_DVDD 4511.9 0.0 R0
placeInstance PAD_nHIT_OR0 4631.9 0.0 R0
placeInstance DIGITAL[15].INST_PAD_DVSS 4751.9 0.0 R0
placeInstance DIGITAL[16].INST_PAD_DVDD 4871.9 0.0 R0
placeInstance DIGITAL[16].INST_PAD_DVSS 4991.9 0.0 R0
placeInstance DIGITAL[17].INST_PAD_DVDD 5111.9 0.0 R0
placeInstance DIGITAL[17].INST_PAD_DVSS 5231.9 0.0 R0
placeInstance DIGITAL[18].INST_PAD_DVDD 5351.9 0.0 R0
placeInstance DIGITAL[18].INST_PAD_DVSS 5471.9 0.0 R0
placeInstance DIGITAL[19].INST_PAD_DVDD 5591.9 0.0 R0
placeInstance DIGITAL[19].INST_PAD_DVSS 5711.9 0.0 R0
placeInstance DIGITAL[20].INST_PAD_DVDD 5831.9 0.0 R0
placeInstance DIGITAL[20].INST_PAD_DVSS 5951.9 0.0 R0
placeInstance DIGITAL[21].INST_PAD_DVDD 6071.9 0.0 R0
placeInstance DIGITAL[21].INST_PAD_DVSS 6191.9 0.0 R0
placeInstance PAD_READ_PMOS 6311.9 0.0 R0
placeInstance DIGITAL[22].INST_PAD_DVDD 6431.9 0.0 R0
placeInstance PAD_FREEZE_PMOS 6551.9 0.0 R0
placeInstance DIGITAL[22].INST_PAD_DVSS 6671.9 0.0 R0
placeInstance PAD_TOKEN_PMOS 6791.9 0.0 R0
placeInstance DIGITAL[23].INST_PAD_DVDD 6911.9 0.0 R0
placeInstance PAD_OUT_PMOS 7031.9 0.0 R0
placeInstance DIGITAL[23].INST_PAD_DVSS 7151.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS 7271.9 0.0 R0
placeInstance DIGITAL[24].INST_PAD_DVDD 7391.9 0.0 R0
placeInstance PAD_nOUT_PMOS 7511.9 0.0 R0
placeInstance DIGITAL[24].INST_PAD_DVSS 7631.9 0.0 R0
placeInstance PAD_HIT_OR1 7751.9 0.0 R0
placeInstance DIGITAL[25].INST_PAD_DVDD 7871.9 0.0 R0
placeInstance PAD_nHIT_OR1 7991.9 0.0 R0
placeInstance DIGITAL[25].INST_PAD_DVSS 8111.9 0.0 R0
placeInstance PAD_DEF_CONF 8231.9 0.0 R0
placeInstance DIGITAL[26].INST_PAD_DVDD 8351.9 0.0 R0
placeInstance PAD_CLK_CONF 8471.9 0.0 R0
placeInstance DIGITAL[26].INST_PAD_DVSS 8591.9 0.0 R0
placeInstance PAD_LD_CONF 8711.9 0.0 R0
placeInstance DIGITAL[27].INST_PAD_DVDD 8831.9 0.0 R0
placeInstance PAD_SI_CONF 8951.9 0.0 R0
placeInstance DIGITAL[27].INST_PAD_DVSS 9071.9 0.0 R0
placeInstance PAD_SO_CONF 9191.9 0.0 R0
placeInstance DIGITAL[28].INST_PAD_DVDD 9311.9 0.0 R0
placeInstance PAD_RST_N 9431.9 0.0 R0
placeInstance DIGITAL[28].INST_PAD_DVSS 9551.9 0.0 R0
placeInstance PAD_CLK_BX 9671.9 0.0 R0
placeInstance DIGITAL[29].INST_PAD_DVDD 9791.9 0.0 R0
placeInstance PAD_CLK_OUT 9911.9 0.0 R0
placeInstance DIGITAL[29].INST_PAD_DVSS 10031.9 0.0 R0
placeInstance PAD_RESET_BCID 10151.9 0.0 R0
placeInstance DIGITAL[30].INST_PAD_DVDD 10271.9 0.0 R0
placeInstance PAD_PULSE 10391.9 0.0 R0
placeInstance DIGITAL[30].INST_PAD_DVSS 10511.9 0.0 R0
placeInstance DIGITAL[31].INST_PAD_DVDD 10631.9 0.0 R0
placeInstance DIGITAL[31].INST_PAD_DVSS 10751.9 0.0 R0
placeInstance DIGITAL[32].INST_PAD_DVDD 10871.9 0.0 R0
placeInstance DIGITAL[32].INST_PAD_DVSS 10991.9 0.0 R0
placeInstance DIGITAL[33].INST_PAD_DVDD 11111.9 0.0 R0
placeInstance DIGITAL[33].INST_PAD_DVSS 11231.9 0.0 R0
placeInstance DIGITAL[34].INST_PAD_DVDD 11351.9 0.0 R0
placeInstance DIGITAL[34].INST_PAD_DVSS 11471.9 0.0 R0
placeInstance DIGITAL[35].INST_PAD_DVDD 11591.9 0.0 R0
placeInstance DIGITAL[35].INST_PAD_DVSS 11711.9 0.0 R0
placeInstance DIGITAL[36].INST_PAD_DVDD 11831.9 0.0 R0
placeInstance DIGITAL[36].INST_PAD_DVSS 11951.9 0.0 R0
placeInstance PAD_READ_COMP 12071.9 0.0 R0
placeInstance DIGITAL[37].INST_PAD_DVDD 12191.9 0.0 R0
placeInstance PAD_FREEZE_COMP 12311.9 0.0 R0
placeInstance DIGITAL[37].INST_PAD_DVSS 12431.9 0.0 R0
placeInstance PAD_TOKEN_COMP 12551.9 0.0 R0
placeInstance DIGITAL[38].INST_PAD_DVDD 12671.9 0.0 R0
placeInstance PAD_OUT_COMP 12791.9 0.0 R0
placeInstance DIGITAL[38].INST_PAD_DVSS 12911.9 0.0 R0
placeInstance PAD_nTOKEN_COMP 13031.9 0.0 R0
placeInstance DIGITAL[39].INST_PAD_DVDD 13151.9 0.0 R0
placeInstance PAD_nOUT_COMP 13271.9 0.0 R0
placeInstance DIGITAL[39].INST_PAD_DVSS 13391.9 0.0 R0
placeInstance PAD_HIT_OR2 13511.9 0.0 R0
placeInstance DIGITAL[40].INST_PAD_DVDD 13631.9 0.0 R0
placeInstance PAD_nHIT_OR2 13751.9 0.0 R0
placeInstance DIGITAL[40].INST_PAD_DVSS 13871.9 0.0 R0
placeInstance DIGITAL[41].INST_PAD_DVDD 13991.9 0.0 R0
placeInstance DIGITAL[41].INST_PAD_DVSS 14111.9 0.0 R0
placeInstance DIGITAL[42].INST_PAD_DVDD 14231.9 0.0 R0
placeInstance DIGITAL[42].INST_PAD_DVSS 14351.9 0.0 R0
placeInstance DIGITAL[43].INST_PAD_DVDD 14471.9 0.0 R0
placeInstance DIGITAL[43].INST_PAD_DVSS 14591.9 0.0 R0
placeInstance DIGITAL[44].INST_PAD_DVDD 14711.9 0.0 R0
placeInstance DIGITAL[44].INST_PAD_DVSS 14831.9 0.0 R0
placeInstance DIGITAL[45].INST_PAD_DVDD 14951.9 0.0 R0
placeInstance DIGITAL[45].INST_PAD_DVSS 15071.9 0.0 R0
placeInstance DIGITAL[46].INST_PAD_DVDD 15191.9 0.0 R0
placeInstance DIGITAL[46].INST_PAD_DVSS 15311.9 0.0 R0
placeInstance DIGITAL[47].INST_PAD_DVDD 15431.9 0.0 R0
placeInstance DIGITAL[47].INST_PAD_DVSS 15551.9 0.0 R0
placeInstance DIGITAL[48].INST_PAD_DVDD 15671.9 0.0 R0
placeInstance DIGITAL[48].INST_PAD_DVSS 15791.9 0.0 R0
placeInstance DIGITAL[49].INST_PAD_DVDD 15911.9 0.0 R0
placeInstance DIGITAL[49].INST_PAD_DVSS 16031.9 0.0 R0
placeInstance DIGITAL[50].INST_PAD_DVDD 16151.9 0.0 R0
placeInstance DIGITAL[50].INST_PAD_DVSS 16271.9 0.0 R0
placeInstance DIGITAL[51].INST_PAD_DVDD 16391.9 0.0 R0
placeInstance PAD_READ_HV 16511.9 0.0 R0
placeInstance DIGITAL[51].INST_PAD_DVSS 16631.9 0.0 R0
placeInstance PAD_FREEZE_HV 16751.9 0.0 R0
placeInstance DIGITAL[52].INST_PAD_DVDD 16871.9 0.0 R0
placeInstance PAD_TOKEN_HV 16991.9 0.0 R0
placeInstance DIGITAL[52].INST_PAD_DVSS 17111.9 0.0 R0
placeInstance PAD_OUT_HV 17231.9 0.0 R0
placeInstance DIGITAL[53].INST_PAD_DVDD 17351.9 0.0 R0
placeInstance PAD_nTOKEN_HV 17471.9 0.0 R0
placeInstance DIGITAL[53].INST_PAD_DVSS 17591.9 0.0 R0
placeInstance PAD_nOUT_HV 17711.9 0.0 R0
placeInstance DIGITAL[54].INST_PAD_DVDD 17831.9 0.0 R0
placeInstance PAD_HIT_OR3 17951.9 0.0 R0
placeInstance DIGITAL[54].INST_PAD_DVSS 18071.9 0.0 R0
placeInstance PAD_nHIT_OR3 18191.9 0.0 R0
placeInstance DIGITAL[55].INST_PAD_DVDD 18311.9 0.0 R0
placeInstance DIGITAL[55].INST_PAD_DVSS 18431.9 0.0 R0


############################ FILLER PLACEMENT ##################################

placeInstance FILLER[0].INST_decoupling_cap_filler 171.9 0.0 R0
placeInstance FILLER[1].INST_decoupling_cap_filler 291.9 0.0 R0
placeInstance FILLER[2].INST_decoupling_cap_filler 411.9 0.0 R0
placeInstance FILLER[3].INST_decoupling_cap_filler 531.9 0.0 R0
placeInstance FILLER[4].INST_decoupling_cap_filler 651.9 0.0 R0
placeInstance FILLER[5].INST_decoupling_cap_filler 771.9 0.0 R0
placeInstance FILLER[6].INST_decoupling_cap_filler 891.9 0.0 R0
placeInstance FILLER[7].INST_decoupling_cap_filler 1011.9 0.0 R0
placeInstance FILLER[8].INST_decoupling_cap_filler 1131.9 0.0 R0
placeInstance FILLER[9].INST_decoupling_cap_filler 1251.9 0.0 R0
placeInstance FILLER[10].INST_decoupling_cap_filler 1371.9 0.0 R0
placeInstance FILLER[11].INST_decoupling_cap_filler 1491.9 0.0 R0
placeInstance FILLER[12].INST_decoupling_cap_filler 1611.9 0.0 R0
placeInstance FILLER[13].INST_decoupling_cap_filler 1731.9 0.0 R0
placeInstance FILLER[14].INST_decoupling_cap_filler 1851.9 0.0 R0
placeInstance FILLER[15].INST_decoupling_cap_filler 1971.9 0.0 R0
placeInstance FILLER[16].INST_decoupling_cap_filler 2091.9 0.0 R0
placeInstance FILLER[17].INST_decoupling_cap_filler 2211.9 0.0 R0
placeInstance FILLER[18].INST_decoupling_cap_filler 2331.9 0.0 R0
placeInstance FILLER[19].INST_decoupling_cap_filler 2451.9 0.0 R0
placeInstance FILLER[20].INST_decoupling_cap_filler 2571.9 0.0 R0
placeInstance FILLER[21].INST_decoupling_cap_filler 2691.9 0.0 R0
placeInstance FILLER[22].INST_decoupling_cap_filler 2811.9 0.0 R0
placeInstance FILLER[23].INST_decoupling_cap_filler 2931.9 0.0 R0
placeInstance FILLER[24].INST_decoupling_cap_filler 3051.9 0.0 R0
placeInstance FILLER[25].INST_decoupling_cap_filler 3171.9 0.0 R0
placeInstance FILLER[26].INST_decoupling_cap_filler 3291.9 0.0 R0
placeInstance FILLER[27].INST_decoupling_cap_filler 3411.9 0.0 R0
placeInstance FILLER[28].INST_decoupling_cap_filler 3531.9 0.0 R0
placeInstance FILLER[29].INST_decoupling_cap_filler 3651.9 0.0 R0
placeInstance FILLER[30].INST_decoupling_cap_filler 3771.9 0.0 R0
placeInstance FILLER[31].INST_decoupling_cap_filler 3891.9 0.0 R0
placeInstance FILLER[32].INST_decoupling_cap_filler 4011.9 0.0 R0
placeInstance FILLER[33].INST_decoupling_cap_filler 4131.9 0.0 R0
placeInstance FILLER[34].INST_decoupling_cap_filler 4251.9 0.0 R0
placeInstance FILLER[35].INST_decoupling_cap_filler 4371.9 0.0 R0
placeInstance FILLER[36].INST_decoupling_cap_filler 4491.9 0.0 R0
placeInstance FILLER[37].INST_decoupling_cap_filler 4611.9 0.0 R0
placeInstance FILLER[38].INST_decoupling_cap_filler 4731.9 0.0 R0
placeInstance FILLER[39].INST_decoupling_cap_filler 4851.9 0.0 R0
placeInstance FILLER[40].INST_decoupling_cap_filler 4971.9 0.0 R0
placeInstance FILLER[41].INST_decoupling_cap_filler 5091.9 0.0 R0
placeInstance FILLER[42].INST_decoupling_cap_filler 5211.9 0.0 R0
placeInstance FILLER[43].INST_decoupling_cap_filler 5331.9 0.0 R0
placeInstance FILLER[44].INST_decoupling_cap_filler 5451.9 0.0 R0
placeInstance FILLER[45].INST_decoupling_cap_filler 5571.9 0.0 R0
placeInstance FILLER[46].INST_decoupling_cap_filler 5691.9 0.0 R0
placeInstance FILLER[47].INST_decoupling_cap_filler 5811.9 0.0 R0
placeInstance FILLER[48].INST_decoupling_cap_filler 5931.9 0.0 R0
placeInstance FILLER[49].INST_decoupling_cap_filler 6051.9 0.0 R0
placeInstance FILLER[50].INST_decoupling_cap_filler 6171.9 0.0 R0
placeInstance FILLER[51].INST_decoupling_cap_filler 6291.9 0.0 R0
placeInstance FILLER[52].INST_decoupling_cap_filler 6411.9 0.0 R0
placeInstance FILLER[53].INST_decoupling_cap_filler 6531.9 0.0 R0
placeInstance FILLER[54].INST_decoupling_cap_filler 6651.9 0.0 R0
placeInstance FILLER[55].INST_decoupling_cap_filler 6771.9 0.0 R0
placeInstance FILLER[56].INST_decoupling_cap_filler 6891.9 0.0 R0
placeInstance FILLER[57].INST_decoupling_cap_filler 7011.9 0.0 R0
placeInstance FILLER[58].INST_decoupling_cap_filler 7131.9 0.0 R0
placeInstance FILLER[59].INST_decoupling_cap_filler 7251.9 0.0 R0
placeInstance FILLER[60].INST_decoupling_cap_filler 7371.9 0.0 R0
placeInstance FILLER[61].INST_decoupling_cap_filler 7491.9 0.0 R0
placeInstance FILLER[62].INST_decoupling_cap_filler 7611.9 0.0 R0
placeInstance FILLER[63].INST_decoupling_cap_filler 7731.9 0.0 R0
placeInstance FILLER[64].INST_decoupling_cap_filler 7851.9 0.0 R0
placeInstance FILLER[65].INST_decoupling_cap_filler 7971.9 0.0 R0
placeInstance FILLER[66].INST_decoupling_cap_filler 8091.9 0.0 R0
placeInstance FILLER[67].INST_decoupling_cap_filler 8211.9 0.0 R0
placeInstance FILLER[68].INST_decoupling_cap_filler 8331.9 0.0 R0
placeInstance FILLER[69].INST_decoupling_cap_filler 8451.9 0.0 R0
placeInstance FILLER[70].INST_decoupling_cap_filler 8571.9 0.0 R0
placeInstance FILLER[71].INST_decoupling_cap_filler 8691.9 0.0 R0
placeInstance FILLER[72].INST_decoupling_cap_filler 8811.9 0.0 R0
placeInstance FILLER[73].INST_decoupling_cap_filler 8931.9 0.0 R0
placeInstance FILLER[74].INST_decoupling_cap_filler 9051.9 0.0 R0
placeInstance FILLER[75].INST_decoupling_cap_filler 9171.9 0.0 R0
placeInstance FILLER[76].INST_decoupling_cap_filler 9291.9 0.0 R0
placeInstance FILLER[77].INST_decoupling_cap_filler 9411.9 0.0 R0
placeInstance FILLER[78].INST_decoupling_cap_filler 9531.9 0.0 R0
placeInstance FILLER[79].INST_decoupling_cap_filler 9651.9 0.0 R0
placeInstance FILLER[80].INST_decoupling_cap_filler 9771.9 0.0 R0
placeInstance FILLER[81].INST_decoupling_cap_filler 9891.9 0.0 R0
placeInstance FILLER[82].INST_decoupling_cap_filler 10011.9 0.0 R0
placeInstance FILLER[83].INST_decoupling_cap_filler 10131.9 0.0 R0
placeInstance FILLER[84].INST_decoupling_cap_filler 10251.9 0.0 R0
placeInstance FILLER[85].INST_decoupling_cap_filler 10371.9 0.0 R0
placeInstance FILLER[86].INST_decoupling_cap_filler 10491.9 0.0 R0
placeInstance FILLER[87].INST_decoupling_cap_filler 10611.9 0.0 R0
placeInstance FILLER[88].INST_decoupling_cap_filler 10731.9 0.0 R0
placeInstance FILLER[89].INST_decoupling_cap_filler 10851.9 0.0 R0
placeInstance FILLER[90].INST_decoupling_cap_filler 10971.9 0.0 R0
placeInstance FILLER[91].INST_decoupling_cap_filler 11091.9 0.0 R0
placeInstance FILLER[92].INST_decoupling_cap_filler 11211.9 0.0 R0
placeInstance FILLER[93].INST_decoupling_cap_filler 11331.9 0.0 R0
placeInstance FILLER[94].INST_decoupling_cap_filler 11451.9 0.0 R0
placeInstance FILLER[95].INST_decoupling_cap_filler 11571.9 0.0 R0
placeInstance FILLER[96].INST_decoupling_cap_filler 11691.9 0.0 R0
placeInstance FILLER[97].INST_decoupling_cap_filler 11811.9 0.0 R0
placeInstance FILLER[98].INST_decoupling_cap_filler 11931.9 0.0 R0
placeInstance FILLER[99].INST_decoupling_cap_filler 12051.9 0.0 R0
placeInstance FILLER[100].INST_decoupling_cap_filler 12171.9 0.0 R0
placeInstance FILLER[101].INST_decoupling_cap_filler 12291.9 0.0 R0
placeInstance FILLER[102].INST_decoupling_cap_filler 12411.9 0.0 R0
placeInstance FILLER[103].INST_decoupling_cap_filler 12531.9 0.0 R0
placeInstance FILLER[104].INST_decoupling_cap_filler 12651.9 0.0 R0
placeInstance FILLER[105].INST_decoupling_cap_filler 12771.9 0.0 R0
placeInstance FILLER[106].INST_decoupling_cap_filler 12891.9 0.0 R0
placeInstance FILLER[107].INST_decoupling_cap_filler 13011.9 0.0 R0
placeInstance FILLER[108].INST_decoupling_cap_filler 13131.9 0.0 R0
placeInstance FILLER[109].INST_decoupling_cap_filler 13251.9 0.0 R0
placeInstance FILLER[110].INST_decoupling_cap_filler 13371.9 0.0 R0
placeInstance FILLER[111].INST_decoupling_cap_filler 13491.9 0.0 R0
placeInstance FILLER[112].INST_decoupling_cap_filler 13611.9 0.0 R0
placeInstance FILLER[113].INST_decoupling_cap_filler 13731.9 0.0 R0
placeInstance FILLER[114].INST_decoupling_cap_filler 13851.9 0.0 R0
placeInstance FILLER[115].INST_decoupling_cap_filler 13971.9 0.0 R0
placeInstance FILLER[116].INST_decoupling_cap_filler 14091.9 0.0 R0
placeInstance FILLER[117].INST_decoupling_cap_filler 14211.9 0.0 R0
placeInstance FILLER[118].INST_decoupling_cap_filler 14331.9 0.0 R0
placeInstance FILLER[119].INST_decoupling_cap_filler 14451.9 0.0 R0
placeInstance FILLER[120].INST_decoupling_cap_filler 14571.9 0.0 R0
placeInstance FILLER[121].INST_decoupling_cap_filler 14691.9 0.0 R0
placeInstance FILLER[122].INST_decoupling_cap_filler 14811.9 0.0 R0
placeInstance FILLER[123].INST_decoupling_cap_filler 14931.9 0.0 R0
placeInstance FILLER[124].INST_decoupling_cap_filler 15051.9 0.0 R0
placeInstance FILLER[125].INST_decoupling_cap_filler 15171.9 0.0 R0
placeInstance FILLER[126].INST_decoupling_cap_filler 15291.9 0.0 R0
placeInstance FILLER[127].INST_decoupling_cap_filler 15411.9 0.0 R0
placeInstance FILLER[128].INST_decoupling_cap_filler 15531.9 0.0 R0
placeInstance FILLER[129].INST_decoupling_cap_filler 15651.9 0.0 R0
placeInstance FILLER[130].INST_decoupling_cap_filler 15771.9 0.0 R0
placeInstance FILLER[131].INST_decoupling_cap_filler 15891.9 0.0 R0
placeInstance FILLER[132].INST_decoupling_cap_filler 16011.9 0.0 R0
placeInstance FILLER[133].INST_decoupling_cap_filler 16131.9 0.0 R0
placeInstance FILLER[134].INST_decoupling_cap_filler 16251.9 0.0 R0
placeInstance FILLER[135].INST_decoupling_cap_filler 16371.9 0.0 R0
placeInstance FILLER[136].INST_decoupling_cap_filler 16491.9 0.0 R0
placeInstance FILLER[137].INST_decoupling_cap_filler 16611.9 0.0 R0
placeInstance FILLER[138].INST_decoupling_cap_filler 16731.9 0.0 R0
placeInstance FILLER[139].INST_decoupling_cap_filler 16851.9 0.0 R0
placeInstance FILLER[140].INST_decoupling_cap_filler 16971.9 0.0 R0
placeInstance FILLER[141].INST_decoupling_cap_filler 17091.9 0.0 R0
placeInstance FILLER[142].INST_decoupling_cap_filler 17211.9 0.0 R0
placeInstance FILLER[143].INST_decoupling_cap_filler 17331.9 0.0 R0
placeInstance FILLER[144].INST_decoupling_cap_filler 17451.9 0.0 R0
placeInstance FILLER[145].INST_decoupling_cap_filler 17571.9 0.0 R0
placeInstance FILLER[146].INST_decoupling_cap_filler 17691.9 0.0 R0
placeInstance FILLER[147].INST_decoupling_cap_filler 17811.9 0.0 R0
placeInstance FILLER[148].INST_decoupling_cap_filler 17931.9 0.0 R0
placeInstance FILLER[149].INST_decoupling_cap_filler 18051.9 0.0 R0
placeInstance FILLER[150].INST_decoupling_cap_filler 18171.9 0.0 R0
placeInstance FILLER[151].INST_decoupling_cap_filler 18291.9 0.0 R0

###################################################################

setNanoRouteMode -quiet -dbSkipAnalog true

set topPinPatts { DEF_CONF_PAD CLK_CONF_PAD LD_CONF_PAD SI_CONF_PAD RST_N_PAD CLK_BX_PAD CLK_OUT_PAD RESET_BCID_PAD READ_PMOS_PAD READ_PMOS_DPW_PAD READ_COMP_PAD READ_HV_PAD FREEZE_PMOS_PAD FREEZE_PMOS_DPW_PAD FREEZE_COMP_PAD FREEZE_HV_PAD PULSE_PAD DACMON_IBIAS DACMON_ICASN DACMON_IDB DACMON_IRESET DACMON_ITHR DACMON_VH DACMON_VL DACMON_VRESET_P BIAS_SF Vpc OUTA_MON_L[0] OUTA_MON_L[1] OUTA_MON_L[2] OUTA_MON_L[3] OUTA_MON_R[0] OUTA_MON_R[1] OUTA_MON_R[2] OUTA_MON_R[3] VDD_PER GND_PER AVDD_DAC AVSS_DAC DVDD DVSS AVDD AVSS SUB PWELL HV_DIODE SO_CONF_PAD TOKEN_PMOS_PAD TOKEN_PMOS_DPW_PAD TOKEN_COMP_PAD TOKEN_HV_PAD OUT_PMOS_PAD OUT_PMOS_DPW_PAD OUT_COMP_PAD OUT_HV_PAD HIT_OR_PAD[3] HIT_OR_PAD[2] HIT_OR_PAD[1] HIT_OR_PAD[0] DACMON_IBIAS DACMON_ICASN DACMON_IDB DACMON_IRESET DACMON_ITHR DACMON_VH DACMON_VL DACMON_VRESET_P BIAS_SF VDD_PER GND_PER AVDD_DAC AVSS_DAC DVDD DVSS AVDD AVSS SUB PWELL HV_DIODE}

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


#addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -type core_rings -jog_distance 0.56 -threshold 0.56 -nets {VDDP GNDP} -follow core -stacked_via_bottom_layer M1 -layer {bottom M5 top M5 right M4 left M4} -width 5 -spacing 0.28 -offset 2 

addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer TOP_M -user_defined_region {20 140 20 505 18175 505 18175 140} -type core_rings -around user_defined -jog_distance 0.56 -threshold 0.56 -nets {VDDP GNDP} -follow core -stacked_via_bottom_layer M1 -layer {bottom TOP_M top TOP_M right M5 left M5} -width 5 -spacing 1 -offset 0.56 

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 25 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M1 -spacing 0.46 -merge_stripes_value 0.56 -layer M5 -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 5 -area {} -nets {VDDP GNDP} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 25 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M1 -spacing 0.28 -merge_stripes_value 0.56 -direction horizontal -layer TOP_M -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 5 -area {} -nets {VDDP GNDP} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

#sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) TOP_M(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) TOP_M(6) } -nets { VDDP GNDP } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) TOP_M(6) } 

sroute -connect {corePin} -nets { GNDP VDDP }  -layerChangeRange { M1 M5 }   

sroute -connect { blockPin } -layerChangeRange { M1(1) TOP_M(6) } -blockPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { M1(1) TOP_M(6) } -nets { GNDP VDDP } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) TOP_M(6) } 

placeDesign
routeDesign



