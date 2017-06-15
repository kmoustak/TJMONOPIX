#######################################################
#                                                     
#  Cesar Marin
#
#  Created on 4/10/2013
#                                                     
#######################################################



##########################
# Units
##########################

# Default: capacitance = 1 pF, time 1 ns 

#set_units -time 1ns -resistance 1kOhm -capacitance 1pF -voltage 1V -current 1mA 

create_clock -name CLK -period 20  -waveform {0 10} ;# [get_ports PE_RESET ]
#create_generated_clock -name CTRLCLK -source [get_pins buf_13/Z ] -multiply_by 1 -master_clock CLK -add -duty_cycle 100


set_clock_transition -min 0.01 [get_clocks CLK]
set_clock_transition -max 0.05 [get_clocks CLK]


# Use set_clock_uncertainty to estimate Clock Tree skews 
set_clock_uncertainty  0.050 [get_clocks CLK]


# Use set_clock_latency -source to model clock jitter (or off-chip clock skew)
set_clock_latency  -source -early -0.01 [get_clocks CLK] ; # early arrival of source clock
set_clock_latency  -source -late   0.001 [get_clocks CLK] ; # late arrival of source clock


###########################
# Input constraints 
###########################

#### Max fanout for the input nets
#set_max_fanout 2.000 {PE_RESET};#current_design
#set_min_fanout 1.000 {PE_RESET}

#reset_max_fanout 0 [get_ports -filter direction==in PIX_STATE* ]
#reset_min_fanout 0 [get_ports -filter direction==in PIX_STATE* ]

#set_logic_one [get_ports {PE_GRST PE_PLSE PE_PLSE_TYPE PE_STROBE[*] PE_CNFG_COLSEL_A PE_CNFG_COLSEL_B PE_CNFG_DATA PE_CNFG_REGSEL PE_MEMSEL[*] }]

# Add futher input ports here

set_input_delay -clock [get_clocks CLK] -add_delay -max 0.01  [all_inputs];#[get_ports -filter direction==in * ] ;
set_input_delay -clock [get_clocks CLK] -add_delay -min  0.001  [all_inputs];#[get_ports -filter direction==in * ] ;

#set_input_delay -from [get_clocks CLK] -add_delay -max 1.0  { SELECT }
#set_input_delay -from [get_clocks CLK] -add_delay -min 0.1 { SELECT }


set_input_transition  0.001 -max [all_inputs] ;
set_input_transition  0.00 -min [all_inputs] ;

#set_input_transition  2.00 -max { PE_RESET } ;
#set_input_transition  1.00 -min { PE_RESET } ;



### ADDED by CEMATO on 21/02/2014
#set_annotated_transition 0.001 [get_pins buf_8/inst_*/Z]
#set_annotated_transition 0.001 [get_pins buf_8/buf_*/Z]
set_propagated_clock [all_clocks]



###########################
# Output  constraints 
###########################

# Loads on output pins

# Set default output max capacitance constraint for long connections
# External 500 fF capacitance load on all output pins
set_load  -max 0.007 [all_outputs]
set_load  -min 0.001 [all_outputs]

#set_max_capacitance 2 [get_ports -filter direction==out PE_ADDR[*]]
#set_min_capacitance 0.005 [get_ports -filter direction==out PE_ADDR[*] ]

#set_max_capacitance 2 [get_ports -filter direction==out PE_VALID ]
#set_min_capacitance 0.005 [get_ports -filter direction==out PE_VALID ]


#set_max_capacitance 2 [current_design]
#set_min_capacitance 0.005 [current_design]

#reset_max_capacitance [get_ports SELECT]

#set_output_delay -clock CLK -add_delay -max 0.100 [get_ports -filter direction==out PE_ADDR* ];  #all_outputs
#set_output_delay -clock CLK -add_delay -min 0.000 [get_ports -filter direction==out PE_ADDR* ]; 

set_output_delay -clock CLK -add_delay -max 0.100 [all_ouputs ];  #all_outputs
set_output_delay -clock CLK -add_delay -min 0.000 [all_ouputs ]; 



###########
# Buffer constraint 
################
set_dont_touch /designs/readoutx16/nets/state[*]
#set_dont_touch /designs/discriminator2/pixelTMR/nets/temp_*
set_dont_touch /designs/readoutx16/nets/mirror[*]
set_dont_touch /designs/readoutx16/nets/pix_temp[*]
set_dont_touch /designs/readoutx16/nets/one
set_dont_touch /designs/readoutx16/nets/one1
set_dont_touch /designs/readoutx16/nets/one2

set_dont_touch /designs/readoutx16/nets/dump
set_dont_touch /designs/readoutx16/nets/resetblocking

set_dont_touch [get_cells p_0]
set_dont_touch [get_cells p_0/inv_*]
set_dont_touch [get_nets p_0/i[*]]
set_dont_touch [get_nets p_0/iaux[*]]
set_dont_touch [get_nets p_0/i[*]]

set_dont_touch [get_cells p_0/d/inv_*]
set_dont_touch [get_cells p_0/d/nr_*]
set_dont_touch [get_cells p_0/d/nd_*]
set_dont_touch [get_cells p_0/d/del_*]


set_dont_touch [get_cells buf_*]
set_dont_touch [get_cells nd_*]
set_dont_touch [get_cells nd_*/nd_*]
set_dont_touch [get_nets nd_*/temp[*]]


#set_dont_touch /designs/discriminatorx16/pulser*/nets/temp[*]

#set_dont_touch [get_cells buf_*/buf_*]
#set_dont_touch_network p_0/temp[*]

#set_dont_touch [get_cells buf_13]
#set_dont_touch [get_cells buf_*/buf_*]


#set_dont_touch_network ENABLE


#set_false_path -from [get_clocks CLK] -to set_false_path through buf_*/buf_*/I
#set_false_path -from [get_clocks CLK] -to set_false_path through buf_*/buf_*/Z
#set_disable_timing [get_pins buf_0/buf_*/I]

#set_false_path -from [get_clocks CLK] -to [get_ports PIX_STATE[0]]

