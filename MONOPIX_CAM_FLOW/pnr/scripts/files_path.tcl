#-----------------------------------------------------------------------------
# Output Folder names
#
#-----------------------------------------------------------------------------
set SOC 	${PROJECT_DIR}/pnr
set outDir      ${SOC}/out
set reportDir   ${SOC}/report
set logDir 	${SOC}/log
set encDB 	${SOC}/db
set timRep 	${reportDir}/timingReports
set signoffRep ${reportDir}/signofftimingReports

if {![file exists ${timRep}]} {
  file mkdir ${timRep}
  puts "Creating directory ${timRep}"
}

if {![file exists ${signoffRep}]} {
  file mkdir ${signoffRep}
  puts "Creating directory ${signoffRep}"
}


#-----------------------------------------------------------------------------
# File names
#
#-----------------------------------------------------------------------------
set CONF_FILE_NAME ${DESIGN}.conf
set IO_FILE_NAME pad.io
set DESIGN_NAME ${DESIGN}${OPT}
set SAVE_DESIGN_FP_NAME ${DESIGN_NAME}-fplan.enc
set SAVE_FP_NAME ${DESIGN_NAME}.fp
set SAVE_DESIGN_FPP_NAME ${DESIGN_NAME}-fpadplan.enc
set SAVE_DESIGN_PR_NAME ${DESIGN_NAME}-pplan.enc
set SAVE_DESIGN_PL_NAME ${DESIGN_NAME}-placed.enc
set SAVE_DESIGN_CT_NAME ${DESIGN_NAME}-cts.enc
set SAVE_DESIGN_RO_NAME ${DESIGN_NAME}-routed.enc
set TIM_RCDB_NAME ${DESIGN_NAME}.rcdb
set SDF_FILE_NAME ${DESIGN_NAME}-routed.sdf

set AV_BC_SPEF_FILE_NAME ${DESIGN_NAME}-AV_BC_routed.spef
set AV_TC_SPEF_FILE_NAME ${DESIGN_NAME}-AV_TC_routed.spef
set AV_WC_SPEF_FILE_NAME ${DESIGN_NAME}-AV_WC_routed.spef
set AV_BC_RES_FILE_NAME ${DESIGN_NAME}-AV_BC_RES.rpt
set AV_TC_RES_FILE_NAME ${DESIGN_NAME}-AV_TC_RES.rpt
set AV_WC_RES_FILE_NAME ${DESIGN_NAME}-AV_WC_RES.rpt
set AV_BC_CAP_FILE_NAME ${DESIGN_NAME}-AV_BC_CAP.rpt
set AV_TC_CAP_FILE_NAME ${DESIGN_NAME}-AV_TC_CAP.rpt
set AV_WC_CAP_FILE_NAME ${DESIGN_NAME}-AV_WC_CAP.rpt
set RPT_CHECK_TA_NAME ${DESIGN_NAME}-checkta.rpt
set RPT_REPORT_TA_NAME ${DESIGN_NAME}-ta.rpt
set RPT_SLACK_NAME ${DESIGN_NAME}-slack.rpt
set RPT_GATE_COUNT_NAME ${DESIGN_NAME}-gate_count.rpt
set RPT_NOTCH_NAME ${DESIGN_NAME}-notch.rpt
set RPT_CONN_NAME ${DESIGN_NAME}-conn.rpt
set RPT_GEOM_NAME ${DESIGN_NAME}-geom.rpt
set RPT_DENSITY_NAME ${DESIGN_NAME}-density.rpt
set VLOG_NETLIST_SIM_NAME ${DESIGN_NAME}-routed.v
set VLOG_NETLIST_LVS_NAME ${DESIGN_NAME}-routed_lvs.v
set CTS_SPEC_NAME ${DESIGN_NAME}-spec.ctstch
set CTS_RGUIDE_NAME ${DESIGN_NAME}.guide
set CTS_RPT_NAME ${DESIGN_NAME}-cts.rpt
set GDS_FILE_NAME ${DESIGN_NAME}.gds
#-----------------------------------------------------------------------------

set SAVE_DESIGN_FP_FILE ${encDB}/${SAVE_DESIGN_FP_NAME}
set SAVE_FP_FILE ${encDB}/${SAVE_FP_NAME}
set SAVE_DESIGN_FPP_FILE ${encDB}/${SAVE_DESIGN_FPP_NAME}
set SAVE_DESIGN_PR_FILE ${encDB}/${SAVE_DESIGN_PR_NAME}
set SAVE_DESIGN_PL_FILE ${encDB}/${SAVE_DESIGN_PL_NAME}
set SAVE_DESIGN_CT_FILE ${encDB}/${SAVE_DESIGN_CT_NAME}
set SAVE_DESIGN_RO_FILE ${encDB}/${SAVE_DESIGN_RO_NAME}
set SDF_FILE ${outDir}/${SDF_FILE_NAME}
set AV_BC_SPEF_FILE ${outDir}/${AV_BC_SPEF_FILE_NAME}
set AV_TC_SPEF_FILE ${outDir}/${AV_TC_SPEF_FILE_NAME}
set AV_WC_SPEF_FILE ${outDir}/${AV_WC_SPEF_FILE_NAME}
set AV_BC_RES_FILE ${reportDir}/${AV_BC_RES_FILE_NAME}
set AV_TC_RES_FILE ${reportDir}/${AV_TC_RES_FILE_NAME}
set AV_WC_RES_FILE ${reportDir}/${AV_WC_RES_FILE_NAME}
set AV_BC_CAP_FILE ${reportDir}/${AV_BC_CAP_FILE_NAME}
set AV_TC_CAP_FILE ${reportDir}/${AV_TC_CAP_FILE_NAME}
set AV_WC_CAP_FILE ${reportDir}/${AV_WC_CAP_FILE_NAME}
set RPT_CHECK_TA_FILE ${reportDir}/${RPT_CHECK_TA_NAME}
set RPT_REPORT_TA_FILE ${reportDir}/${RPT_REPORT_TA_NAME}
set RPT_SLACK_FILE ${reportDir}/${RPT_SLACK_NAME}
set RPT_GATE_COUNT_FILE ${reportDir}/${RPT_GATE_COUNT_NAME}
set RPT_NOTCH_FILE ${reportDir}/${RPT_NOTCH_NAME}
set RPT_CONN_FILE ${reportDir}/${RPT_CONN_NAME}
set RPT_GEOM_FILE ${reportDir}/${RPT_GEOM_NAME}
set RPT_DENSITY_FILE ${reportDir}/${RPT_DENSITY_NAME}
set VLOG_NETLIST_SIM_FILE ${outDir}/${VLOG_NETLIST_SIM_NAME}
set VLOG_NETLIST_LVS_FILE ${outDir}/${VLOG_NETLIST_LVS_NAME}
set CTS_SPEC_FILE ${outDir}/${CTS_SPEC_NAME}
set CTS_RGUIDE_FILE ${outDir}/${CTS_RGUIDE_NAME}
set CTS_RPT_FILE ${reportDir}/${CTS_RPT_NAME}
set GDS_FILE ${outDir}/${GDS_FILE_NAME}
set GDS_MAP_FILE ${outDir}/gds2.map

