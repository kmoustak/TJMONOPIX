set offx 678.405
set offy 1129.4
for {set i 0} {$i < 256} {incr i} { 
     createInstGroup arbiter_${i} -region $offx [expr $offy - $arbiter_h] [expr $arbiter_w+$offx] $offy 
     set offx [expr $offx + $arbiter_w]
}


set offx 678.405
set offy 957.613
for {set i 0} {$i < 128} {incr i} { 
     createInstGroup merge_L0_${i} -region $offx [expr $offy - $arbiter_h] [expr $merge_l0+$offx] $offy 
     set offx [expr $offx + $merge_l0]
}

set offx 678.405
set offy 957.613
set offx [expr $offx+$arbiter_w]
set offx_pre [expr $offx]
set offy [expr $offy - $arbiter_h]
set arbiter_h [expr $arbiter_h/2]

for {set i 0} {$i < 64} {incr i} { 
     createInstGroup merge_L1_${i} -region $offx [expr $offy - $arbiter_h] [expr $merge_l1+$offx-$arbiter_w] $offy 
     set offx [expr $offx + $merge_l1]
}

set offx [expr $offx_pre+$arbiter_w]
set offx_pre [expr $offx]
set offy [expr $offy - $arbiter_h]

for {set i 0} {$i < 32} {incr i} { 
     createInstGroup merge_L2_${i} -region $offx [expr $offy - $arbiter_h] [expr $merge_l2+$offx-$arbiter_w] $offy 
     set offx [expr $offx + $merge_l2]
}
set offx [expr $offx_pre+$arbiter_w]
set offx_pre [expr $offx]
set offy [expr $offy - $arbiter_h]

for {set i 0} {$i < 16} {incr i} { 
     createInstGroup merge_L3_${i} -region $offx [expr $offy - $arbiter_h] [expr $merge_l3+$offx-$arbiter_w] $offy 
     set offx [expr $offx + $merge_l3]
}
set offx [expr $offx_pre+$arbiter_w]
set offx_pre [expr $offx]
set offy [expr $offy - $arbiter_h]

for {set i 0} {$i < 8} {incr i} { 
     createInstGroup merge_L4_${i} -region $offx [expr $offy - $arbiter_h] [expr $merge_l4+$offx-$arbiter_w] $offy 
     set offx [expr $offx + $merge_l4]
}



for {set i 0} {$i < 256} {incr i} { 

  deleteInstGroup arbiter_${i} 

}


for {set i 0} {$i < 256} {incr i} { 

  deleteInstGroup merge_L4_${i} 

}

