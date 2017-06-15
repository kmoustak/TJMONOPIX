
## List of modifications
##
## 2015 03 17 CAM Modified according to the refactoring of the netlist


############################
# Die and core geometry
############################

setDrawView fplan     ;
deleteAllFPObjects    ;
#floorPlan -s $coreheight $corewidth  0 [expr 2*0.28] 0 [expr 2*0.28] 
floorPlan -site CoreSite -s 291.2 44.8 1.4 1.12 0.0 1.12
win;

############################
# Specify box dimentitions
############################

set box1 [split [join [dbGet top.fPlan.box]]]
set X0 [lindex $box1 0]
set Y0 [lindex $box1 1]
set X1 [lindex $box1 2]
set Y1 [lindex $box1 3]



############################
# Specify black boxes
############################


specifyBlackBox -cell "pixel" -size $collection_w  $collection_h -coreSpacing 0.0 0.0 0.0 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 } -pinLayerTop { 2 4 6 } -pinLayerLeft {1 3 5} -pinLayerBottom { 2 4 6 } -pinLayerRight {1 3 5 } -routingHalo 0.0 -routingHaloTopLayer 6 -routingHaloBottomLayer 1 -placementHalo 0.0 0.0 0.0 0.0 ;


################################################################################
# Module and instances boundaries and placement
################################################################################


# COLLECTION ELECTRODES LEFT
set collector_names {} ;
for {set i 0} {$i < 8} {incr i} { lappend collector_names  [format "INST_BLOCK/INST_PIXEL_%01d" $i] } ;

set i 0
foreach place_inst $collector_names {
    setObjFPlanBox instance $place_inst [expr $i*$pixel_h+($pixel_h/2-$collection_w/2)] [expr $Y0] [expr $collection_w+$i*$pixel_h+($pixel_h/2-$collection_w/2)] [expr $collection_h]
    incr i
}

# COLLECTION ELECTRODES RIGHT
set collector_names {} ;
for {set i 8} {$i < 16} {incr i} { lappend collector_names  [format "INST_BLOCK/INST_PIXEL_%01d" $i] } ;


set i 0
foreach place_inst $collector_names {

    setObjFPlanBox instance $place_inst [expr $i*$pixel_h+($pixel_h/2-$collection_w/2)] [expr $Y1] [expr $collection_w +$i*$pixel_h+($pixel_h/2-$collection_w/2)] [expr $Y1 - $collection_h] 

    incr i
}

createInstGroup pulsegen -fence [expr $pixel_w*2] [expr $std_h*2+1.12] [expr $pixel_w*6] [expr $std_h*3+1.12] ;
addInstToInstGroup pulsegen p_0
addInstToInstGroup pulsegen p_0/inv_*
addInstToInstGroup pulsegen p_0/nd_*
addInstToInstGroup pulsegen p_0/an_*
addInstToInstGroup pulsegen p_0/d
addInstToInstGroup pulsegen p_0/d/inv_*
addInstToInstGroup pulsegen p_0/d/del_*
addInstToInstGroup pulsegen p_0/d/nd_*
addInstToInstGroup pulsegen p_0/d/nr_*


#setObjFPlanBox instance p_0 [expr $pixel_w*2] [expr $std_h*2+1.12] [expr $pixel_w*6] [expr $std_h*3+1.12] ;

#saveDesign $SAVE_DESIGN_FP_FILE
#saveFPlan $SAVE_FP_FILE
saveDesign -cellview "$oaLibName $DESIGN fplan"

