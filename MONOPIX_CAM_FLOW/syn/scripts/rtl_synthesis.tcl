#######################################################
# Cadence Encounter Tcl script for 
# Process: TOWER JAZZ 180nm
# Version 2
# Feb 29 - 2012
# by Cesar Marin "CeMaTo" email : camarin@cern.ch
#######################################################
################################################
# Synthesizing to generic
################################################
synthesize -to_generic -effort $SYN_EFFORT
report datapath > ../report/datapath_generic.rpt

################################################
# Synthesizing to gates
################################################
synthesize -to_mapped -effort $MAP_EFFORT -no_incr
report datapath > ../report/datapath_mapped_noincr.rpt

if ($RETIME) {
# if {[llength [all::all_seqs]] > 0} {
#    set_attribute dont_retime true [all::all_seqs]
# }
 if ($AREA) {
 retime -prepare
 retime -min_area -effort high -clock $myClk_port $DESIGN
 } else {
 retime -prepare
 retime -min_delay -effort high -clock $myClk_port $DESIGN
 }
}
if {$TIMEGROUP} {
foreach cg [find / -cost_group *] {
  report timing -cost_group [list $cg] > ../report/${DESIGN}_[basename $cg]_post_map.rpt
}
}
##Intermediate netlist for LEC verification..
write_hdl -lec > ../out/${DESIGN}_intermediate.v
#write_do_lec -revised_design ../out/${DESIGN}_intermediate.v -logfile ${logDir}/rtl2intermediate.lec.log > ../out/rtl2intermediate.lec.do

if {$SYN_INCR} {
################################################
# Incremental Synthesis
################################################
## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true /
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique> /
synthesize -to_mapped -effort $MAP_EFFORT -incr   
report datapath > ../report/datapath_mapped_incr.rpt
foreach cg [find / -cost_group -null_ok *] {
  report timing -cost_group [list $cg] > ../report/${DESIGN}_[basename $cg]_post_incr.rpt
  }
}
build_rtl_power_models -design $DESIGN -clean_up_netlist
report power -rtl_cross_reference

if ($SYN_SPAT) {
synthesize -to_mapped -spatial

}
