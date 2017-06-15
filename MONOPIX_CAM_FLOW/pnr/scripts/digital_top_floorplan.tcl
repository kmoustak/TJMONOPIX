
####################
# Floorplanning the digital_top blackbox
####################
#placeDesign -noPrePlaceOpt

set ptrToCell [dbGet top.insts.name INST_DIGITAL_TOP -p1 ] ;
set cellName [ dbGet $ptrToCell.cell.name ];


# Reset all pins of the black box
setPtnPinStatus $cellName *  unplaced;
#setPtnPinStatus $cellName *  placed;
#setPtnPinStatus $cellName *  unplaced;

####################
# Pins to PADS 
####################

set pinsToPads "";
#set pinsToPads [ dbGet $ptrToCell.instTerms.cellTerm.name CLK* ] ;
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name TRIGGER* ] ]  ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name MCLK* ] ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name CHIP* ] ] ];
set pinsToPads [ concat $pinsToPads [ dbGet $ptrToCell.instTerms.cellTerm.name RST* ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_EN* ] ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_I* ] ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_O* ] ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_TER* ] ] ];
set pinsToPads [ concat $pinsToPads [join [ dbGet $ptrToCell.instTerms.cellTerm.name SC* ] ] ];

set pinsToPadsString "";
foreach pinItem $pinsToPads { set pinsToPadsString [concat $pinsToPadsString $pinItem]   } ;
 
#deletePinGroup -pinGroup "gPinsToPads" -cell $cellName;
createPinGroup "gPinsToPads" -cell $cellName -pin "$pinsToPadsString"  -spacing 2 -optimizeOrder
createPinGuide -pinGroup "gPinsToPads" -cell $cellName -layer {M2 M4}

assignPtnPin -ptn $cellName  -pin $pinsToPadsString ;
pinAlignment  -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToPadsString"  -keepLayer -legalizePin;

foreach pinName $pinsToPadsString { 
     setPtnPinStatus "$cellName" "$pinName" fixed 
} 

checkPinAssignment -ptn  $cellName -pin $pinsToPadsString;




####################
# Pins to FULL_ANALOG 
####################

set pinsToFullAnalog {} ;
set pinsToFullAnalog [ dbGet $ptrToCell.instTerms.cellTerm.name  SET_* ] ;
set pinsToFullAnalog [ concat $pinsToFullAnalog [dbGet $ptrToCell.instTerms.cellTerm.name SWCNTL*] ] ;

set pinsToFullAnalogString "";
foreach pinItem $pinsToFullAnalog { set pinsToFullAnalogString [concat $pinsToFullAnalogString $pinItem]   } ;


createPinGroup "gPinsToFullAnalog" -cell $cellName -pin "$pinsToFullAnalogString"  -spacing 1 -optimizeOrder 
createPinGuide -edge 1 -pinGroup "gPinsToFullAnalog" -cell $cellName -layer {M2}

assignPtnPin -ptn $cellName  -pin $pinsToFullAnalogString ;
pinAlignment  -refObj "INST_DAC" -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToFullAnalogString" -legalizePin;

foreach pinName $pinsToFullAnalogString { setPtnPinStatus $cellName $pinName fixed } ;

checkPinAssignment -ptn  $cellName -pin "$pinsToFullAnalogString";



####################
# Pins to LVDS
####################

set pinsToLVDS {} ;
set pinsToLVDS [ dbGet $ptrToCell.instTerms.cellTerm.name  LVDS* ] ;

set pinsToLVDSString "";
foreach pinItem $pinsToLVDS { set pinsToLVDSString [concat $pinsToLVDSString $pinItem]   } ;


createPinGroup "gPinsToLVDS" -cell $cellName -pin "$pinsToLVDSString"  -spacing 1 -optimizeOrder 
createPinGuide -edge 1 -pinGroup "gPinsToLVDS" -cell $cellName -layer {M2}

assignPtnPin -ptn $cellName  -pin $pinsToLVDSString ;
pinAlignment  -refObj "INST_PAD_RING/INST_LVDS" -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToLVDSString" -legalizePin;

foreach pinName $pinsToLVDSString { setPtnPinStatus $cellName $pinName fixed } ;

checkPinAssignment -ptn  $cellName -pin "$pinsToLVDSString";


####################
# Pins to ARBITER
####################
set pins {}
for { set i 0 } { $i < 256 } { incr i} {
     set groupid {}
     set instName ""
     lappend groupid  [join [format "gPinsToARB_%d" [expr $i ] ] ]
     if {$i%2 == 0} {
          lappend instName  [join [format "INST_ARBITER/ARBITER_%d_genblk1_INST_0" $i  ] ]
     } else {
          lappend instName  [join [format "INST_ARBITER/ARBITER_%d_genblk1_INST_1" $i  ] ]
     }
     lappend pins  [join [format "MASK_FULLCOL\[%d\]" $i ] ]
     lappend pins  [join [format "GRSTB_AR\[%d\]" [expr $i] ] ]
     lappend pins  [join [format "DELAY_AR\[%d\]" [expr $i*4] ] ]
     lappend pins  [join [format "DELAY_AR\[%d\]" [expr $i*4+1] ] ]
     lappend pins  [join [format "DELAY_AR\[%d\]" [expr $i*4+2] ] ]
     lappend pins  [join [format "DELAY_AR\[%d\]" [expr $i*4+3] ] ]

     set pinsToARBString "";
     foreach pinItem $pins { set pinsToARBString [concat $pinsToARBString $pinItem]   } ;
     createPinGroup "$groupid" -cell $cellName -pin "$pinsToARBString"  -spacing 1 -optimizeOrder 
     createPinGuide  -pinGroup "$groupid" -cell $cellName -layer {M2 M3 M4}
     assignPtnPin -ptn $cellName  -pin $pinsToARBString ;
     pinAlignment -refObj "$instName" -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToARBString" -legalizePin;
     set pins {}
}


