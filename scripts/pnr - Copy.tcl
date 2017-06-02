
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
set init_gnd_net GND_PER
set init_lef_file {/cadence/kits/TOWER/ts18is/std_cells_TOWER_Cds6_Iphc/SRC/Std_cells/FS120_STD_Cells_0_18um_2005_12/DW_TOWER_tsl18fs120/2005.12/cds/lef/tsl18_6lm_tech.lef /cadence/kits/TOWER/ts18is/std_cells_TOWER_Cds6_Iphc/SRC/Std_cells/FS120_STD_Cells_0_18um_2005_12/DW_TOWER_tsl18fs120/2005.12/cds/lef/tsl18fs120.lef ../libs/matrix_dac.lef ../libs/PAD_DVDD.lef ../libs/PAD_DVSS.lef ../libs/Pulldown_pol_IO.lef}
set init_oa_search_lib {}
set init_pwr_net {VDD_PER }
set init_verilog output/r2g.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design



globalNetConnect VDD_PER -type pgpin -pin VDD -inst *
globalNetConnect GND_PER -type pgpin -pin VSS -inst *

globalNetConnect VDD_PER -type pgpin -pin VDD_PER -inst *
globalNetConnect GND_PER -type pgpin -pin GND_PER -inst *

globalNetConnect VDD_PER -type pgpin -pin VDD_Per -inst *
globalNetConnect GND_PER -type pgpin -pin GND_Per -inst *

#floorPlan -site CoreSite -d 18200 9000 10.0 130 10.0 8400

floorPlan -site CoreSite -d 18200 9000 25.0 145 25.0 8500.0

placeInstance matrix_dac 0.0 520.0 R0



placeInstance PAD_TOKEN_PMOS_DPW 100.0 0.0 R0
placeInstance PAD_TOKEN_PMOS 200.0 0.0 R0
placeInstance PAD_TOKEN_HV 300.0 0.0 R0
placeInstance PAD_CLK_BX 400.0 0.0 R0
placeInstance PAD_CLK_CONF 500.0 0.0 R0
placeInstance PAD_CLK_OUT 600.0 0.0 R0
placeInstance PAD_DEF_CONF 700.0 0.0 R0
placeInstance PAD_FREEZE_COMP 800.0 0.0 R0
placeInstance PAD_FREEZE_HV 900.0 0.0 R0
placeInstance PAD_FREEZE_PMOS 1000.0 0.0 R0
placeInstance PAD_FREEZE_PMOS_DPW 1200.0 0.0 R0
placeInstance PAD_HIT_OR0 1300.0 0.0 R0
placeInstance PAD_HIT_OR1 1400.0 0.0 R0
placeInstance PAD_HIT_OR2 1500.0 0.0 R0
placeInstance PAD_HIT_OR3 1600.0 0.0 R0
placeInstance PAD_LD_CONF 1700.0 0.0 R0
placeInstance PAD_OUT_COMP 1800.0 0.0 R0
placeInstance PAD_OUT_HV 2000.0 0.0 R0
placeInstance PAD_OUT_PMOS 2100.0 0.0 R0
placeInstance PAD_OUT_PMOS_DPW 2200.0 0.0 R0
placeInstance PAD_PULSE 2300.0 0.0 R0
placeInstance PAD_READ_COMP 2400.0 0.0 R0
placeInstance PAD_READ_HV 2500.0 0.0 R0
placeInstance PAD_READ_PMOS 2600.0 0.0 R0
placeInstance PAD_READ_PMOS_DPW 2700.0 0.0 R0
placeInstance PAD_RESET_BCID 2800.0 0.0 R0
placeInstance PAD_RST_N 2900.0 0.0 R0
placeInstance PAD_SI_CONF 3000.0 0.0 R0
placeInstance PAD_SO_CONF 3100.0 0.0 R0
placeInstance PAD_TOKEN_COMP 3200.0 0.0 R0
placeInstance DIGITAL[0].INST_PAD_DVDD 3300.0 0.0 R0
placeInstance DIGITAL[1].INST_PAD_DVDD 3400.0 0.0 R0
placeInstance DIGITAL[2].INST_PAD_DVDD 3500.0 0.0 R0
placeInstance DIGITAL[3].INST_PAD_DVDD 3600.0 0.0 R0



#addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -type core_rings -jog_distance 0.56 -threshold 0.56 -nets {VDD_PER GND_PER} -follow core -stacked_via_bottom_layer M1 -layer {bottom M5 top M5 right M4 left M4} -width 5 -spacing 0.28 -offset 2 

addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer TOP_M -user_defined_region {20 140 20 505 18175 505 18175 140} -type core_rings -around user_defined -jog_distance 0.56 -threshold 0.56 -nets {VDD_PER GND_PER} -follow core -stacked_via_bottom_layer M1 -layer {bottom M5 top M5 right TOP_M left TOP_M} -width 5 -spacing 1 -offset 0.56 

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 25 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M1 -spacing 0.46 -merge_stripes_value 0.56 -layer TOP_M -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 5 -area {} -nets {VDD_PER GND_PER} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 25 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M1 -spacing 0.28 -merge_stripes_value 0.56 -direction horizontal -layer M5 -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 5 -area {} -nets {VDD_PER GND_PER} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0

#sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) TOP_M(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) TOP_M(6) } -nets { VDD_PER GND_PER } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) TOP_M(6) } 

stop

sroute -connect { blockPin } -layerChangeRange { M1(1) TOP_M(6) } -blockPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { M1(1) TOP_M(6) } -nets { GND_PER VDD_PER } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) TOP_M(6) } 

sroute -connect {corePin} -nets { GND_PER VDD_PER }  -layerChangeRange { M1(1) TOP_M(6) }   

stop


placeDesign