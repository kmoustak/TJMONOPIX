

#####################################################
# Filling metal layers. Tune to fill only lower layers
#####################################################
#setMetalFill -layer M1 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
#setMetalFill -layer M2 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
#setMetalFill -layer M3 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
#setMetalFill -layer M4 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000

#setMetalFill -layer TOP_M -windowSize 200.000 200.000 -windowStep 100.000 100.000

#addMetalFill -layer { M1 M2 M3 M4 } -nets { VSS VDD }

#set DESIGN "digital_top"
puts "----------Verifying and File Output-------------"
fillNotch -report $RPT_NOTCH_FILE
verifyConnectivity -type all -error 1000 -warning 50 -report $RPT_CONN_FILE
verifyGeometry -antenna -allowSameCellViols -allowRoutingBlkgPinOverlap -allowRoutingCellBlkgOverlap -report $RPT_GEOM_FILE
#verifyMetalDensity -detailed -report $RPT_DENSITY_FILE
verifyGeometry -antenna -reportfile $reportDir/${DESIGN}_antenna.rpt
violationBrowser -all -no_display_false
# Extract parasitics
#-----------------------------------------------------------------------------
#setExtractRCMode -engine postRoute -effortLevel signOff -rcdb $TIM_RCDB_FILE -relative_c_th 0.03 -total_c_th 5.0 -coupling_c_th 3 -reduce 5
setExtractRCMode -reset
setExtractRCMode -engine postRoute -effortLevel signOff -relative_c_th 0.03 -total_c_th 5.0 -coupling_c_th 3 -specialNet true -coupled true -qrcOutputMode spef
extractRC
#rcout  -outfile "${outDir}/${DESIGN_FILE}_NEW.spef.gz"
rcOut -view AV_BC -spef $AV_BC_SPEF_FILE  
rcOut -view AV_BC -setload $AV_BC_CAP_FILE 
rcOut -view AV_BC -setres $AV_BC_RES_FILE
rcOut -view AV_TC -spef $AV_TC_SPEF_FILE  
rcOut -view AV_TC -setload $AV_TC_CAP_FILE 
rcOut -view AV_TC -setres $AV_TC_RES_FILE
rcOut -view AV_WC -spef $AV_WC_SPEF_FILE  
rcOut -view AV_WC -setload $AV_WC_CAP_FILE 
rcOut -view AV_WC -setres $AV_WC_RES_FILE

reportNetStat
reportGateCount -outfile $RPT_GATE_COUNT_FILE
summaryReport -outdir ../report/summary
report_net -output ../report/net_report.rpt
set nets "PIX_STATE[*]"
report_net -output "../report/net_report_$nets.rpt" -net $nets


setCteReport
setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation forcedIdeal -sequentialConstProp true
reportAnalysisMode
buildTimingGraph
check_timing -verbose > $RPT_CHECK_TA_FILE 
check_timing -verbose -view AV_WC > $timRep/check_timing_WC.rtp
#check_timing -verbose -view AV_BC > $timRep/check_timing_BC.rtp
check_timing -verbose -view AV_TC > $timRep/check_timing_TC.rtp
report_timing -format { hpin arc cell delay arrival required slew fanout load } -late -max_points 10000 -net > $RPT_REPORT_TA_FILE
report_timing -format { hpin arc cell delay arrival required slew fanout load } -late -max_points 10000 -net -view AV_WC > $timRep/timing_report_WC.rtp
report_timing -format { hpin arc cell delay arrival required slew fanout load } -late -max_points 10000 -net -view AV_TC > $timRep/timing_report_TC.rtp 
#report_timing -format { hpin arc cell delay arrival required slew fanout load } -late -max_points 10000 -net -view AV_BC > $timRep/timing_report_BC.rtp  


saveModel -cts -sdf -spef -dir $outDir/${DESIGN}_model
#write_sdf -precision 4 -min_period_edges posedge -remashold $SDF_FILE

set_analysis_view -setup {AV_WC AV_TC } -hold {AV_BC AV_TC}

