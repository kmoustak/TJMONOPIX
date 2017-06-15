

set PROJECT_DIR "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/tj-monopix-master"

set script      ${PROJECT_DIR}/pnr/scripts
set METAL_TOP 5
source $script/variables.tcl
source $script/files_path.tcl
setMultiCpuUsage -reset
setMultiCpuUsage -localCpu 1 -cpuPerRemoteHost 1 -remoteHost 6 -keepLicense true
setDistributeHost -sge -queue generic.q -args {-pe smp 6} -resource h_vmem=30G 
#Flags that drive the script behavior (can be changed )
#ADD_STRIPES (0 | 1)
#if 1, add stripes
#PLACE_TIMING (0 | 1)
#if 1, do a timing driven placement
#CLOCK_TREE (0 | 1)
#if 1, create a clock tree
#CTS_CREATE_SPEC (0 | 1)
#if 1, create a clock tree specification file with default values
#ROUTE_TIMING (0 | 1)
#if 1, do a timing driven routing
#OPT ( string )
#can be used to have different generated file names
set ADD_STRIPES 1
set PLACE_TIMING 1
set CLOCK_TREE 1
set CTS_CREATE_SPEC 1
set ROUTE_TIMING 1
set SCAN_REORDER 1
set FILLER 1
set TRIAL_MODE 1
set TIMING_REPORT 0

#############################################################
# You may not have to change things below this line - but check!
#############################################################


set conf_ioOri {R0}
set defHierChar {/}
set delaycal_input_transition_delay {0.1ps}
set fpHonorDefaultPowerDomainSite 1
set fpIsMaxIoHeight 0

set oaLibName MONOPIX

set ::DelayCal::esigUseVDC 1
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_in_tran_delay {0.1ps}
set conf_ioOri {R0}
set conf_oa_oa2lefversion {5.8}
set conf_row_height 5.600000
set dcgHonorSignalNetNDR 1
set defHierChar {/}
set delaycal_input_transition_delay {0.1ps}
set fpIsMaxIoHeight 0
set gpsPrivate::dpgNewAddBufsDBUpdate 1
set gpsPrivate::lsgEnableNewDbApiInRestruct 1
set init_abstract_view {abstract}
set init_assign_buffer {1}
set init_gnd_net {GNDP}
set init_import_mode {  -keepEmptyModule 1 -treatUndefinedCellAsBbox 0}
set init_layout_view {layout}
set init_mmmc_file {../scripts/viewDefinition.tcl}
set init_oa_ref_lib {tsl18fs120_tech tsl18fs120 TJ_Monopix_01  TJ_Monopix_4bit_DAC  TJ_Monopix_DAC  TJ_Monopix_PADS}
set init_oa_search_lib {}
set init_pwr_net {VDDP}
set init_top_cell  "$DESIGN"
set init_verilog "${PROJECT_DIR}/syn/out/${DESIGN}_GATE.v"
set lsgOCPGainMult 1.000000
set pegDefaultResScaleFactor 1.000000
set pegDetailResScaleFactor 1.000000
set timing_library_float_precision_tol 0.000010
set timing_library_load_pin_cap_indices {}
init_design 
oaIn "$oaLibName" "$DESIGN" MONOPIX_routed_preopt


deselectAll
selectInst INST_digital_top_ring
set box2 [split [join [dbGet selected.box ]]]
set X2 [lindex $box2 0]
set Y2 [lindex $box2 1]
set X3 [lindex $box2 2]
set Y3 [lindex $box2 3]
set digital_top_w [expr $X3-$X2]
set digital_top_h [expr $Y3-$Y2]
deselectAll

