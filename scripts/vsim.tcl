

vlog -sv ../sim/monopix_tb.sv -lint +incdir+../source
vsim monopix_tb -novopt
add wave -group tb sim:/monopix_tb/*
add wave -group dut sim:/monopix_tb/dut/*
run 10ms
