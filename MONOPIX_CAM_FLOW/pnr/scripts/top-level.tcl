
#######################################################
#                                                     
#  THE RECIPE
#  by Cesar Marin
#  CERN PH/
#  Created on 10/01/2012
#                                                     
#######################################################

set PROJECT_DIR "../.."

set TSL_LIB_PATH $::env(TSL_LIB_PATH) 
set TSL_PDK_PATH $::env(TSL_PDK_PATH) 

set script      ../scripts
set METAL_TOP 6
source $script/variables.tcl
source $script/files_path.tcl
setMultiCpuUsage -reset
setMultiCpuUsage -localCpu 8 
#-cpuPerRemoteHost 1 -remoteHost 6 -keepLicense true
#setDistributeHost -sge -queue generic.q -args {-pe smp 6} -resource h_vmem=30G 
#-custom -custom_script { qsub -l "h_vmem=30G" -pe smp 6 }
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
set init_oa_ref_lib {tsl18fs120_dig tsl18fs120 TJ_Monopix_01 TJ_Monopix_PADS}
set init_oa_search_lib {}
set init_pwr_net {VDDP}
set init_top_cell  "$DESIGN"
set init_verilog "../../../MONOPIX_CAM_FLOW/syn/out/${DESIGN}_GATE.v"
set lsgOCPGainMult 1.000000
set pegDefaultResScaleFactor 1.000000
set pegDetailResScaleFactor 1.000000
set timing_library_float_precision_tol 0.000010
set timing_library_load_pin_cap_indices {}
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}

init_design ;

setAnalysisMode -asyncChecks noAsync -cppr both -analysisType onChipVariation ;# ;#bcwc setAnalysisMode -analysisType bcwc -checkType setup -skew true -clockPropagation sdcControl
set_global timing_apply_default_primary_input_assertion false
set_global timing_clock_phase_propagation both
setAnalysisMode -multipleClockPerRegister true
setExtractRCMode -engine preRoute

setOaxMode -compressLevel 0
setExtractRCMode -engine preRoute -assumeMetFill .56

saveNetlist "../out/${DESIGN}_init.v"
# source the files that operate on the circuit
source $script/floorplan_vertical.tcl  	;# create the floorplan 
source $script/powerplan.tcl  	          ;# Placement
source $script/place.tcl  	          ;# Placement 
source $script/cts.tcl  	          ;# Placement 
source $script/route.tcl  	          ;# Placement 
#saveDesign -cellview "$oaLibName ${DESIGN} place"

#TODO: add pins

saveNetlist "../out/${DESIGN}_lvs.v" -flat -excludeLeafCell -includePowerGround -includePhysicalCell {feedth9_cap feedth10_cap feedth12_cap feedth14_cap feedth16_cap feedth18_cap feedth20_cap}
source ../scripts/makeLabels.tcl
oaOut $oaLibName ${DESIGN} layout -leafViewNames {layout abstract}

saveNetlist "../out/${DESIGN}.v"
write_sdf -min_view AV_BC -max_view AV_WC -typ_view AV_TC -version 3.0 -edges check_edge  -remashold  -recompute_parallel_arcs ../out/${DESIGN}.sdf


report_timing -to [get_pins MONOPIX_TOP/BcidMtx*] -unconstrained -nworst 2000 -view AV_TC >> ../report/BcidMtx.timing.AV_TC.log
report_timing -to [get_pins MONOPIX_TOP/BcidMtx*] -unconstrained -nworst 2000 -view AV_WC >> ../report/BcidMtx.timing.AV_WC.log
report_timing -to [get_pins MONOPIX_TOP/BcidMtx*] -unconstrained -nworst 2000 -view AV_BC >> ../report/BcidMtx.timing.AV_BC.log