#Cadence recommends following steps to generate SDFs:
#http://asic.ams.com/hitkit/hk410/edi/tips.html
timeDesign -signOff -expandedViews -timingDebugReport -outDir $signoffRep 
timeDesign -signOff -expandedViews -timingDebugReport -hold -outDir $signoffRep 

write_sdf -version 3.0 -prec 3 -edges check_edge -force_calculation -min_view AV_BC -typ_view AV_TC -max_view AV_WC "../out/${DESIGN}.sdf"

puts "----------Output ${DESIGN}.def file------------"
# Export the DEF, v, spef, sdf, lef, gds and lib files
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.7
defOut -floorplan -netlist -routing $outDir/$DESIGN.def
#defOut -floorplan -netlist $outDir/${DESIGN}1.def
set dbgLefDefOutVersion NULL

#Generate RC and timing files
#-----------------------------------------------------------------------------


lefOut $outDir/${DESIGN}.lef -stripePin -PGpinLayers 5 -5.7 -extractBlockPGPinLayers 1 3 4 -specifyTopLayer 4

if {[file exists $OA_PATH]} {
	catch {exec rm -rf $OA_PATH/$DESIGN/encounter}
     puts "deleted"
}


saveDesign -cellview "$oaLibName ${DESIGN} encounter"



setStreamOutMode -reset
#setStreamOutMode -SEvianames true -specifyViaName %t_VIA
#catch {exec rm ${outDir}/${DESIGN}.gds}
#streamOut ${outDir}/${DESIGN}.gds -outputMacros -mapFile "$tsLef4/gds2_fe_6l.map" -libName DesignLib -structureName $DESIGN -merge "${tsLef}/tsl18fs120_WBULK.gds " -units 1000 -mode ALL
puts "----------Output ${DESIGN}_soc.v file---------"
saveNetlist -excludeLeafCell $VLOG_NETLIST_SIM_FILE -excludeCellInst  "feedth5_cap_M feedth6_cap_M feedth7_cap_M feedth8_cap_M feedth9_cap_M feedth10_cap feedth12_cap feedth14_cap feedth16_cap feedth18_cap feedth20_cap"
saveNetlist $VLOG_NETLIST_LVS_FILE -phys -excludeCellInst  "feedth9 feedth3 feedth pixel block" -excludeLeafCell

catch {exec rm "../out/${DESIGN}_TEMP.cdl"}
exec v2lvs -o "../out/${DESIGN}_TEMP.cdl" -v $VLOG_NETLIST_LVS_FILE -s "${tsLef}/tsl18fs120_WBULK.cdl" -s "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/Atlas/hardwireid/pnr/out/hardwire_in1.cdl" -s0 DVSS -s1 DVDD -lsr "${tsLef}/tsl18fs120_WBULK.cdl" -lsr "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/Atlas/hardwireid/pnr/out/hardwire_in1.cdl" -V1995 -log cdl.log 

catch [ exec  rm -f "${outDir}/$DESIGN.cdl" ] ;

puts "--------Save models for hierarchical flow------"
#saveModel -postRoute -outDir $outDir/${DESIGN}_hier_data

setAnalysisMode -checkType setup
#write_model_timing -type arc -view AV_WC -inputs {PE_RESET PIX_STATE[*]} -outputs {PE_ADD[*] PE_VALID PIX_RESET[*]} -verbose -slew_propagation path_based -traverse_borrowing_latch ${timRep}/timingmodel_AVWC.rpt

#write_model_timing -type arc -view AV_TC -inputs {PE_RESET[*] PIX_STATE[*]} -outputs {PE_ADD[*] PE_VALID} -verbose -slew_propagation path_based -traverse_borrowing_latch ${timRep}/timingmodel_AVTC.rpt


setAnalysisMode -checkType hold
#write_model_timing -type arc -view AV_TC -inputs {PE_RESET[*] PIX_STATE[*]} -outputs {PE_ADD[*] PE_VALID} -verbose -slew_propagation path_based -traverse_borrowing_latch ${timRep}/timingmodel_AVBC.rpt


# Generate timing model for PrimeTime
writeTimingCon $outDir/${DESIGN}_done

puts "------------Verify and file output done------"

