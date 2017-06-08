
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

placeInstance DIGITAL_P[0].INST_PAD_DVDD 31.9 0.0 R0
placeInstance DIGITAL_G[0].INST_PAD_DVSS 151.9 0.0 R0
placeInstance DIGITAL_P[1].INST_PAD_DVDD 271.9 0.0 R0
placeInstance DIGITAL_G[1].INST_PAD_DVSS 391.9 0.0 R0
placeInstance DIGITAL_P[2].INST_PAD_DVDD 511.9 0.0 R0
placeInstance DIGITAL_G[2].INST_PAD_DVSS 631.9 0.0 R0
placeInstance DIGITAL_P[3].INST_PAD_DVDD 751.9 0.0 R0
placeInstance DIGITAL_G[3].INST_PAD_DVSS 871.9 0.0 R0
placeInstance DIGITAL_P[4].INST_PAD_DVDD 991.9 0.0 R0
placeInstance DIGITAL_G[4].INST_PAD_DVSS 1111.9 0.0 R0
placeInstance DIGITAL_P[5].INST_PAD_DVDD 1231.9 0.0 R0
placeInstance DIGITAL_G[5].INST_PAD_DVSS 1351.9 0.0 R0
placeInstance DIGITAL_P[6].INST_PAD_DVDD 1471.9 0.0 R0
placeInstance DIGITAL_G[6].INST_PAD_DVSS 1591.9 0.0 R0
placeInstance DIGITAL_P[7].INST_PAD_DVDD 1711.9 0.0 R0
placeInstance DIGITAL_G[7].INST_PAD_DVSS 1831.9 0.0 R0
placeInstance DIGITAL_P[8].INST_PAD_DVDD 1951.9 0.0 R0
placeInstance DIGITAL_G[8].INST_PAD_DVSS 2071.9 0.0 R0
placeInstance DIGITAL_P[9].INST_PAD_DVDD 2191.9 0.0 R0
placeInstance DIGITAL_G[9].INST_PAD_DVSS 2311.9 0.0 R0
placeInstance DIGITAL_P[10].INST_PAD_DVDD 2431.9 0.0 R0
placeInstance DIGITAL_G[10].INST_PAD_DVSS 2551.9 0.0 R0
placeInstance DIGITAL_P[11].INST_PAD_DVDD 2671.9 0.0 R0
placeInstance PAD_READ_PMOS_NOSF 2791.9 0.0 R0
placeInstance DIGITAL_G[11].INST_PAD_DVSS 2911.9 0.0 R0
placeInstance PAD_FREEZE_PMOS_NOSF 3031.9 0.0 R0
placeInstance DIGITAL_P[12].INST_PAD_DVDD 3151.9 0.0 R0
placeInstance PAD_TOKEN_PMOS_NOSF 3271.9 0.0 R0
placeInstance DIGITAL_G[12].INST_PAD_DVSS 3391.9 0.0 R0
placeInstance PAD_OUT_PMOS_NOSF 3511.9 0.0 R0
placeInstance DIGITAL_P[13].INST_PAD_DVDD 3631.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS_NOSF 3751.9 0.0 R0
placeInstance DIGITAL_G[13].INST_PAD_DVSS 3871.9 0.0 R0
placeInstance PAD_nOUT_PMOS_NOSF 3991.9 0.0 R0
placeInstance DIGITAL_P[14].INST_PAD_DVDD 4111.9 0.0 R0
placeInstance PAD_HIT_OR0 4231.9 0.0 R0
placeInstance DIGITAL_G[14].INST_PAD_DVSS 4351.9 0.0 R0
placeInstance PAD_nHIT_OR0 4471.9 0.0 R0
placeInstance DIGITAL_P[15].INST_PAD_DVDD 4591.9 0.0 R0
placeInstance DIGITAL_G[15].INST_PAD_DVSS 4711.9 0.0 R0
placeInstance DIGITAL_P[16].INST_PAD_DVDD 4831.9 0.0 R0
placeInstance DIGITAL_G[16].INST_PAD_DVSS 4951.9 0.0 R0
placeInstance DIGITAL_P[17].INST_PAD_DVDD 5071.9 0.0 R0
placeInstance DIGITAL_G[17].INST_PAD_DVSS 5191.9 0.0 R0
placeInstance DIGITAL_P[18].INST_PAD_DVDD 5311.9 0.0 R0
placeInstance DIGITAL_G[18].INST_PAD_DVSS 5431.9 0.0 R0
placeInstance DIGITAL_P[19].INST_PAD_DVDD 5551.9 0.0 R0
placeInstance DIGITAL_G[19].INST_PAD_DVSS 5671.9 0.0 R0
placeInstance DIGITAL_P[20].INST_PAD_DVDD 5791.9 0.0 R0
placeInstance DIGITAL_G[20].INST_PAD_DVSS 5911.9 0.0 R0
placeInstance DIGITAL_P[21].INST_PAD_DVDD 6031.9 0.0 R0
placeInstance PAD_READ_PMOS 6151.9 0.0 R0
placeInstance DIGITAL_G[21].INST_PAD_DVSS 6271.9 0.0 R0
placeInstance PAD_FREEZE_PMOS 6391.9 0.0 R0
placeInstance DIGITAL_P[22].INST_PAD_DVDD 6511.9 0.0 R0
placeInstance PAD_TOKEN_PMOS 6631.9 0.0 R0
placeInstance DIGITAL_G[22].INST_PAD_DVSS 6751.9 0.0 R0
placeInstance PAD_OUT_PMOS 6871.9 0.0 R0
placeInstance DIGITAL_P[23].INST_PAD_DVDD 6991.9 0.0 R0
placeInstance PAD_nTOKEN_PMOS 7111.9 0.0 R0
placeInstance DIGITAL_G[23].INST_PAD_DVSS 7231.9 0.0 R0
placeInstance PAD_nOUT_PMOS 7351.9 0.0 R0
placeInstance DIGITAL_P[24].INST_PAD_DVDD 7471.9 0.0 R0
placeInstance PAD_HIT_OR1 7591.9 0.0 R0
placeInstance DIGITAL_G[24].INST_PAD_DVSS 7711.9 0.0 R0
placeInstance PAD_nHIT_OR1 7831.9 0.0 R0
placeInstance DIGITAL_P[25].INST_PAD_DVDD 7951.9 0.0 R0
placeInstance PAD_DEF_CONF 8071.9 0.0 R0
placeInstance DIGITAL_G[25].INST_PAD_DVSS 8191.9 0.0 R0
placeInstance PAD_CLK_CONF 8311.9 0.0 R0
placeInstance DIGITAL_P[26].INST_PAD_DVDD 8431.9 0.0 R0
placeInstance PAD_LD_CONF 8551.9 0.0 R0
placeInstance DIGITAL_G[26].INST_PAD_DVSS 8671.9 0.0 R0
placeInstance PAD_SI_CONF 8791.9 0.0 R0
placeInstance DIGITAL_P[27].INST_PAD_DVDD 8911.9 0.0 R0
placeInstance PAD_SO_CONF 9031.9 0.0 R0
placeInstance DIGITAL_G[27].INST_PAD_DVSS 9151.9 0.0 R0
placeInstance PAD_RST_N 9271.9 0.0 R0
placeInstance DIGITAL_P[28].INST_PAD_DVDD 9391.9 0.0 R0
placeInstance PAD_CLK_BX 9511.9 0.0 R0
placeInstance DIGITAL_G[28].INST_PAD_DVSS 9631.9 0.0 R0
placeInstance PAD_CLK_OUT 9751.9 0.0 R0
placeInstance DIGITAL_P[29].INST_PAD_DVDD 9871.9 0.0 R0
placeInstance PAD_RESET_BCID 9991.9 0.0 R0
placeInstance DIGITAL_G[29].INST_PAD_DVSS 10111.9 0.0 R0
placeInstance PAD_PULSE 10231.9 0.0 R0
placeInstance DIGITAL_P[30].INST_PAD_DVDD 10351.9 0.0 R0
placeInstance DIGITAL_G[30].INST_PAD_DVSS 10471.9 0.0 R0
placeInstance DIGITAL_P[31].INST_PAD_DVDD 10591.9 0.0 R0
placeInstance DIGITAL_G[31].INST_PAD_DVSS 10711.9 0.0 R0
placeInstance DIGITAL_P[32].INST_PAD_DVDD 10831.9 0.0 R0
placeInstance DIGITAL_G[32].INST_PAD_DVSS 10951.9 0.0 R0
placeInstance DIGITAL_P[33].INST_PAD_DVDD 11071.9 0.0 R0
placeInstance DIGITAL_G[33].INST_PAD_DVSS 11191.9 0.0 R0
placeInstance DIGITAL_P[34].INST_PAD_DVDD 11311.9 0.0 R0
placeInstance DIGITAL_G[34].INST_PAD_DVSS 11431.9 0.0 R0
placeInstance DIGITAL_P[35].INST_PAD_DVDD 11551.9 0.0 R0
placeInstance DIGITAL_G[35].INST_PAD_DVSS 11671.9 0.0 R0
placeInstance DIGITAL_P[36].INST_PAD_DVDD 11791.9 0.0 R0
placeInstance PAD_READ_COMP 11911.9 0.0 R0
placeInstance DIGITAL_G[36].INST_PAD_DVSS 12031.9 0.0 R0
placeInstance PAD_FREEZE_COMP 12151.9 0.0 R0
placeInstance DIGITAL_P[37].INST_PAD_DVDD 12271.9 0.0 R0
placeInstance PAD_TOKEN_COMP 12391.9 0.0 R0
placeInstance DIGITAL_G[37].INST_PAD_DVSS 12511.9 0.0 R0
placeInstance PAD_OUT_COMP 12631.9 0.0 R0
placeInstance DIGITAL_P[38].INST_PAD_DVDD 12751.9 0.0 R0
placeInstance PAD_nTOKEN_COMP 12871.9 0.0 R0
placeInstance DIGITAL_G[38].INST_PAD_DVSS 12991.9 0.0 R0
placeInstance PAD_nOUT_COMP 13111.9 0.0 R0
placeInstance DIGITAL_P[39].INST_PAD_DVDD 13231.9 0.0 R0
placeInstance PAD_HIT_OR2 13351.9 0.0 R0
placeInstance DIGITAL_P[39].INST_PAD_DVSS 13471.9 0.0 R0
placeInstance PAD_nHIT_OR2 13591.9 0.0 R0
placeInstance DIGITAL_P[40].INST_PAD_DVDD 13711.9 0.0 R0
placeInstance DIGITAL_G[40].INST_PAD_DVSS 13831.9 0.0 R0
placeInstance DIGITAL_P[41].INST_PAD_DVDD 13951.9 0.0 R0
placeInstance DIGITAL_G[41].INST_PAD_DVSS 14071.9 0.0 R0
placeInstance DIGITAL_P[42].INST_PAD_DVDD 14191.9 0.0 R0
placeInstance DIGITAL_G[42].INST_PAD_DVSS 14311.9 0.0 R0
placeInstance DIGITAL_P[43].INST_PAD_DVDD 14431.9 0.0 R0
placeInstance DIGITAL_G[43].INST_PAD_DVSS 14551.9 0.0 R0
placeInstance DIGITAL_P[44].INST_PAD_DVDD 14671.9 0.0 R0
placeInstance DIGITAL_G[44].INST_PAD_DVSS 14791.9 0.0 R0
placeInstance DIGITAL_P[45].INST_PAD_DVDD 14911.9 0.0 R0
placeInstance DIGITAL_G[45].INST_PAD_DVSS 15031.9 0.0 R0
placeInstance DIGITAL_P[46].INST_PAD_DVDD 15151.9 0.0 R0
placeInstance DIGITAL_G[46].INST_PAD_DVSS 15271.9 0.0 R0
placeInstance DIGITAL_P[47].INST_PAD_DVDD 15391.9 0.0 R0
placeInstance DIGITAL_G[47].INST_PAD_DVSS 15511.9 0.0 R0
placeInstance DIGITAL_P[48].INST_PAD_DVDD 15631.9 0.0 R0
placeInstance DIGITAL_G[48].INST_PAD_DVSS 15751.9 0.0 R0
placeInstance DIGITAL_P[49].INST_PAD_DVDD 15871.9 0.0 R0
placeInstance DIGITAL_G[49].INST_PAD_DVSS 15991.9 0.0 R0
placeInstance DIGITAL_P[50].INST_PAD_DVDD 16111.9 0.0 R0
placeInstance DIGITAL_G[50].INST_PAD_DVSS 16231.9 0.0 R0
placeInstance PAD_READ_HV 16351.9 0.0 R0
placeInstance DIGITAL_P[51].INST_PAD_DVDD 16471.9 0.0 R0
placeInstance PAD_FREEZE_HV 16591.9 0.0 R0
placeInstance DIGITAL_G[51].INST_PAD_DVSS 16711.9 0.0 R0
placeInstance PAD_TOKEN_HV 16831.9 0.0 R0
placeInstance DIGITAL_P[52].INST_PAD_DVDD 16951.9 0.0 R0
placeInstance PAD_OUT_HV 17071.9 0.0 R0
placeInstance DIGITAL_G[52].INST_PAD_DVSS 17191.9 0.0 R0
placeInstance PAD_nTOKEN_HV 17311.9 0.0 R0
placeInstance DIGITAL_P[53].INST_PAD_DVDD 17431.9 0.0 R0
placeInstance PAD_nOUT_HV 17551.9 0.0 R0
placeInstance DIGITAL_G[53].INST_PAD_DVSS 17671.9 0.0 R0
placeInstance PAD_HIT_OR3 17791.9 0.0 R0
placeInstance DIGITAL_P[54].INST_PAD_DVDD 17911.9 0.0 R0
placeInstance PAD_nHIT_OR3 18031.9 0.0 R0

