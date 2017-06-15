########################################
# Fillers
########################################

set filler_name {} ;
for {set i 0} {$i < 512} {incr i} { lappend filler_name  [format "FILLER_%02d" $i] } ;

set filler_x 11
set filler_w 60
set cont 0
for {set i 0} {$i < 9} {incr i} {
	addInst -ori R0 -physical -cell filler_60 -loc "$filler_x 19.355" -inst [lindex $filler_name $cont]
	set filler_x [expr $filler_x + $filler_w]
	incr cont
}

set INST_NAME " \
		PWELL_[0].INST_PAD_PWELL \
		ANALOG[0].INST_PAD_AVSS \
		SUBSTRATE[0].INST_PAD_SUB \
		ANALOG[0].INST_PAD_AVDD \
		ANALOG[1].INST_PAD_AVSS \
		ANALOG[1].INST_PAD_AVDD \
		ANALOG[2].INST_PAD_AVSS \
		ANALOG[2].INST_PAD_AVDD \
		PWELL_[1].INST_PAD_PWELL \
		INST_PAD_POR_DIS \
		INST_POWER_ON_RESET \
		ANALOG[3].INST_PAD_AVSS \
		ANALOG[3].INST_PAD_AVDD \
		SUBSTRATE[1].INST_PAD_SUB \
		ANALOG[4].INST_PAD_AVDD \
		ANALOG[4].INST_PAD_AVSS \
		PWELL_[2].INST_PAD_PWELL \
		ANALOG[5].INST_PAD_AVDD \
		ANALOG[5].INST_PAD_AVSS \
		SUBSTRATE[2].INST_PAD_SUB \
		ANALOG[6].INST_PAD_AVDD \
		ANALOG[6].INST_PAD_AVSS \
		ANALOG[7].INST_PAD_AVDD \
		ANALOG[7].INST_PAD_AVSS \
		SUBSTRATE[3].INST_PAD_SUB \
		PWELL_[3].INST_PAD_PWELL \
		INST_PAD_DACMONV \
		ANALOG[8].INST_PAD_AVSS \
		ANALOG[8].INST_PAD_AVDD \
		SUBSTRATE[4].INST_PAD_SUB \
		PWELL_[4].INST_PAD_PWELL \
		INST_PAD_DACMONI \
		INST_TEMP_SENSOR \
		SUBSTRATE[5].INST_PAD_SUB \
		ANALOG[9].INST_PAD_AVSS \
		ANALOG[9].INST_PAD_AVDD \
		"
set cont1 0
foreach place_inst $INST_NAME {
	set instance [lindex $INST_NAME $cont1]
	set instance [concat $instance1$instance]
	selectInst $instance
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 0] - 60 ] 19.355" -inst [lindex $filler_name $cont]
	incr cont
	addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 2]  ] 19.355" -inst [lindex $filler_name $cont]
	deselectAll
	incr cont1
	incr cont

}


set filler_x 29537.62
set filler_w 60
for {set i 0} {$i < 7} {incr i} {
	addInst -ori R0 -physical -cell filler_60 -loc "$filler_x 19.355" -inst [lindex $filler_name $cont]
	set filler_x [expr $filler_x + $filler_w]
	incr cont
}
addInst -ori R0 -physical -cell filler_60 -loc "[expr $X1 - 70] 19.355" -inst [lindex $filler_name $cont]
incr cont

set instance "INST_PAD_RING/INST_FUSES_BLOCK"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_10 -loc "[expr [lindex $boxn 0] - 9.995 ] 19.355" -inst [lindex $filler_name $cont]
incr cont
addInst -ori R0 -physical -cell filler_20 -loc "[expr [lindex $boxn 2]  ] 19.355" -inst [lindex $filler_name $cont]
incr cont
set instance "INST_PAD_RING/INST_PAD_PWR33"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 2] ] 19.355" -inst [lindex $filler_name $cont]
incr cont
set instance "INST_PAD_RING/DIGITAL[2].INST_PAD_DVSS"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 0] - 60] 19.355" -inst [lindex $filler_name $cont]
incr cont
addInst -ori R0 -physical -cell filler_10 -loc "[expr [lindex $boxn 2] ] 19.355" -inst [lindex $filler_name $cont]
incr cont
set instance "INST_PAD_RING/DIGITAL[4].INST_PAD_DVSS"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 0] - 60] 19.355" -inst [lindex $filler_name $cont]
incr cont
addInst -ori R0 -physical -cell filler_10 -loc "[expr [lindex $boxn 2] ] 19.355" -inst [lindex $filler_name $cont]
incr cont
set instance "INST_PAD_RING/DIGITAL[5].INST_PAD_DVDD"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 0] - 60] 19.355" -inst [lindex $filler_name $cont]
incr cont
addInst -ori R0 -physical -cell filler_10 -loc "[expr [lindex $boxn 2] ] 19.355" -inst [lindex $filler_name $cont]
incr cont
set instance "INST_PAD_RING/DIGITAL[7].INST_PAD_DVDD"
selectInst $instance
set boxn [split [join [dbGet selected.box]]]
set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
set boxn_Y0 [lindex $boxn 1];
set boxn_Y1 [lindex $boxn 3];
addInst -ori R0 -physical -cell filler_60 -loc "[expr [lindex $boxn 0] - 60] 19.355" -inst [lindex $filler_name $cont]
incr cont
addInst -ori R0 -physical -cell filler_10 -loc "[expr [lindex $boxn 2] ] 19.355" -inst [lindex $filler_name $cont]
incr cont
