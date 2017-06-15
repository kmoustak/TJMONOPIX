create_library_set -name LIB_TYP \
  -timing [list "/vlsicad/micsoft/TOWER180/digital_libs/STD_CELLS/tsl18fs120_Rev_2015.08/lib/liberty/tsl18fs120_tt_1p8v_25c.lib /projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/tj-monopix-master/libs/Pulldown_pol_IO_lowcap_EN.lib"] 

create_library_set -name LIB_MIN\
  -timing [list "/vlsicad/micsoft/TOWER180/digital_libs/STD_CELLS/tsl18fs120_Rev_2015.08/lib/liberty/tsl18fs120_ff_1p98v_m40c.lib /projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/tj-monopix-master/libs/Pulldown_pol_IO_lowcap_EN.lib"] 

create_library_set -name LIB_MAX\
  -timing [list "/vlsicad/micsoft/TOWER180/digital_libs/STD_CELLS/tsl18fs120_Rev_2015.08/lib/liberty/tsl18fs120_ss_1p62v_125c.lib /projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/tj-monopix-master/libs/Pulldown_pol_IO_lowcap_EN.lib"] 

create_rc_corner -name RC_BEST\
   -cap_table "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techgen/TSL6ML_BC.CapTbl" \
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -40\
   -qx_tech_file "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techfile/qrcTechFile" 
create_rc_corner -name RC_TYP\
   -cap_table "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techgen/TSL6ML_TC.CapTbl" \
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25\
   -qx_tech_file "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techfile/qrcTechFile" 
create_rc_corner -name RC_WORST\
   -cap_table "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techgen/TSL6ML_WC.CapTbl" \
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125\
   -qx_tech_file "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techfile/qrcTechFile" 
create_delay_corner -name DELAY_BC\
   -library_set LIB_MIN\
   -rc_corner RC_BEST
create_delay_corner -name DELAY_WC\
   -library_set LIB_MAX\
   -rc_corner RC_WORST
create_delay_corner -name DELAY_TYP\
   -library_set LIB_TYP\
   -rc_corner RC_TYP
create_constraint_mode -name SDC\
   -sdc_files\
    [list "../scripts/sdc.tcl" ]
create_analysis_view -name AV_TC -constraint_mode SDC -delay_corner DELAY_TYP
create_analysis_view -name AV_BC -constraint_mode SDC -delay_corner DELAY_BC
create_analysis_view -name AV_WC -constraint_mode SDC -delay_corner DELAY_WC
set_analysis_view -setup [list AV_WC AV_TC] -hold [list AV_BC AV_TC]
