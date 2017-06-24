

create_clock -name CLK_BX -period 25 [get_ports CLK_BX_PAD ]
create_clock -name CLK_OUT -period 25 [get_ports CLK_OUT_PAD ]
create_clock -name CLK_CONF -period 100 [get_ports CLK_CONF_PAD ]

set_clock_transition -min 0.01 [get_clocks CLK_BX]
set_clock_transition -max 0.05 [get_clocks CLK_OUT]

# Use set_clock_uncertainty to estimate Clock Tree skews 
set_clock_uncertainty 0.2 [all_clocks]

set_input_delay 10 -clock CLK_CONF -max [get_ports *_CONF_PAD]
set_input_delay 90 -clock CLK_CONF -min [get_ports *_CONF_PAD]
    
set_input_delay 15 -clock CLK_BX -max [get_ports RESET_BCID_PAD]
set_input_delay 10 -clock CLK_BX -min [get_ports RESET_BCID_PAD]

set_input_delay 15 -clock CLK_BX -max [get_ports READ_*]
set_input_delay 10 -clock CLK_BX -min [get_ports FREEZE_]

set_output_delay 15 -clock CLK_OUT -max -add_delay [get_ports OUT_*]
set_output_delay 10 -clock CLK_OUT -min -add_delay [get_ports OUT_*]

set_output_delay 15 -clock CLK_BX -max -add_delay [get_ports TOKEN_*]
set_output_delay 10 -clock CLK_BX -min -add_delay [get_ports TOKEN_*]

set_false_path -from [get_ports DEF_CONF_PAD]