set pinsToARB {} ;
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name DELAY_AR[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name GRSTB_AR[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name MASK_FULLCOL[*] ] ]  ];
foreach pinName $pinsToARBString { setPtnPinStatus $cellName $pinName fixed } ;

checkPinAssignment  -ptn  $cellName -pin "$pinsToARBString";



set pinsToARB {} ;
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name DELAY_MER[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name GRSTB_MER[*] ] ]  ];

set pinsToARBString "";
foreach pinItem $pinsToARB { set pinsToARBString [concat $pinsToARBString $pinItem]   } ;

#deletePinGroup -pinGroup "gPinsToARB" -cell $cellName;
createPinGroup "gPinsToARB" -cell $cellName -pin "$pinsToARBString"  -spacing 1 -optimizeOrder 
createPinGuide  -pinGroup "gPinsToARB" -cell $cellName -layer {M2 M3 M4}
#deletePinGuide -pinGroup "gPinsToARB" -cell $cellName
assignPtnPin -ptn $cellName  -pin $pinsToARBString ;
pinAlignment -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToARBString" -legalizePin;
#foreach instName $inst_names {
#pinAlignment -refObj "$instName"  -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToARBString" -legalizePin;
#}


foreach pinName $pinsToARBString { setPtnPinStatus $cellName $pinName fixed } ;

checkPinAssignment  -ptn  $cellName -pin "$pinsToARBString";


####################
# Pins to DIGITAL_TOP
####################
set pins {}
for { set i 0 } { $i < 256 } { incr i} {
     set groupid {}
     set instName ""
     lappend groupid  [join [format "gPinsToARB_%d" [expr $i ] ] ]
     lappend instName  [join [format "IB_%d_INST_ARBITER" [expr $i ] ] ]
     lappend pins  [join [format "PULSE_HOR\[%d\]" [expr $i*2 ] ] ]
     lappend pins  [join [format "PULSE_HOR\[%d\]" [expr $i*2+1] ] ]
     lappend pins  [join [format "PULSE_COL\[%d\]" [expr $i*2 ] ] ]
     lappend pins  [join [format "PULSE_COL\[%d\]" [expr $i*2+1] ] ]
     lappend pins  [join [format "MASK_HOR\[%d\]" [expr $i*2 ] ] ]
     lappend pins  [join [format "MASK_HOR\[%d\]" [expr $i*2+1] ] ]
     lappend pins  [join [format "MASK_DIAG\[%d\]" [expr 511- $i*2 ] ] ]
     lappend pins  [join [format "MASK_DIAG\[%d\]" [expr 511- ($i*2+1) ] ] ]
     lappend pins  [join [format "MASK_COL\[%d\]" [expr $i*2 ] ] ]
     lappend pins  [join [format "MASK_COL\[%d\]" [expr $i*2+1] ] ]
     lappend pins  [join [format "GRSTB\[%d\]" [expr $i] ] ]
     lappend pins  [join [format "DELAY\[%d\]" [expr $i*4] ] ]
     lappend pins  [join [format "DELAY\[%d\]" [expr $i*4+1] ] ]
     lappend pins  [join [format "DELAY\[%d\]" [expr $i*4+2] ] ]
     lappend pins  [join [format "DELAY\[%d\]" [expr $i*4+3] ] ]

     set pinsToARBString "";
     foreach pinItem $pins { set pinsToARBString [concat $pinsToARBString $pinItem]   } ;
     createPinGroup "$groupid" -cell $cellName -pin "$pinsToARBString"  -spacing 1 -optimizeOrder 
     createPinGuide  -pinGroup "$groupid" -cell $cellName -layer {M4}
     assignPtnPin -ptn $cellName  -pin $pinsToARBString ;
     pinAlignment -refObj "$instName" -ptnInst "INST_DIGITAL_TOP" -pinNames "$pinsToARBString" -legalizePin;
     set pins {}
}


set pinsToARB {} ;
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_HOR[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name PULSE_COL[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name GRSTB[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name MASK_COL[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name MASK_DIAG[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name MASK_HOR[*] ] ]  ];
set pinsToARB [ concat $pinsToARB [join [ dbGet $ptrToCell.instTerms.cellTerm.name DELAY[*] ] ]  ];

set pinsToARBString "";
foreach pinItem $pinsToARB { set pinsToARBString [concat $pinsToARBString $pinItem]   } ;

foreach pinName $pinsToARBString { setPtnPinStatus $cellName $pinName fixed } ;

checkPinAssignment -ptn  $cellName -pin "$pinsToARBString";


checkPinAssignment -ptn  $cellName ;

savePtnPin -ptn $cellName "digitalTopPins.fp.ptn" ;

saveDesign -cellview "$oaLibName $DESIGN digital_top_partition"







