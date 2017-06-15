
#source "../scripts/settings.tcl"


puts "--------Clock Tree Synthesis-------"


set CTS_BUFFER { bufbd1 bufbd2  bufbd3 bufbd4 bufbd7 bufbda bufbdf bufbdk  buffd1 buffd2 buffd3 buffd4 buffd7 buffda } ; # Footprint of buffer in .lib file
set CTS_INV { invbd2 invbd4 invbd7 invbda invbdf invbdk inv0d0 inv0d1 inv0d2 inv0d4 inv0d7 inv0da } ;# Footprint of inverter in .lib file
#set CTS_DELAY { dl01d1 dl01d2 dl01d4 dl02d1 dl03d1 dl02d2 dl02d4 dl04d1 dl03d2 dl03d4 dl04d2 dl04d4 } ;# Footprint of inverter in .lib file

set CTS_SPEC_NAME "${DESIGN}.ctstch"

setCTSMode -reset
setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -routeTopPreferredLayer M4 -routeBottomPreferredLayer M3 -routeNonDefaultRule {} -routeLeafTopPreferredLayer M4 -routeLeafBottomPreferredLayer M3 -routeLeafNonDefaultRule {} -useLefACLimit false -routePreferredExtraSpace 1 -routeLeafPreferredExtraSpace 1 -opt true -optAddBuffer false -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose true -reportHTML true -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
#setEndCapMode -reset
#setEndCapMode -boundary_tap false
#setUsefulSkewMode -maxSkew false -noBoundary false -useCells {dl02d2 dl01d1 dl03d4 dl03d1 bufbd4 buffd1 dl02d4 buffd4 buffd3 dl04d2 buffda buffd2 dl02d1 bufbd2 bufbdk dl01d2 bufbd1 dl04d1 bufbda dl03d2 bufbdf dl01d4 buffd7 dl04d4 bufbd3 bufbd7 inv0d7 inv0da invbd4 invbdf inv0d2 invbd2 invbd7 inv0d4 invbda inv0d0 invbdk inv0d1} -maxAllowedDelay 1


createClockTreeSpec   -bufferList "$CTS_BUFFER $CTS_INV " -file $CTS_SPEC_NAME

clockDesign -specFile $CTS_SPEC_NAME  -outDir $reportDir
 

saveDesign -cellview "$oaLibName $DESIGN MONOPIX_cts"
saveNetlist ../out/MONOPIX_cts.v
setOptMode -effort high -leakagePowerEffort none -dynamicPowerEffort none -reclaimArea true -simplifyNetlist true -allEndPoints false -setupTargetSlack 0.1 -holdTargetSlack 0.4 -maxDensity 0.95 -drcMargin 0 -usefulSkew true -clkGateAware true


optDesign -postCTS

saveNetlist ../out/MONOPIX_postcts.v
saveDesign -cellview "$oaLibName $DESIGN MONOPIX_postcts"


timeDesign -postCTS       -prefix "${DESIGN}_postCTS" -outDir $timRep -numPaths 200
timeDesign -postCTS -hold -prefix "${DESIGN}_postCTS" -outDir $timRep -numPaths 200

setOptMode -effort high -leakagePowerEffort none -dynamicPowerEffort none -reclaimArea true -simplifyNetlist true -allEndPoints false -setupTargetSlack 0.1 -holdTargetSlack 0.4 -maxDensity 0.95 -drcMargin 0 -usefulSkew true -clkGateAware true

optDesign -postCTS -hold


saveDesign -cellview "$oaLibName $DESIGN MONOPIX_postcts_opthold"
saveNetlist ../out/MONOPIX_postcts_opthold.v

timeDesign -postCTS       -prefix "${DESIGN}_postCTS_optHold" -outDir $timRep -numPaths 200
timeDesign -postCTS -hold -prefix "${DESIGN}_postCTS_optHold" -outDir $timRep -numPaths 200

