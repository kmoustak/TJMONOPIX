setNanoRouteMode -quiet -dbSkipAnalog true


set topPinPatts { DEF_CONF_PAD CLK_CONF_PAD LD_CONF_PAD SI_CONF_PAD SO_CONF_PAD RST_N_PAD CLK_BX_PAD CLK_OUT_PAD RESET_BCID_PAD READ_PMOS_NOSF_PAD READ_PMOS_PAD READ_COMP_PAD READ_HV_PAD FREEZE_PMOS_NOSF_PAD FREEZE_PMOS_PAD FREEZE_COMP_PAD FREEZE_HV_PAD TOKEN_PMOS_NOSF_PAD TOKEN_PMOS_PAD TOKEN_COMP_PAD TOKEN_HV_PAD OUT_PMOS_NOSF_PAD OUT_PMOS_PAD OUT_COMP_PAD OUT_HV_PAD PULSE_PAD HIT_OR_PAD[3] HIT_OR_PAD[2] HIT_OR_PAD[1] HIT_OR_PAD[0] BiasSF VPC VPCNOSF DACMON_BIAS DACMON_IDB DACMON_ITHR DACMON_IRESET DACMON_ICASN DACMON_VRESET_P DACMON_VL DACMON_VH DACMON_VCASN_DAC OUTA_MON_L[3] OUTA_MON_L[2] OUTA_MON_L[1] OUTA_MON_L[0] OUTA_MON_R[3] OUTA_MON_R[2] OUTA_MON_R[1] OUTA_MON_R[0] VCASN_MON_L VCASN_DAC_MON_L VCASN_MON_R VCASN_DAC_MON_R VDDA GNDA VDDD GNDD VDDA_IDAC GNDA_IDAC VDDA_VDAC GNDA_VDAC VDDP GNDP PSUB PWELL HV_DIODE }

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



