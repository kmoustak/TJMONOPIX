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
create_clock -name CLK_BX -period 25 [get_ports CLK_BX_PAD ]
create_clock -name CLK_OUT -period 25 [get_ports CLK_OUT_PAD ]
create_clock -name CLK_CONF -period 100 [get_ports CLK_CONF_PAD ]

# Use set_clock_uncertainty to estimate Clock Tree skews 
set_clock_uncertainty 0.05 [all_clocks]


set_clock_transition -min 0.01 [get_clocks CLK_BX]
set_clock_transition -max 0.05 [get_clocks CLK_OUT]


# Use set_clock_uncertainty to estimate Clock Tree skews 
set_clock_uncertainty  0.050 [all_clocks]


# Use set_clock_latency -source to model clock jitter (or off-chip clock skew)
set_clock_latency  -source -early -0.1 [all_clocks] ; # early arrival of source clock
set_clock_latency  -source -late   0.01 [all_clocks] ; # late arrival of source clock


###########################
# Input constraints 
###########################

#### Max fanout for the input nets



set_input_delay -clock [all_clocks] -add_delay -max 0.1  [all_inputs];#[get_ports -filter direction==in * ] ;
set_input_delay -clock [all_clocks] -add_delay -min  0.01  [all_inputs];#[get_ports -filter direction==in * ] ;

#set_input_delay -from [get_clocks CLK] -add_delay -max 1.0  { SELECT }
#set_input_delay -from [get_clocks CLK] -add_delay -min 0.1 { SELECT }


set_input_transition  0.1 -max [all_inputs] ;
set_input_transition  0.00 -min [all_inputs] ;



set_propagated_clock [all_clocks]

###############################################################
# Input constraints 
###############################################################

# Constraining max fanout for the input nets (number of gates connected to the pin)
set_max_fanout 6.0 [all_inputs]

# Constraining max capacitance that can be connected each input pin (allows the tool to size the input buffers correctly)
set_max_capacitance   1 [all_inputs]

###########################
# Output  constraints 
###########################

# Loads on output pins

# Set default output max capacitance constraint for long connections
# External 500 fF capacitance load on all output pins
set_load  -max 0.007 [all_outputs]
set_load  -min 0.001 [all_outputs]


set_output_delay -clock [all_clocks]  -add_delay -max 10.000 [all_outputs ];  #all_outputs
set_output_delay -clock [all_clocks]  -add_delay -min 3.000 [all_outputs ]; 



###########
# Buffer constraint 
################


#set_false_path -from [get_clocks CLK] -to [get_ports PIX_STATE[0]]

