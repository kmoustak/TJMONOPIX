
########################################
# Decoupling Filler Cells
########################################
#set pad_dig_names {};
#foreach cell_ptr [dbGet top.insts.cell.name -p2 Pull*    ] {lappend pad_dig_names [dbGet $cell_ptr.name]};

set INST_NAME " \
          PWELL_[0].INST_PAD_PWELL \
          ANALOG[0].INST_PAD_AVSS \
          ANALOG[0].INST_PAD_AVDD \
          SUBSTRATE[0].INST_PAD_SUB \
		DIGITAL[0].INST_PAD_DVSS \
		DIGITAL[0].INST_PAD_DVDD \
          SUBSTRATE[4].INST_PAD_SUB \
          ANALOG[1].INST_PAD_AVSS \
          ANALOG[1].INST_PAD_AVDD \
		DIGITAL[1].INST_PAD_DVSS \
		DIGITAL[1].INST_PAD_DVDD \
		INST_PAD_SCI \
          ANALOG[2].INST_PAD_AVSS \
          ANALOG[2].INST_PAD_AVDD \
		INST_PAD_CHIPID_6 \
          DIGITAL[2].INST_PAD_DVSS \
		DIGITAL[2].INST_PAD_DVDD \
          PWELL_[1].INST_PAD_PWELL \
		INST_PAD_RESERVE_0 \
		INST_PAD_RST_N \
		INST_PAD_RESERVE_2 \
		DIGITAL[3].INST_PAD_DVSS \
		DIGITAL[3].INST_PAD_DVDD \
		INST_PAD_CHIPID_5 \
          INST_PAD_POR_DIS \
          ANALOG[3].INST_PAD_AVDD \
          DIGITAL[4].INST_PAD_DVSS \
		DIGITAL[4].INST_PAD_DVDD \
          SUBSTRATE[1].INST_PAD_SUB \
          ANALOG[4].INST_PAD_AVSS \
          ANALOG[4].INST_PAD_AVDD \
		INST_PAD_SCO \
		INST_PAD_CHIPID_4 \
		DIGITAL[5].INST_PAD_DVSS \
          DIGITAL[5].INST_PAD_DVDD \
          PWELL_[2].INST_PAD_PWELL \
		DIGITAL[6].INST_PAD_DVSS \
		DIGITAL[6].INST_PAD_DVDD \
          ANALOG[5].INST_PAD_AVSS \
          ANALOG[5].INST_PAD_AVDD \
		INST_PAD_CHIPID_3 \
		DIGITAL[7].INST_PAD_DVDD \
		INST_PAD_CHIPID_2 \
		DIGITAL[7].INST_PAD_DVSS \
		INST_PAD_SCE \
          ANALOG[6].INST_PAD_AVSS \
          ANALOG[6].INST_PAD_AVDD \
		DIGITAL[8].INST_PAD_DVSS \
		DIGITAL[8].INST_PAD_DVDD \
		INST_PAD_CTRL \
		DIGITAL[9].INST_PAD_DVSS \
		DIGITAL[9].INST_PAD_DVDD \
		DIGITAL[10].INST_PAD_DVSS \
		DIGITAL[10].INST_PAD_DVDD \
		INST_PAD_DATA_3 \
		INST_PAD_DATA_7 \
		DIGITAL[11].INST_PAD_DVSS \
		DIGITAL[11].INST_PAD_DVDD \
		INST_PAD_CHIPID_1 \
		INST_PAD_DATA_2 \
		INST_PAD_DATA_6 \
		DIGITAL[12].INST_PAD_DVSS \
		DIGITAL[12].INST_PAD_DVDD \
		DIGITAL[13].INST_PAD_DVSS \
		INST_PAD_DATA_1 \
		INST_PAD_DATA_5 \
		DIGITAL[13].INST_PAD_DVDD \
          ANALOG[7].INST_PAD_AVSS \
          ANALOG[7].INST_PAD_AVDD \
		INST_PAD_DATA_0 \
		INST_PAD_DATA_4 \
          SUBSTRATE[2].INST_PAD_SUB \
		DIGITAL[14].INST_PAD_DVSS \
		DIGITAL[14].INST_PAD_DVDD \
		INST_PAD_BUSY \
		INST_PAD_CHIPID_0 \
		ANALOG[8].INST_PAD_AVSS \
		ANALOG[8].INST_PAD_AVDD \
          PWELL_[3].INST_PAD_PWELL \
          INST_PAD_DACMONV \
          INST_TEMP_SENSOR \
	"


deselectAll
set instance1 "INST_PAD_RING/"
set cont 0
set cont1 0
set decap 0
set instance ""
set instance2 ""
deselectAll
set instance INST_PAD_RING/DECOUPLE[0].INST_DEC_CELL
selectInst $instance
set boxc [split [join [dbGet selected.box]]]
set boxc_w [expr [lindex $boxc 2]- [lindex $boxc 0]];
set boxc_h [expr [lindex $boxc 3] - [lindex $boxc 1]];


foreach place_inst $INST_NAME {
	set instance [lindex $INST_NAME $cont1]
	set instance [concat $instance1$instance]
	selectInst $instance
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	deselectAll

	incr cont1

	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(3-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}

	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 2] + (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 2] +(3-$i)*$boxc_w - $boxc_w] $boxn_Y1 ;
		incr cont
	}

}


