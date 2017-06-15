##########################################################################################
#            LOW POWER setup (Leakage/Dynamic power/Clock Gating setup)                  #
##########################################################################################
#######################################################################################
## Leakage/Dynamic power/Clock Gating setup.
#######################################################################################

#### Leakage/Dynamic power/Clock Gating setup.
# uncomment only if your library has a clock-gating ( cg ) cell
#set_attribute lp_clock_gating_cell [find /lib* -libcell <cg_libcell_name>] /
#or
#set_attribute clock_gating_module <cg_module_name> "/designs/$DESIGN"

#set_attribute max_leakage_power 0.0 "/designs/$DESIGN"

set_attribute max_leakage_power 0 /designs/*
set_attribute max_dynamic_power 0 /designs/*

### Power root attributes
set_attribute lp_insert_clock_gating false /
set_attribute lp_clock_gating_prefix lpg /
set_attribute lp_insert_operand_isolation true /
set_attribute hdl_track_filename_row_col true /

## Power root attributes -NEW
#set_attribute lp_insert_clock_gating true /
##set_attribute lp_clock_gating_prefix <string> /
##set_attribute lp_insert_operand_isolation true /
##set_attribute lp_operand_isolation_prefix <string> /
##set_attribute lp_power_analysis_effort <high> /
##set_attribute lp_power_unit mW /
##set_attribute lp_toggle_rate_unit /ns /
#set_attribute hdl_track_filename_row_col true /
#set_attribute lp_multi_vt_optimization_effort low /


#### uncomment only if you have a TCF ( SAIF ) file available for
# power-driven optimizations
#set_attribute lp_power_optimization_weight <value from 0 to 1> "/designs/$DESIGN"
#set_attribute max_dynamic_power <number> "/designs/$DESIGN"
#set_attr lp_optimize_dynamic_power_first true "/designs/$DESIGN"
#set_attribute lp_clock_gating_test_signal <test_signal_object> "/designs/$DESIGN"
#set_attribute lp_map_to_srpg_cells true "/designs/$DESIGN"
#set_attribute lp_srpg_pg_driver <driver> "/designs/$DESIGN"
#read_tcf <TCF file name>
## read_saif <SAIF file name>
