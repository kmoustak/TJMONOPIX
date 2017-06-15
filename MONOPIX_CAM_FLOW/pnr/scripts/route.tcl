


#######################################################
#                                                     
#  THE RECIPE
#  by Cesar Marin
#  CERN PH/
#  Created on 10/01/2012
#                                                     
#######################################################

setAnalysisMode -analysisType onChipVariation

########################################
# Timing driven routing
########################################

setNanoRouteMode  -reset
setNanoRouteMode  -routeBottomRoutingLayer $bottomRoutingLayer
setNanoRouteMode  -routeTopRoutingLayer    $topRoutingLayer
setNanoRouteMode  -routeWithTimingDriven true
#setNanoRouteMode  -routeWithSiDriven false
setNanoRouteMode  -drouteUseMultiCutViaEffort medium  ; 
setNanoRouteMode  -drouteFixAntenna true ;
#setNanoRouteMode  -routeAntennaCellName "adiode"
#setNanoRouteMode  -routeInsertAntennaDiode true

routeDesign 


saveDesign -cellview "$oaLibName $DESIGN  MONOPIX_routed_preopt"
saveNetlist ../out/MONOPIX_routed_preopt.v

setExtractRCMode -engine postRoute -effortLevel high  ;
timeDesign -postRoute       -prefix "${DESIGN}_routed_preOpt" -outDir $timRep -numPaths 100
timeDesign -postRoute -hold -prefix "${DESIGN}_routed_preOpt" -outDir $timRep -numPaths 100

########################################
# Post routing optimizations
########################################

setOptMode -reset

setOptMode -effort high -leakagePowerEffort none -dynamicPowerEffort none -reclaimArea true -simplifyNetlist true -allEndPoints false -setupTargetSlack 0.05 -holdTargetSlack 0.4 -maxDensity 0.95 -drcMargin 0 -usefulSkew true -clkGateAware true
setExtractRCMode -engine postRoute -effortLevel high  ;

optDesign -postRoute

saveDesign -cellview "$oaLibName $DESIGN MONOPIX_routed_postrouteopt"
saveNetlist ../out/MONOPIX_routed_postrouteopt.v

timeDesign -postRoute       -prefix "${DESIGN}_routed_postRouteOpt" -outDir $timRep -numPaths 100
timeDesign -postRoute -hold -prefix "${DESIGN}_routed_postRouteOpt" -outDir $timRep -numPaths 100

setOptMode -effort high -leakagePowerEffort none -dynamicPowerEffort none -reclaimArea true -simplifyNetlist true -allEndPoints false -setupTargetSlack 0.05 -holdTargetSlack 0.1 -maxDensity 0.95 -drcMargin 0 -usefulSkew true -clkGateAware true
#setOptMode -holdFixingEffort high ;
setExtractRCMode -engine postRoute -effortLevel high  ;
optDesign -postRoute -hold


saveDesign -cellview "$oaLibName $DESIGN  MONOPIX_routed"
saveNetlist ../out/MONOPIX_routed_prefiller.v
timeDesign -postRoute       -prefix "${DESIGN}_routed" -outDir $timRep -numPaths 100
timeDesign -postRoute -hold -prefix "${DESIGN}_routed" -outDir $timRep -numPaths 100


puts "--------- Detail routing to fix antennas --------" 
setNanoRouteMode  -drouteFixAntenna true
setNanoRouteMode -routeInsertAntennaDiode true
setNanoRouteMode  -routeAntennaCellName "adiode ndiode"
routeDesign -detail


timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 5000 -expandedViews -prefix ${DESIGN}_routed -outDir $timRep 


puts "--------Adding Filler Cells---------------"


# Add the filler cells
if { $FILLER } {
#     addDeCapCellCandidates "feedth5_cap 15"
     addDeCapCellCandidates "feedth9_cap 80"
     addDeCapCellCandidates "feedth10_cap 100"
     addDeCapCellCandidates "feedth12_cap 130"
     addDeCapCellCandidates "feedth14_cap 160"        
     addDeCapCellCandidates "feedth16_cap 200"
     addDeCapCellCandidates "feedth18_cap 230"
     addDeCapCellCandidates "feedth20_cap 260"        

     # Add 3pF

	setFillerMode -reset
	setFillerMode -corePrefix FILLER -createRows 1 -doDRC 1 -deleteFixed 1 -ecoMode 0
	addFiller -cell "feedth9_cap feedth10_cap feedth12_cap feedth14_cap feedth16_cap feedth18_cap feedth20_cap" -prefix DECA -doDRC true -ecoMode false
	addFiller -cell "feedth feedth3 feedth9" -prefix feedth -doDRC true -ecoMode false
}

#routeDesign -globalDetail

#deletePlaceBlockage -all
#deleteRouteBlk -all
#setNanoRouteMode  -reset

saveDesign -cellview "$oaLibName ${DESIGN} routed"

puts "-----------Routing done-------------"


