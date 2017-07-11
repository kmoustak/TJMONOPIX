vlog -sv ../sim/monopix_tb.sv -lint +incdir+../source
vsim monopix_tb -novopt
add wave -group tb sim:/monopix_tb/*
add wave -group dut sim:/monopix_tb/dut/*
add wave -group MONOPIX_TOP sim:/monopix_tb/dut/MONOPIX_TOP/*
add wave -group pix0_0 {sim:/monopix_tb/dut/MONOPIX_TOP/col_gen[0]/genblk1/row_gen[0]/pix/*}
add wave -group pix0_1 {sim:/monopix_tb/dut/MONOPIX_TOP/col_gen[0]/genblk1/row_gen[1]/pix/*}
add wave -group pix0_447 {sim:/monopix_tb/dut/MONOPIX_TOP/col_gen[0]/genblk1/row_gen[447]/pix/*}
add wave -group readout_PMOS_NOSF {sim:/monopix_tb/dut/readout_PMOS_NOSF/*}
add wave -group readout_PMOS_NOSF_serializer {sim:/monopix_tb/dut/readout_PMOS_NOSF/serializer/*}
add wave -group eoc_0_0 {sim:/monopix_tb/dut/readout_PMOS_NOSF/col_gen[0]/eoc/*}
add wave -group control_pmos_nosf {sim:/monopix_tb/control_pmos_nosf/*}
#vcd file SI_CONF.vcd
#vcd add /monopix_tb/dut/SI_CONF_PAD
#vcd dumpports -file SI_CONF2.vcd /monopix_tb/dut/SI_CONF_PAD
run 110us