############################ FILLER PLACEMENT ##################################

placeInstance FILLER[0].INST_decoupling_cap_filler 131.9 0.0 R0
placeInstance FILLER[1].INST_decoupling_cap_filler 251.9 0.0 R0
placeInstance FILLER[2].INST_decoupling_cap_filler 371.9 0.0 R0
placeInstance FILLER[3].INST_decoupling_cap_filler 491.9 0.0 R0
placeInstance FILLER[4].INST_decoupling_cap_filler 611.9 0.0 R0
placeInstance FILLER[5].INST_decoupling_cap_filler 731.9 0.0 R0
placeInstance FILLER[6].INST_decoupling_cap_filler 851.9 0.0 R0
placeInstance FILLER[7].INST_decoupling_cap_filler 971.9 0.0 R0
placeInstance FILLER[8].INST_decoupling_cap_filler 1091.9 0.0 R0
placeInstance FILLER[9].INST_decoupling_cap_filler 1211.9 0.0 R0
placeInstance FILLER[10].INST_decoupling_cap_filler 1331.9 0.0 R0
placeInstance FILLER[11].INST_decoupling_cap_filler 1451.9 0.0 R0
placeInstance FILLER[12].INST_decoupling_cap_filler 1571.9 0.0 R0
placeInstance FILLER[13].INST_decoupling_cap_filler 1691.9 0.0 R0
placeInstance FILLER[14].INST_decoupling_cap_filler 1811.9 0.0 R0
placeInstance FILLER[15].INST_decoupling_cap_filler 1931.9 0.0 R0
placeInstance FILLER[16].INST_decoupling_cap_filler 2051.9 0.0 R0
placeInstance FILLER[17].INST_decoupling_cap_filler 2171.9 0.0 R0
placeInstance FILLER[18].INST_decoupling_cap_filler 2291.9 0.0 R0
placeInstance FILLER[19].INST_decoupling_cap_filler 2411.9 0.0 R0
placeInstance FILLER[20].INST_decoupling_cap_filler 2531.9 0.0 R0
placeInstance FILLER[21].INST_decoupling_cap_filler 2651.9 0.0 R0
placeInstance FILLER[22].INST_decoupling_cap_filler 2771.9 0.0 R0
placeInstance FILLER[23].INST_decoupling_cap_filler 2891.9 0.0 R0
placeInstance FILLER[24].INST_decoupling_cap_filler 3011.9 0.0 R0
placeInstance FILLER[25].INST_decoupling_cap_filler 3131.9 0.0 R0
placeInstance FILLER[26].INST_decoupling_cap_filler 3251.9 0.0 R0
placeInstance FILLER[27].INST_decoupling_cap_filler 3371.9 0.0 R0
placeInstance FILLER[28].INST_decoupling_cap_filler 3491.9 0.0 R0
placeInstance FILLER[29].INST_decoupling_cap_filler 3611.9 0.0 R0
placeInstance FILLER[30].INST_decoupling_cap_filler 3731.9 0.0 R0
placeInstance FILLER[31].INST_decoupling_cap_filler 3851.9 0.0 R0
placeInstance FILLER[32].INST_decoupling_cap_filler 3971.9 0.0 R0
placeInstance FILLER[33].INST_decoupling_cap_filler 4091.9 0.0 R0
placeInstance FILLER[34].INST_decoupling_cap_filler 4211.9 0.0 R0
placeInstance FILLER[35].INST_decoupling_cap_filler 4331.9 0.0 R0
placeInstance FILLER[36].INST_decoupling_cap_filler 4451.9 0.0 R0
placeInstance FILLER[37].INST_decoupling_cap_filler 4571.9 0.0 R0
placeInstance FILLER[38].INST_decoupling_cap_filler 4691.9 0.0 R0
placeInstance FILLER[39].INST_decoupling_cap_filler 4811.9 0.0 R0
placeInstance FILLER[40].INST_decoupling_cap_filler 4931.9 0.0 R0
placeInstance FILLER[41].INST_decoupling_cap_filler 5051.9 0.0 R0
placeInstance FILLER[42].INST_decoupling_cap_filler 5171.9 0.0 R0
placeInstance FILLER[43].INST_decoupling_cap_filler 5291.9 0.0 R0
placeInstance FILLER[44].INST_decoupling_cap_filler 5411.9 0.0 R0
placeInstance FILLER[45].INST_decoupling_cap_filler 5531.9 0.0 R0
placeInstance FILLER[46].INST_decoupling_cap_filler 5651.9 0.0 R0
placeInstance FILLER[47].INST_decoupling_cap_filler 5771.9 0.0 R0
placeInstance FILLER[48].INST_decoupling_cap_filler 5891.9 0.0 R0
placeInstance FILLER[49].INST_decoupling_cap_filler 6011.9 0.0 R0
placeInstance FILLER[50].INST_decoupling_cap_filler 6131.9 0.0 R0
placeInstance FILLER[51].INST_decoupling_cap_filler 6251.9 0.0 R0
placeInstance FILLER[52].INST_decoupling_cap_filler 6371.9 0.0 R0
placeInstance FILLER[53].INST_decoupling_cap_filler 6491.9 0.0 R0
placeInstance FILLER[54].INST_decoupling_cap_filler 6611.9 0.0 R0
placeInstance FILLER[55].INST_decoupling_cap_filler 6731.9 0.0 R0
placeInstance FILLER[56].INST_decoupling_cap_filler 6851.9 0.0 R0
placeInstance FILLER[57].INST_decoupling_cap_filler 6971.9 0.0 R0
placeInstance FILLER[58].INST_decoupling_cap_filler 7091.9 0.0 R0
placeInstance FILLER[59].INST_decoupling_cap_filler 7211.9 0.0 R0
placeInstance FILLER[60].INST_decoupling_cap_filler 7331.9 0.0 R0
placeInstance FILLER[61].INST_decoupling_cap_filler 7451.9 0.0 R0
placeInstance FILLER[62].INST_decoupling_cap_filler 7571.9 0.0 R0
placeInstance FILLER[63].INST_decoupling_cap_filler 7691.9 0.0 R0
placeInstance FILLER[64].INST_decoupling_cap_filler 7811.9 0.0 R0
placeInstance FILLER[65].INST_decoupling_cap_filler 7931.9 0.0 R0
placeInstance FILLER[66].INST_decoupling_cap_filler 8051.9 0.0 R0
placeInstance FILLER[67].INST_decoupling_cap_filler 8171.9 0.0 R0
placeInstance FILLER[68].INST_decoupling_cap_filler 8291.9 0.0 R0
placeInstance FILLER[69].INST_decoupling_cap_filler 8411.9 0.0 R0
placeInstance FILLER[70].INST_decoupling_cap_filler 8531.9 0.0 R0
placeInstance FILLER[71].INST_decoupling_cap_filler 8651.9 0.0 R0
placeInstance FILLER[72].INST_decoupling_cap_filler 8771.9 0.0 R0
placeInstance FILLER[73].INST_decoupling_cap_filler 8891.9 0.0 R0
placeInstance FILLER[74].INST_decoupling_cap_filler 9011.9 0.0 R0
placeInstance FILLER[75].INST_decoupling_cap_filler 9131.9 0.0 R0
placeInstance FILLER[76].INST_decoupling_cap_filler 9251.9 0.0 R0
placeInstance FILLER[77].INST_decoupling_cap_filler 9371.9 0.0 R0
placeInstance FILLER[78].INST_decoupling_cap_filler 9491.9 0.0 R0
placeInstance FILLER[79].INST_decoupling_cap_filler 9611.9 0.0 R0
placeInstance FILLER[80].INST_decoupling_cap_filler 9731.9 0.0 R0
placeInstance FILLER[81].INST_decoupling_cap_filler 9851.9 0.0 R0
placeInstance FILLER[82].INST_decoupling_cap_filler 9971.9 0.0 R0
placeInstance FILLER[83].INST_decoupling_cap_filler 10091.9 0.0 R0
placeInstance FILLER[84].INST_decoupling_cap_filler 10211.9 0.0 R0
placeInstance FILLER[85].INST_decoupling_cap_filler 10331.9 0.0 R0
placeInstance FILLER[86].INST_decoupling_cap_filler 10451.9 0.0 R0
placeInstance FILLER[87].INST_decoupling_cap_filler 10571.9 0.0 R0
placeInstance FILLER[88].INST_decoupling_cap_filler 10691.9 0.0 R0
placeInstance FILLER[89].INST_decoupling_cap_filler 10811.9 0.0 R0
placeInstance FILLER[90].INST_decoupling_cap_filler 10931.9 0.0 R0
placeInstance FILLER[91].INST_decoupling_cap_filler 11051.9 0.0 R0
placeInstance FILLER[92].INST_decoupling_cap_filler 11171.9 0.0 R0
placeInstance FILLER[93].INST_decoupling_cap_filler 11291.9 0.0 R0
placeInstance FILLER[94].INST_decoupling_cap_filler 11411.9 0.0 R0
placeInstance FILLER[95].INST_decoupling_cap_filler 11531.9 0.0 R0
placeInstance FILLER[96].INST_decoupling_cap_filler 11651.9 0.0 R0
placeInstance FILLER[97].INST_decoupling_cap_filler 11771.9 0.0 R0
placeInstance FILLER[98].INST_decoupling_cap_filler 11891.9 0.0 R0
placeInstance FILLER[99].INST_decoupling_cap_filler 12011.9 0.0 R0
placeInstance FILLER[100].INST_decoupling_cap_filler 12131.9 0.0 R0
placeInstance FILLER[101].INST_decoupling_cap_filler 12251.9 0.0 R0
placeInstance FILLER[102].INST_decoupling_cap_filler 12371.9 0.0 R0
placeInstance FILLER[103].INST_decoupling_cap_filler 12491.9 0.0 R0
placeInstance FILLER[104].INST_decoupling_cap_filler 12611.9 0.0 R0
placeInstance FILLER[105].INST_decoupling_cap_filler 12731.9 0.0 R0
placeInstance FILLER[106].INST_decoupling_cap_filler 12851.9 0.0 R0
placeInstance FILLER[107].INST_decoupling_cap_filler 12971.9 0.0 R0
placeInstance FILLER[108].INST_decoupling_cap_filler 13091.9 0.0 R0
placeInstance FILLER[109].INST_decoupling_cap_filler 13211.9 0.0 R0
placeInstance FILLER[110].INST_decoupling_cap_filler 13331.9 0.0 R0
placeInstance FILLER[111].INST_decoupling_cap_filler 13451.9 0.0 R0
placeInstance FILLER[112].INST_decoupling_cap_filler 13571.9 0.0 R0
placeInstance FILLER[113].INST_decoupling_cap_filler 13691.9 0.0 R0
placeInstance FILLER[114].INST_decoupling_cap_filler 13811.9 0.0 R0
placeInstance FILLER[115].INST_decoupling_cap_filler 13931.9 0.0 R0
placeInstance FILLER[116].INST_decoupling_cap_filler 14051.9 0.0 R0
placeInstance FILLER[117].INST_decoupling_cap_filler 14171.9 0.0 R0
placeInstance FILLER[118].INST_decoupling_cap_filler 14291.9 0.0 R0
placeInstance FILLER[119].INST_decoupling_cap_filler 14411.9 0.0 R0
placeInstance FILLER[120].INST_decoupling_cap_filler 14531.9 0.0 R0
placeInstance FILLER[121].INST_decoupling_cap_filler 14651.9 0.0 R0
placeInstance FILLER[122].INST_decoupling_cap_filler 14771.9 0.0 R0
placeInstance FILLER[123].INST_decoupling_cap_filler 14891.9 0.0 R0
placeInstance FILLER[124].INST_decoupling_cap_filler 15011.9 0.0 R0
placeInstance FILLER[125].INST_decoupling_cap_filler 15131.9 0.0 R0
placeInstance FILLER[126].INST_decoupling_cap_filler 15251.9 0.0 R0
placeInstance FILLER[127].INST_decoupling_cap_filler 15371.9 0.0 R0
placeInstance FILLER[128].INST_decoupling_cap_filler 15491.9 0.0 R0
placeInstance FILLER[129].INST_decoupling_cap_filler 15611.9 0.0 R0
placeInstance FILLER[130].INST_decoupling_cap_filler 15731.9 0.0 R0
placeInstance FILLER[131].INST_decoupling_cap_filler 15851.9 0.0 R0
placeInstance FILLER[132].INST_decoupling_cap_filler 15971.9 0.0 R0
placeInstance FILLER[133].INST_decoupling_cap_filler 16091.9 0.0 R0
placeInstance FILLER[134].INST_decoupling_cap_filler 16211.9 0.0 R0
placeInstance FILLER[135].INST_decoupling_cap_filler 16331.9 0.0 R0
placeInstance FILLER[136].INST_decoupling_cap_filler 16451.9 0.0 R0
placeInstance FILLER[137].INST_decoupling_cap_filler 16571.9 0.0 R0
placeInstance FILLER[138].INST_decoupling_cap_filler 16691.9 0.0 R0
placeInstance FILLER[139].INST_decoupling_cap_filler 16811.9 0.0 R0
placeInstance FILLER[140].INST_decoupling_cap_filler 16931.9 0.0 R0
placeInstance FILLER[141].INST_decoupling_cap_filler 17051.9 0.0 R0
placeInstance FILLER[142].INST_decoupling_cap_filler 17171.9 0.0 R0
placeInstance FILLER[143].INST_decoupling_cap_filler 17291.9 0.0 R0
placeInstance FILLER[144].INST_decoupling_cap_filler 17411.9 0.0 R0
placeInstance FILLER[145].INST_decoupling_cap_filler 17531.9 0.0 R0
placeInstance FILLER[146].INST_decoupling_cap_filler 17651.9 0.0 R0
placeInstance FILLER[147].INST_decoupling_cap_filler 17771.9 0.0 R0
placeInstance FILLER[148].INST_decoupling_cap_filler 17891.9 0.0 R0
placeInstance FILLER[149].INST_decoupling_cap_filler 18011.9 0.0 R0
placeInstance FILLER[150].INST_decoupling_cap_filler 18131.9 0.0 R0

