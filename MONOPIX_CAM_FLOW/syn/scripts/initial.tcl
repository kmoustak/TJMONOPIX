#######################################################
# Cadence Encounter Tcl script for 
# Process: TOWER JAZZ 180nm
# Version 2
# Feb 29 - 2012
# by Cesar Marin "CeMaTo" email : camarin@cern.ch
#######################################################
####################################################################################
#             MAIN SETUP (root attributes & setup variables)                       #
####################################################################################
#####################################################################
# Setup file, directories, and variables
#####################################################################


#####################################################################
# RTL Files & language
#####################################################################
set RTL_PATH 	"../../../source"
set VERILOG_LIST    { MONOPIX.sv }

set SDC_FILE "../../../source/MONOPIX.sdc"

# Name of the top-level entity
#* Set up

set DESIGN  MONOPIX  ;# Top Levelstateselector
set RUNNAME GATE 	;		
set CUSTOM 0
#####################################################################
# Working Library & Operational Conditions
#####################################################################

set LIBRARY { tsl18fs120_ss_1p62v_125c.lib Pulldown_pol_IO_lowcap_EN.lib MONOPIX_TOP.lib} ;
set OP_COND ss_1p62v_125c

# Target technology library folder
set LIB_PATH  "$env(TSL_LIB_PATH)/lib/liberty ../../../libs"
# Target technology library     

set LEFLIB "$env(TSL_LIB_PATH)/tech/lef/6M1L/tsl180l6.lef  $env(TSL_LIB_PATH)/lib/lef/tsl18fs120.lef"


#set CAPTABLE "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/digital/techgen/TSL6ML_TC.CapTbl"

#####################################################################
# Preset global variables and attributes
#####################################################################
set_attribute information_level 9 / ;# valid range: 1 (least verbose) through 9 (most verbose)
#set_attribute dp_area_mode true /
set_attribute map_timing true /
##generates <signal>_reg[<bit_width>] format
set_attribute hdl_array_naming_style "%s\[%d\]" / 
set_attribute retime_reg_naming_suffix "%s_reg%s" /
set_attribute hdl_reg_naming_style "%s_reg%s" /
# GAR conventional naming styles from Matthew:
#set_attribute hdl_array_naming_style %s_%d /
set_attribute hdl_record_naming_style %s_%s /
set_attribute hdl_generate_index_style %s_%d /
set_attribute hdl_generate_separator _ /
set_attribute dp_sharing none /
#set_attribute gui_sv_update manual /;
set_attribute hdl_max_loop_limit 2048 /


#_nominal_
# Mode of wire load estimation
set wire_mode top
### define diagnostic variables
set iopt_stats 1
set global_map_report 1
set map_fancy_names 1
set path_disable_priority 0

### define QoR related variables
#set global_area 2  ; # valid range: 0 through 6
#set dont_downsize_components 1
#set map_slackq 0
#set final_remaps 0
#set initial_target 0
#set crr 1
set crr_max_tries 300  ; # higher the number, more iterations: not much runtime penalty

### define tool setup and compatibility
set_attribute gen_module_prefix G2C_DP_ /
set_attribute input_pragma_keyword {cadence synopsys get2chip g2c} /
set_attribute synthesis_off_command translate_off /
set_attribute synthesis_on_command translate_on /
set_attribute input_case_cover_pragma {full_case} /
set_attribute input_case_decode_pragma {parallel_case} /
set_attribute input_synchro_reset_pragma sync_set_reset /
set_attribute input_synchro_reset_blk_pragma sync_set_reset_local /
set_attribute input_asynchro_reset_pragma async_set_reset /
set_attribute input_asynchro_reset_blk_pragma async_set_reset_local /
set_attribute script_begin dc_script_begin /
set_attribute script_end dc_script_end /
set_attribute iopt_force_constant_removal true /

### setup shrink_factor attribute
set_attribute shrink_factor 1.0 /

set_attribute interconnect_mode ple / 
set_attribute operating_conditions $OP_COND




#######################################
# Run the whole synthesis design flow #
#######################################
# search paths
set_attribute hdl_search_path $RTL_PATH 
set_attribute lib_search_path $LIB_PATH 

# lef libraries
set_attribute lef_library $LEFLIB
#set_attribute cap_table_file $CAPTABLE
# timing libraries
# Select target technology library
set_attribute library $LIBRARY

set_attribute avoid false [find /libraries -libcell tiehi1] /
set_attribute avoid false [find /libraries -libcell tielo1] /


##Uncomment and specify machine names to enable super-threading.
##set_attribute super_thread_servers {<machine names>} /

##Default undriven/unconnected setting is 'none'.  
##set_attribute hdl_unconnected_input_port_value 0 | 1 | x | none /
##set_attribute hdl_undriven_output_port_value   0 | 1 | x | none /
##set_attribute hdl_undriven_signal_value        0 | 1 | x | none /

set_attribute dp_area_mode true /


#### Turn on TNS, affects global and incr opto
#### optimize for Total Negative Slack ( TNS )
set_attribute endpoint_slack_opto true /

#### enable operand-isolation for low-power
set_attribute lp_insert_operand_isolation false /

### Power root attributes
set_attribute lp_clock_gating_prefix lpg /
set_attribute lp_insert_operand_isolation true /
set_attribute hdl_track_filename_row_col true /
set_attribute lp_insert_clock_gating false /
set_attribute lp_multi_vt_optimization_effort low /
set_attr power_optimization_effort low /

set_attribute lp_power_analysis_effort high /
set_attribute lp_power_unit mW /
set_attribute lp_toggle_rate_unit /ns /

