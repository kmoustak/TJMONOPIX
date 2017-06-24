create_library_set -name LIB_TYP \
  -timing  [join [list   "$TSL_LIB_PATH/lib/liberty/tsl18fs120_tt_1p8v_25c.lib ../../../libs/Pulldown_pol_IO_lowcap_EN.lib"]]

create_library_set -name LIB_MIN\
  -timing  [join [list  "$TSL_LIB_PATH/lib/liberty/tsl18fs120_ff_1p98v_m40c.lib ../../../libs/Pulldown_pol_IO_lowcap_EN.lib"]]

create_library_set -name LIB_MAX\
  -timing  [join [list  "$TSL_LIB_PATH/lib/liberty/tsl18fs120_ss_1p62v_125c.lib ../../../libs/Pulldown_pol_IO_lowcap_EN.lib"]] 

create_rc_corner -name RC_BEST\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -40\
   -qx_tech_file "$TSL_PDK_PATH/HOTCODE/techs/ts18is_6M1L/assura/default_scr/RCE_TS18SL_QRC_6M1L/qrcTechFile" 
create_rc_corner -name RC_TYP\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25\
   -qx_tech_file "$TSL_PDK_PATH/HOTCODE/techs/ts18is_6M1L/assura/default_scr/RCE_TS18SL_QRC_6M1L/qrcTechFile" 
create_rc_corner -name RC_WORST\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap {1 1 1}\
   -postRoute_xcap {1 1 1}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125\
   -qx_tech_file "$TSL_PDK_PATH/HOTCODE/techs/ts18is_6M1L/assura/default_scr/RCE_TS18SL_QRC_6M1L/qrcTechFile" 
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
    [list "../../syn/out/MONOPIX_GATE.sdc" ]
create_analysis_view -name AV_TC -constraint_mode SDC -delay_corner DELAY_TYP
create_analysis_view -name AV_BC -constraint_mode SDC -delay_corner DELAY_BC
create_analysis_view -name AV_WC -constraint_mode SDC -delay_corner DELAY_WC
set_analysis_view -setup [list AV_WC AV_TC] -hold [list AV_BC AV_TC]

set_timing_derate -early 0.95 -late 1.05 -delay_corner DELAY_TYP
set_timing_derate -early 0.9 -late 1.0 -delay_corner DELAY_WC
set_timing_derate -early 1.0 -late 1.15 -delay_corner DELAY_BC 