###################################################################

setNanoRouteMode -quiet -dbSkipAnalog true

set topPinPatts { DEF_CONF_PAD CLK_CONF_PAD LD_CONF_PAD SI_CONF_PAD RST_N_PAD CLK_BX_PAD CLK_OUT_PAD RESET_BCID_PAD READ_PMOS_NOSF_PAD READ_PMOS_PAD READ_COMP_PAD READ_HV_PAD FREEZE_PMOS_NOSF_PAD FREEZE_PMOS_PAD FREEZE_COMP_PAD FREEZE_HV_PAD TOKEN_PMOS_NOSF_PAD TOKEN_PMOS_PAD TOKEN_COMP_PAD TOKEN_HV_PAD OUT_PMOS_NOSF_PAD OUT_PMOS_PAD OUT_COMP_PAD OUT_HV_PAD PULSE_PAD HIT_OR_PAD[3] HIT_OR_PAD[2] HIT_OR_PAD[1] HIT_OR_PAD[0] BiasSF VPC VPCNOSF DACMON_BIAS DACMON_IDB DACMON_ITHR DACMON_IRESET DACMON_ICASN DACMON_VRESET_P DACMON_VL DACMON_VH DACMON_VCASN_DAC OUTA_MON_L[3] OUTA_MON_L[2] OUTA_MON_L[1] OUTA_MON_L[0] OUTA_MON_R[3] OUTA_MON_R[2] OUTA_MON_R[1] OUTA_MON_R[0] VCASN_MON_L VCASN_DAC_MON_L VCASN_MON_R VCASN_DAC_MON_R VDDA GNDA VDDD GNDD VDDA_IDAC GNDA_IDAC VDDA_VDAC GNDA_VDAC VDDP GNDP PSUB PWELL HV_DIODE}

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
