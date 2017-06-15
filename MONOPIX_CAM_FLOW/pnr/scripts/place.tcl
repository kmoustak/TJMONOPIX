#######################################################
#                                                     
#  THE RECIPE Standard Cell Placement 
#  by Cesar Marin
#  CERN PH/
#  Created on 10/01/2012
#                                                     
#######################################################
set PROCESS 180    ;# process technology value [micron]
setDesignMode -process $PROCESS

timeDesign -prePlace -prefix "${DESIGN}_prePlace" -outDir $timRep


################################################################################
### Place design
################################################################################

setPlaceMode -reset
setPlaceMode -congEffort auto 
setPlaceMode -placeIOPins false
setPlaceMode -checkPinLayerForAccess { 1 2 3 4 } 
setPlaceMode -clkGateAware true

setTrialRouteMode -maxRouteLayer $preferredTopRoutingLayer ;

placeDesign

saveDesign -cellview "$oaLibName $DESIGN MONOPIX_place_no_tiehilo"

setTieHiLoMode -maxFanout 10 -maxDistance 20 -cell "tiehi tielo" ;
addTieHiLo -cell "tiehi tielo" 

saveDesign -cellview "$oaLibName $DESIGN MONOPIX_place_no_opt"

timeDesign -preCTS -prefix "${DESIGN}_postPlace" -outDir $timRep


# First DRV Optimization
#setOptMode -reset
#optDesign -preCTS -drv

# Timing driven optimization
#setOptMode -reset
#setOptMode -effort high
#setOptMode -usefulSkew true
#setOptMode -setupTargetSlack 0.4 ;

# GAR Produced by the GUI settings:
setOptMode -effort high -leakagePowerEffort none -dynamicPowerEffort none -reclaimArea true -simplifyNetlist true -allEndPoints false -setupTargetSlack 0.5 -holdTargetSlack 0.5 -maxDensity 0.95 -drcMargin 0 -usefulSkew true -clkGateAware true
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {bufbd7 bufbd3 dl04d4 buffd7 dl01d4 bufbdf dl03d2 bufbda dl04d1 bufbd1 dl01d2 bufbdk bufbd2 dl02d1 buffd2 buffda dl04d2 buffd3 buffd4 dl02d4 buffd1 bufbd4 dl03d1 dl03d4 dl01d1 dl02d2 inv0d1 invbdk inv0d0 invbda inv0d4 invbd7 invbd2 inv0d2 invbdf invbd4 inv0da inv0d7} -maxAllowedDelay 1

optDesign -preCTS 

saveDesign -cellview "$oaLibName $DESIGN MONOPIX_place"

timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports  -prefix "${DESIGN}_preCTS" -outDir $timRep -numPaths 200 ;
timeDesign -preCTS -hold -prefix "${DESIGN}_preCTS" -outDir $timRep -numPaths 200


