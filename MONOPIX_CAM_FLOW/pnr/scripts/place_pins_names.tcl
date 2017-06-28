setNanoRouteMode -quiet -dbSkipAnalog true


set topPinPatts { DEF_CONF_PAD CLK_CONF_PAD LD_CONF_PAD SI_CONF_PAD SO_CONF_PAD RST_N_PAD CLK_BX_PAD CLK_OUT_PAD RESET_BCID_PAD READ_PMOS_NOSF_PAD READ_PMOS_PAD READ_COMP_PAD READ_HV_PAD FREEZE_PMOS_NOSF_PAD FREEZE_PMOS_PAD FREEZE_COMP_PAD FREEZE_HV_PAD TOKEN_PMOS_NOSF_PAD TOKEN_PMOS_PAD TOKEN_COMP_PAD TOKEN_HV_PAD OUT_PMOS_NOSF_PAD OUT_PMOS_PAD OUT_COMP_PAD OUT_HV_PAD PULSE_PAD HIT_OR_PAD[3] HIT_OR_PAD[2] HIT_OR_PAD[1] HIT_OR_PAD[0] BiasSF_PAD VPC_PAD VPCNOSF DACMON_IBIAS_PAD DACMON_IDB_PAD DACMON_ITHR_PAD DACMON_IRESET_PAD DACMON_ICASN_PAD DACMON_VRESET_P_PAD DACMON_VL_PAD DACMON_VH_PAD DACMON_VCASN_DAC_PAD OUTA_MON_L_PAD[3] OUTA_MON_L_PAD[2] OUTA_MON_L_PAD[1] OUTA_MON_L_PAD[0] OUTA_MON_R_PAD[3] OUTA_MON_R_PAD[2] OUTA_MON_R_PAD[1] OUTA_MON_R_PAD[0] VCASN_MON_L_PAD VCASN_DAC_MON_L_PAD VCASN_MON_R_PAD VCASN_DAC_MON_R_PAD VDDA GNDA VDDD GNDD VDDA_DAC GNDA_DAC VDDP GNDP PSUB PWELL HV_DIODE TOKEN_PMOS_NOSF_N_PAD TOKEN_PMOS_N_PAD TOKEN_COMP_N_PAD TOKEN_HV_N_PAD OUT_PMOS_NOSF_N_PAD OUT_PMOS_N_PAD OUT_COMP_N_PAD OUT_HV_N_PAD HIT_OR_N_PAD[0] HIT_OR_N_PAD[1] HIT_OR_N_PAD[2] HIT_OR_N_PAD[3] }

foreach topPinPatt $topPinPatts {
    set topPinPtrs [dbGet -p top.terms.name $topPinPatt]
    if { $topPinPtrs ne 0x0} {
        dbSet [dbGet -p top.nets.name $topPinPatt].isAnalog 1
        dbSet [dbGet -p top.nets.name $topPinPatt].isTrialRouted 1
        dbSet [dbGet -p top.nets.name $topPinPatt].isDontTouch 1
        dbSet [dbGet -p top.nets.name $topPinPatt].skipRouting 1

        foreach pin $topPinPtrs {
            set termPtr [lindex [dbGet $pin.net.allTerms] end]
            set termName [dbGet $termPtr.name]
            set pin_name [dbget $pin.name]
            set pin_pt [dbGet $termPtr.pt]
            set pin_layer [dbGet $termPtr.layer.name]

            puts "Top-level pin $pin_name will be moved to INST pin $termName location and fixed in place"
            editPin -fixedPin 1 -layer $pin_layer -pin $pin_name -assign $pin_pt -snap MGRID -pinDepth 0.25 -pinWidth 0.25 -side inside -fixOverlap 0 -honorConstraint 0 

         }
    }   
}



