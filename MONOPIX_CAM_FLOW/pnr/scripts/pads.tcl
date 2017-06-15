
######

set pad_names {} ;
for {set i 0} {$i < 38} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/DATA_%d_INST_PAD_DATA_LEFT" $i] 
}
foreach inst $pad_names {
set instName "$inst"
flipOrRotateObject -name "$inst" -rotate R270
}

set offx 20
set offy [expr $Y1 - 120]
for {set i 0} {$i < [llength $pad_names]} {incr i} {
deselectAll
selectInst [lindex $pad_names $i]
set boxn [split [join [dbGet selected.box]]]
set BOX_W [expr [lindex $boxn 2]-[lindex $boxn 0]]
set BOX_H [expr [lindex $boxn 3]-[lindex $boxn 1]]

setObjFPlanBox instance   [lindex $pad_names $i] $offx $offy [expr $offx + $BOX_W] [expr $offy +$BOX_H];
     set offy [expr $offy-20-$BOX_H]
}


set pad_names {} ;

for {set i 5} {$i < 15} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/DIGITAL_%d_INST_PAD_DVDD" $i] 
     lappend pad_names  [format "INST_PAD_RING/DIGITAL_%d_INST_PAD_DVSS" $i] 

} ;


for {set i 0} {$i < 4} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/BACKBIAS_%d_INST_PAD_PWELL" $i] 
}



for {set i 0} {$i < 2} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/CHIPID_%d_INST_PAD_CHIPID" $i] 
}


foreach inst $pad_names {
set instName "$inst"
flipOrRotateObject -name "$inst" -rotate R270
}
for {set i 0} {$i < [llength $pad_names]} {incr i} {
deselectAll
selectInst [lindex $pad_names $i]
set boxn [split [join [dbGet selected.box]]]
set BOX_W [expr [lindex $boxn 2]-[lindex $boxn 0]]
set BOX_H [expr [lindex $boxn 3]-[lindex $boxn 1]]

setObjFPlanBox instance   [lindex $pad_names $i] $offx $offy [expr $offx + $BOX_W] [expr $offy +$BOX_H];
     set offy [expr $offy-20-$BOX_H]
}



set pad_names {} ;
for {set i 0} {$i < 38} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/DATA_%d_INST_PAD_DATA_RIGHT" $i] 
}
foreach inst $pad_names {
set instName "$inst"
flipOrRotateObject -name "$inst" -rotate R90
}

set offx [expr $X1 - 140]
set offy [expr $Y1 - 120]
for {set i 0} {$i < [llength $pad_names]} {incr i} {
deselectAll
selectInst [lindex $pad_names $i]
set boxn [split [join [dbGet selected.box]]]
set BOX_W [expr [lindex $boxn 2]-[lindex $boxn 0]]
set BOX_H [expr [lindex $boxn 3]-[lindex $boxn 1]]

setObjFPlanBox instance   [lindex $pad_names $i] $offx $offy [expr $offx + $BOX_W] [expr $offy +$BOX_H];
     set offy [expr $offy-20-$BOX_H]
}



set pad_names {} ;


for {set i 0} {$i < 1} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/ANALOG_%d_INST_PAD_AVSS" $i] 
     lappend pad_names  [format "INST_PAD_RING/ANALOG_%d_INST_PAD_AVDD" $i] 

} ;

for {set i 0} {$i < 1} {incr i} { 
     lappend pad_names  [format "INST_PAD_RING/SUBSTRATE_%d_INST_PAD_SUB" $i] 
}



for {set i 0} {$i < [llength $pad_names]} {incr i} {
deselectAll
selectInst [lindex $pad_names $i]
set boxn [split [join [dbGet selected.box]]]
set BOX_W [expr [lindex $boxn 2]-[lindex $boxn 0]]
set BOX_H [expr [lindex $boxn 3]-[lindex $boxn 1]]

setObjFPlanBox instance   [lindex $pad_names $i] $offx $offy [expr $offx + $BOX_W] [expr $offy +$BOX_H];
     set offx [expr $offx+20+$BOX_W]
}

set hardxid [expr $mergerX + 25 ]
set hardyid [expr $mergerY -$std_h ]
set hard_w 8.96

set inst_names {} ;



########################################
puts "Create 'guide' placement constraints for HardWire Identification "
########################################


set count 0
for {set i 0} {$i < 128} {incr i} {

     createGuide  [lindex $inst_names $count] $hardxid $hardyid [expr $hardxid + $hard_w] [expr $hardyid +$std_h];
     createGuide  [lindex $inst_names [expr $count+1]] [expr $hardxid+$hard_w] $hardyid [expr $hardxid + 2*$hard_w] [expr $hardyid +$std_h];
     setObjFPlanBox instance   [lindex $inst_names $count] $hardxid $hardyid [expr $hardxid + $hard_w] [expr $hardyid +$std_h];
     setObjFPlanBox instance   [lindex $inst_names [expr $count+1]] [expr $hardxid+$hard_w] $hardyid [expr $hardxid + 2*$hard_w] [expr $hardyid +$std_h];

     set groupName [ format "hardId_" $i ] ;
     createInstGroup $groupName -region $hardxid $hardyid [expr $hardxid + 2*$hard_w] [expr $hardyid +$std_h];
     addInstToInstGroup $groupName [lindex $inst_names $count]
     addInstToInstGroup $groupName [lindex $inst_names [expr $count+1]]


     set hardxid [expr $hardxid+4*$pixel_w]
     set count [expr $count+2]
}