set INST_NAME "ANALOG[3].INST_PAD_AVSS \
          SUBSTRATE[3].INST_PAD_SUB"
set cont1 0
set cont 0
foreach place_inst $INST_NAME {
	set instance [lindex $INST_NAME $cont1]
	set instance [concat $instance1$instance]
	selectInst $instance
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
#	set instance2 [lindex $INST_NAME [expr $cont +1]]
#	set instance2 [concat $instance1$instance2]
	deselectAll
	incr cont1


	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 2] + (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 2] +(3-$i)*$boxc_w - $boxc_w] $boxn_Y1 ;
		incr cont
	}

}



set INST_NAME "INST_POWER_ON_RESET \
          INST_PAD_DACMONI "
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
#	set instance2 [lindex $INST_NAME [expr $cont +1]]
#	set instance2 [concat $instance1$instance2]
	deselectAll
	incr cont1

	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(3-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}
}

deselectAll
selectInst INST_PAD_RING/DECOUPLE[0].INST_DEC_CELL
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 22} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (22 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(22-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}
deselectAll
selectInst INST_PAD_RING/DECOUPLE_LEFT[3].INST_DEC_CELL
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 10} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 2] + (10 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 2] +(10-$i)*$boxc_w - $boxc_w] $boxn_Y1 ;
		incr cont
	}


deselectAll
selectInst INST_PAD_RING/DECOUPLE[36].INST_DEC_CELL
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 11} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (11 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(11-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}

set INST_NAME "INST_PAD_RING/INST_MLVDS_MCLK \
               INST_PAD_RING/INST_MLVDS_DCTRL \
               INST_PAD_RING/INST_MLVDS_DCLK"
foreach place_inst $INST_NAME {
     deselectAll
	selectInst $place_inst
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 5} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (5 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(5-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}
}

deselectAll
	selectInst INST_PAD_RING/INST_DTU
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 6} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 2] + (6 -$i)*$boxc_w +1] [expr $boxn_Y0 ] [expr [lindex $boxn 2] +(6-$i)*$boxc_w - $boxc_w+1] $boxn_Y1 ;
		incr cont
	}
setObjFPlanBox instance INST_PAD_RING/INST_DTU [lindex $boxn 0] 15.82 [lindex $boxn 2] $boxn_Y1

deselectAll
	selectInst INST_PAD_RING/SUBSTRATE[3].INST_PAD_SUB
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	for { set i 0} { $i < 2} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (2 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(2-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}



#	selectInst INST_PAD_RING/INST_DTU
#	set boxn [split [join [dbGet selected.box]]]
#	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
#	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
#	set boxn_Y0 [lindex $boxn 1];
#	set boxn_Y1 [lindex $boxn 3];
#	for { set i 0} { $i < 3} {incr i} {
#		set place_inst [concat "INST_PAD_RING/DECOUPLE_LEFT["$cont"].INST_DEC_CELL"];
#		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(3-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
#		incr cont
#	}


setObjFPlanBox instance INST_PAD_RING/DECOUPLE[243].INST_DEC_CELL 8017.62 $boxn_Y0 8037.62 $boxn_Y1



set INST_NAME " PLL[0].INST_PAD_DVSS \
               PLL[0].INST_PAD_DVDD \
               PLL[1].INST_PAD_DVSS \
               PLL[1].INST_PAD_DVDD "


deselectAll
set instance1 "INST_PAD_RING/"
set cont 0
set cont1 0
set decap 0
set instance ""
set instance2 ""
deselectAll
set instance INST_PAD_RING/DECOUPLE[0].INST_DEC_CELL
selectInst $instance
set boxc [split [join [dbGet selected.box]]]
set boxc_w [expr [lindex $boxc 2]- [lindex $boxc 0]];
set boxc_h [expr [lindex $boxc 3] - [lindex $boxc 1]];


foreach place_inst $INST_NAME {
	set instance [lindex $INST_NAME $cont1]
	set instance [concat $instance1$instance]
	selectInst $instance
	set boxn [split [join [dbGet selected.box]]]
	set boxn_w [expr [lindex $boxn 2]- [lindex $boxn 0]+0.00];
	set boxn_h [expr [lindex $boxn 3]- [lindex $boxn 1]+0.00];
	set boxn_Y0 [lindex $boxn 1];
	set boxn_Y1 [lindex $boxn 3];
	deselectAll

	incr cont1

	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_PLL["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 0] - (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 0] -(3-$i)*$boxc_w + $boxc_w] $boxn_Y1 ;
		incr cont
	}

	for { set i 0} { $i < 3} {incr i} {
		set place_inst [concat "INST_PAD_RING/DECOUPLE_PLL["$cont"].INST_DEC_CELL"];
		setObjFPlanBox instance $place_inst  [expr [lindex $boxn 2] + (3 -$i)*$boxc_w] [expr $boxn_Y0 ] [expr [lindex $boxn 2] +(3-$i)*$boxc_w - $boxc_w] $boxn_Y1 ;
		incr cont
	}

}



