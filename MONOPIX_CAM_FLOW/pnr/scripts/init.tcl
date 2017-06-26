
createLib TJ_Monopix_01  -noCompress -attachTech ts018_prim
createLib TJ_Monopix_PADS  -noCompress -attachTech ts018_prim

set status [catch {exec lef2oa -lef ../../../libs/matrix_dac.lef -overwrite -lib TJ_Monopix_01 -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/matrix_dac.lef -overwrite -lib TJ_Monopix_01 -view layout} result]
puts $result
verilogAnnotate -refLibs TJ_Monopix_01 -verilog ../../../libs/matrix_dac.pins.v

set status [catch {exec lef2oa -lef ../../../libs/digital_ring.lef -overwrite -lib TJ_Monopix_01 -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/digital_ring.lef -overwrite -lib TJ_Monopix_01 -view layout} result]
puts $result

set status [catch {exec lef2oa -lef ../../../libs/Pulldown_pol_IO_lowcap_EN.lef -overwrite -lib TJ_Monopix_PADS -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/Pulldown_pol_IO_lowcap_EN.lef -overwrite -lib TJ_Monopix_PADS -view layout} result]
puts $result

set status [catch {exec lef2oa -lef ../../../libs/decoupling_cap_filler.lef -overwrite -lib TJ_Monopix_PADS -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/decoupling_cap_filler.lef -overwrite -lib TJ_Monopix_PADS -view layout} result]
puts $result

set status [catch {exec lef2oa -lef ../../../libs/PAD_DVDD.lef -overwrite -lib TJ_Monopix_PADS -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/PAD_DVDD.lef -overwrite -lib TJ_Monopix_PADS -view layout} result]
puts $result

set status [catch {exec lef2oa -lef ../../../libs/PAD_DVSS.lef -overwrite -lib TJ_Monopix_PADS -view abstract} result]
set status [catch {exec lef2oa -lef ../../../libs/PAD_DVSS.lef -overwrite -lib TJ_Monopix_PADS -view layout} result]
puts $result

exit
