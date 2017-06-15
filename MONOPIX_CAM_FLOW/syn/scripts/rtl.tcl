#######################################################
# Cadence Encounter Tcl script for 
# Process: TOWER JAZZ 180nm
# Version 2
# Feb 29 - 2012
# by Cesar Marin "CeMaTo" email : camarin@cern.ch
#######################################################

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}
# start timer
puts "Start at: [clock format [clock seconds] -format {%x %X}]"
set start [clock seconds]

#####################################################################
# Setup file, directories, and variables
#####################################################################

set SYN_EFFORT      high 	;# Synthesis EFFORT	
set MAP_EFFORT      high 	;# Synthesis Mapping EFFORT
set INCR_EFFORT     high 	;# Synthesis Incremental EFFORT

###################################################
#Flags that drive the script behavior (can be changed )
# WORKING LIBRARY 
# 1 Typical - TSL18FS120_typ.lib
# 2 Minimum - TSL18FS120_min.lib 
# 3 Maximum - TSL18FS120_max.lib
# Operating conditions (_nominal_ is an alias for the actual unique operating condition for the selected library)
set WORKING_LIBRARY 1
set AREA 	1 ; # Timing Optimization by AREA = 0 or Timing =1
set SYN_SPAT 	0 ; # Synthesis Spatial
set SYN_INCR 	1 ; # Synthesis Incremental
set RETIME 	0; 
set COMB	1;
set TIMEGROUP 	0;
#### Including setup file (root attributes, setup variables & HDL files).
include ../scripts/initial.tcl

#######################################
# Read HDL files
#######################################
puts "\nEC INFO: Read HDL files.\n"
#set_attribute hdl_vhdl_read_version $VHDL_VERSION
#read_hdl -vhdl -top $top_level -library work $vhdl_src_files

set_attribute hdl_language sv /
read_hdl -sv $VERILOG_LIST ;#-v2001 -sv

# report time and memory
puts "\nEC INFO: Total cpu-time and memory after LOAD: [get_attr runtime /] sec., [get_attr memory_usage /] MBytes.\n"

#######################################
# elaborate
#######################################
puts "\nEC INFO: Elaborate.\n"

elaborate $DESIGN


# GAR forcing not to merge the equivalent FFs (protect TMR)
set_attribute optimize_merge_flops false /

# GAR Make use of tiehi tielo cells
set_attribute use_tiehilo_for_const duplicate ;
set_attribute ignore_preserve_in_tiecell_insertion  true;
 
# GAR Remove all assigns 
set_attribute remove_assigns true ;
set_remove_assign_options -verbose 
set_remove_assign_options -ignore_preserve_setting 

# GAR Prevent merging of decoding modules
set_attribute merge_combinational_hier_instances false ;


get_attribute number_of_routing_layer /designs/*
set_attribute number_of_routing_layers 6 /designs/*

read_sdc ../../source/MONOPIX.sdc
# check that the design is OK so far
check_design $DESIGN -unresolved
#### power estimate at rtl level

report power -rtl -detail
report timing -lint

#### Including LOW POWER setup. (Leakage/Dynamic power/Clock Gating setup)
include ../scripts/setup_power.tcl

# report initial design
echo "*************************************"
echo "*** PRE SYNTHESIZED DESIGN REPORT ***"
echo "*************************************"
report design  $DESIGN
report design > ../report/${DESIGN}_PRESYN_design.rpt
report gates $DESIGN
report gates $DESIGN > ../report/${DESIGN}_PRESYN_gate.rpt
# report initial area
report area $DESIGN
report area $DESIGN > ../report/${DESIGN}_PRESYN_area.rpt
report timing 
report timing > ../report/${DESIGN}_PRESYN_timing.rpt
report timing -full > ../report/${DESIGN}_PRESYN_FULL_timing.rpt

if {$TIMEGROUP} {
### report initial timing groups
report timing -end -slack 0 > ../report/init.timing.ep
report timing -from [dc::all_inputs] > ../report/init.timing.in
report timing -to   [dc::all_outputs] > ../report/init.timing.out

set CNT 1
foreach CLK [find /designs* -clock *] {
  exec echo "####################" > ../report/init.timing.clk$CNT
  exec echo "# from clock: $CLK" >> ../report/init.timing.clk$CNT
  exec echo "# to clock: $CLK" >> ../report/init.timing.clk$CNT
  exec echo "####################" >> ../report/init.timing.clk$CNT
  report timing -from $CLK -to $CLK >> ../report/init.timing.clk$CNT
  incr CNT
}
}
#### Including SYNTHESIS setup
include ../scripts/rtl_synthesis.tcl
#remove_cdn_loop_breaker -instance [find / -inst cdn_loop_breaker]

# report synthesized design
echo "*************************"
echo "*** SYNTHESIZED REPORT **"
echo "*************************"
report design > ../report/${DESIGN}_design.rpt
report clock_gating > ../report/${DESIGN}_clockgating.rpt
report power -depth 0 > ../report/${DESIGN}_power.rpt
report gates  > ../report/${DESIGN}_gates.rpt
report gates -power > ../report/${DESIGN}_gates_power.rpt
report operand_isolation > ../report/${DESIGN}_op_isolation.rpt
report area > ../report/${DESIGN}_area.rpt
report timing > ../report/${DESIGN}_timing.rpt
report timing -full > ../report/${DESIGN}_FULL_timing.rpt
report timing -full

#####################################################################
# BEGIN POSTAMBLE: DO NOT EDIT
write_design -basename ../out/${DESIGN}_${RUNNAME}
# Write the netlist
#write -m > ../out/${DESIGN}_${RUNNAME}_mapped.v
#write_hdl $DESIGN > ../out/${DESIGN}_${RUNNAME}.v
# Write SDC file
write_sdc $DESIGN > ../out/${DESIGN}_${RUNNAME}.sdc
# Write SDF file
write_sdf > ../out/${DESIGN}_${RUNNAME}.sdf
# Write RC script file
#write_script  $DESIGN > ../out/${DESIGN}_${RUNNAME}.script
# END POSTAMBLE
#####################################################################

#################################
### write_do_lec
#################################


write_do_lec -golden_design ../out/${DESIGN}_intermediate.v -revised_design ../out/${DESIGN}_${RUNNAME}.v -logfile  ../out/intermediate2final.lec.log > ../out/intermediat:qe2final.lec.do

#write_do_lec -revised_design ../out/${DESIGN}_${RUNNAME}.v -logfile ${logDir}/rtl2final.lec.log > ../out/rtl2final.lec.do

file copy [get_attr stdout_log /] ../out/.
# end timer
puts "\nEC INFO: End at: [clock format [clock seconds] -format {%x %X}]"
set end [clock seconds]
set seconds [expr $end - $start]
puts "\nEC INFO: Elapsed-time: $seconds seconds\n"
report summary
report gates
report hierarchy 
# Quit
