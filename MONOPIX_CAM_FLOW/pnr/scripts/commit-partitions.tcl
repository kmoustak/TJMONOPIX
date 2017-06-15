



####################
# Partition commit and save
####################

set ptrToCell [dbGet top.insts.name INST_DIGITAL_TOP -p1 ] ;
set cellName [ dbGet $ptrToCell.cell.name ];


createRouteBlk  -layer {1 2 3 4} -box  [expr $X2 +39.175] [expr $Y2 + $std_h*4.5] [expr $X3] [expr $Y3 - 141.3*$std_h];


set blk_x 794.06
set blk_w 50.12

for {set i 0} {$i < 256 } {incr i} {
     createRouteBlk -layer "3 4"  -name BLK_IB -box $blk_x [expr $Y3 - $std_h*141.5] [expr $blk_x + $blk_w] $Y3
     set blk_x [expr $blk_x + 2*$pixel_w]
}



#partition $cellName  
partition $cellName -stripStayOnTop -keepPGPin 

#savePartition -oaPtnLib $oaLibName -oaPtnView PARTITION 

savePartition -dir PARTITIONS  -def -inputLoad -pinLoad 
exec lefin -lef "$PROJECT_DIR/pnr/work/PARTITIONS/$DESIGN/digital_top.partition.lef" -lib MALTA_digital_top  -overwrite
uiSetTool select
#saveDesign -cellview "$oaLibName $DESIGN partition"
#savePtnPin PARTITIONS/digital_top/digital_top.io -ptn $cellName
