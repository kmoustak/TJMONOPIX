

create_clock -name CLK_BX -period 25 [get_ports CLK_BX_PAD ]
create_clock -name CLK_OUT -period 25 [get_ports CLK_OUT_PAD ]
create_clock -name CLK_CONF -period 100 [get_ports CLK_CONF_PAD ]

set_clock_transition -min 0.01 [get_clocks CLK_BX]
set_clock_transition -max 0.05 [get_clocks CLK_OUT]

# Use set_clock_uncertainty to estimate Clock Tree skews 
set_clock_uncertainty 0.05 [all_clocks]



