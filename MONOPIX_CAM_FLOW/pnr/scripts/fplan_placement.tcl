puts "----------Placing Cells-----------"

set NAND_PIX {}
for {set i 8} {$i < 17} {incr i} { 
          lappend NAND_PIX  [format %s/pix_%01d_nd_0 nd_1 $i] 
     } ;

set pixel_x [expr $collection_w + 1.4]

set i 0
foreach place_inst $NAND_PIX   {
    placeInst $place_inst "$pixel_x [expr $std_h*4 ]" -fixed
     if {$i ==6} {
    set pixel_x [expr $pixel_x+5.6 + $pixel_w] 
     } else {
          if {$i==7} {
          set pixel_x [expr $pixel_x-5.6 ] 
          } else {
           set pixel_x [expr $pixel_x + $pixel_w] 
          } 
     }
    incr i
}



########### NANDS PIX 
set NAND_PIX {}
for {set i 8} {$i < 17} {incr i} { 
          lappend NAND_PIX  [format %s/pix_%01d_nd_0 nd_3 $i] 
     } ;


set pixel_x [expr $collection_w + 1.4]
set i 0
foreach place_inst $NAND_PIX   {
    placeInst $place_inst "$pixel_x [expr 3*$std_h]" -fixed
     if {$i ==6} {
    set pixel_x [expr $pixel_x+5.6 + $pixel_w] 
     } else {
          if {$i==7} {
          set pixel_x [expr $pixel_x-5.6 ] 
          } else {
           set pixel_x [expr $pixel_x + $pixel_w] 
          } 
     }
    incr i
}



set NAND_PIX {}
for {set i 0} {$i < 8} {incr i} { 
          lappend NAND_PIX  [format %s/pix_%01d_nd_0 nd_1 $i] 
     } ;

set pixel_x [expr $collection_w +5.6+1.4]

set i 0
foreach place_inst $NAND_PIX   {
    placeInst $place_inst "$pixel_x [expr $std_h*4]" -fixed
     if {$i ==6} {
    set pixel_x [expr $pixel_x+5.6 + $pixel_w] 
     } else {
    set pixel_x [expr $pixel_x + $pixel_w] 
     } 

    incr i
}

set NAND_PIX {}
for {set i 0} {$i < 8} {incr i} { 
          lappend NAND_PIX  [format %s/pix_%01d_nd_0 nd_3 $i] 
     } ;

set pixel_x [expr $collection_w + 5.6 +1.4]
set i 0
foreach place_inst $NAND_PIX   {
    placeInst $place_inst "$pixel_x [expr 3*$std_h]" -fixed
     if {$i ==6} {
    set pixel_x [expr $pixel_x+5.6 + $pixel_w] 
     } else {
    set pixel_x [expr $pixel_x + $pixel_w] 
     } 
    incr i
}


set NAND_GROUP {}
for {set i 0} {$i < 5} {incr i} { 
          lappend NAND_GROUP  [format %s/group_%01d_nd_0 nd_2 $i] 
     } ;


set pixel_x [expr $collection_w +5.6*2+1.4]

set i 0
foreach place_inst $NAND_GROUP   {
    placeInst $place_inst "$pixel_x [expr 3*$std_h]" -fixed
    if {$i == 1} { 
    set pixel_x [expr $pixel_x + $pixel_w*2] 
     } else {
    set pixel_x [expr $pixel_x + $pixel_w] 
     }
    incr i
}

deselectAll

set NAND_GROUP {}
for {set i 0} {$i < 5} {incr i} { 
          lappend NAND_GROUP  [format %s/group_%01d_nd_0 nd_0 $i] 
     } ;

deselectAll

set pixel_x [expr $collection_w + 5.6*2+1.4]
set i 0
foreach place_inst $NAND_GROUP   {
    placeInst $place_inst "$pixel_x [expr $std_h*4 ]" -fixed
    if {$i == 1} { 
    set pixel_x [expr $pixel_x + $pixel_w*2] 
     } else {
    set pixel_x [expr $pixel_x + $pixel_w] 
     }
    incr i
     
}

