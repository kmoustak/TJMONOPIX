
# include needed script
include load_etc.tcl

#####################################################################
# RTL and libraries setup
#####################################################################

# search paths
set_attribute hdl_search_path "../source/"
#set_attribute lib_search_path "/cadence/kits/TOWER/ts18is/std_cells_TOWER_Cds6_Iphc/SRC/Std_cells/FS120_STD_Cells_0_18um_2005_12/DW_TOWER_tsl18fs120/2005.12/synopsys/2004.12/models/" 

set_attribute lib_search_path "/faust/user/kmoustakas/cadence/Lib/tsl18fs120_Rev_2015.08/lib/liberty" 

#set_attribute library "tsl18fs120_max.lib"

set_attribute library "tsl18fs120_tt_1p8v_25c.lib ../libs/Pulldown_pol_IO.lib"

#lef & captbl
#set_attribute lef_library $ec::LEFLIB /
#set_attribute cap_table_file $ec::CAPTABLE /

#####################################################################
# Load RTL
#####################################################################
set_attribute auto_ungroup none /
set_attribute hdl_language sv /

read_hdl MONOPIX.sv

elaborate

read_sdc ../source/MONOPIX.sdc

syn_generic 

syn_map

uniquify MONOPIX

write -m > ./output/r2g.v
write_sdc > ./output/r2g.sdc
 

exit
