

########### PIX REG BOTTON
set PIX_MIRROR {}
for {set i 0} {$i < 8} {incr i} { 
          lappend PIX_MIRROR [format pix_%01d_pix_0/mirror_reg $i] 
     } ;

set PIX_STATE {}
for {set i 0} {$i < 8} {incr i} { 
          lappend PIX_STATE  [format pix_%01d_pix_0/state_reg $i] 
     } ;

deselectAll

placeInst [lindex $PIX_MIRROR 0] $X0 $pixel_w
selectInst [lindex $PIX_MIRROR 0]
set box3 [split [join [dbGet selected.box]]]
set box3_w [expr [lindex $box3 3]- [lindex $box3 1]];
deselectAll


placeInst [lindex $PIX_STATE 0] $X0 [expr $pixel_w - $std_h]
selectInst [lindex $PIX_STATE 0] 
set box4 [split [join [dbGet selected.box]]]
set box4_w [expr [lindex $box4 3]- [lindex $box4 1]];
deselectAll


set offsety_reg 0
set offsetx_reg [expr 24.08+0.28*2]
set i 0
foreach place_inst $PIX_STATE {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i] [expr $offsety_reg+0*$std_h]" -fixed
    set i [expr $i + $pixel_w]
}
set i 0
foreach place_inst $PIX_MIRROR {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i] [expr $offsety_reg+1*$std_h]" -fixed
    set i [expr $i + $pixel_w]
}


########### PIX REG TOP
set PIX_MIRROR {}
for {set i 8} {$i < 16} {incr i} { 
          lappend PIX_MIRROR [format pix_%01d_pix_0/mirror_reg $i] 
     } ;

set PIX_STATE {}
for {set i 8} {$i < 16} {incr i} { 
          lappend PIX_STATE  [format pix_%01d_pix_0/state_reg $i] 
     } ;

deselectAll

set offsety_reg 0
set offsetx_reg [expr 24.08+0.28*2]
set i 0
foreach place_inst $PIX_STATE {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i] [expr $offsety_reg+7*$std_h]" -fixed
    set i [expr $i + $pixel_w]
}
set i 0
foreach place_inst $PIX_MIRROR {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i] [expr $offsety_reg+6*$std_h]" -fixed
    set i [expr $i + $pixel_w]
}



########### PIX LOGIC BOTTON
set PIX_LOGIC {}
for {set i 0} {$i < 8} {incr i} { 
          lappend PIX_LOGIC [format pix_%01d_pix_0/nd_1 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/nd_1 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/ao_0 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/an_0 $i] 
     } ;

deselectAll

set offsety_reg 0
set offsetx_reg [expr 12.46 - 8.46-0.28*2]
set i 0
set cont 0

foreach place_inst $PIX_LOGIC {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i+2.8-1.12] [expr $offsety_reg+1*$std_h]" -fixed
    set new [format pix_%01d_pix_0/an_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8] [expr $offsety_reg+0*$std_h]" -fixed
    set new [format pix_%01d_pix_0/nd_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8+2.8] [expr $offsety_reg+0*$std_h]" -fixed
    set new [format pix_%01d_pix_0/ao_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8*2-1.12] [expr $offsety_reg+1*$std_h]" -fixed
    set i [expr $i + $pixel_w]
    incr cont 
}



########### PIX LOGIC TOP
set PIX_LOGIC {}
for {set i 8} {$i < 16} {incr i} { 
          lappend PIX_LOGIC [format pix_%01d_pix_0/nd_1 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/nd_1 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/ao_0 $i] 
#          lappend PIX_LOGIC [format pix_%01d_pix_0/an_0 $i] 
     } ;

deselectAll

set offsety_reg 0
set offsetx_reg [expr 12.46 - 8.46-0.28*2]
set i 0


foreach place_inst $PIX_LOGIC {
    placeInst $place_inst "[expr $X0 +$offsetx_reg+$i+2.8-1.12] [expr $offsety_reg+6*$std_h]" -fixed
    set new [format pix_%01d_pix_0/an_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8] [expr $offsety_reg+7*$std_h]" -fixed
    set new [format pix_%01d_pix_0/nd_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8+2.8] [expr $offsety_reg+7*$std_h]" -fixed
    set new [format pix_%01d_pix_0/ao_0 $cont] 
    placeInst $new "[expr $X0 +$offsetx_reg+$i+2.8*2-1.12] [expr $offsety_reg+6*$std_h]" -fixed
    set i [expr $i + $pixel_w]
    incr cont 
}

