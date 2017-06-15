catch {exec rm addPins.il}
set skillfd [open "addPins.il" "w"]
set ioBox [join [dbGet top.fplan.ioBox]]
set ioBox_X0 [lindex $ioBox 0]
set ioBox_Y0 [lindex $ioBox 1]
set ioBox_X1 [lindex $ioBox 2]
set ioBox_Y1 [lindex $ioBox 3]
set rot R90
foreach pTerm [dbGet top.terms]  {
	set pinName [string map { [ < ] > } [join [dbGet $pTerm.name]]]

	set pinPos [join [dbGet $pTerm.pt]]
	set pinX [lindex $pinPos 0]
	set pinY [expr [lindex $pinPos 1] ]
	if {$pinY == $ioBox_Y0} {
		set pinY [expr $pinY + 0.56]
		set rot R90
	} 
	if {$pinY == $ioBox_Y1} {
		set pinY [expr $pinY - 0.56]
		set rot R270
	} 
	if {$pinX == $ioBox_X0} {
		set pinX [expr $pinX + 0.56]
		set rot R0
	} 
	if {$pinX == $ioBox_X1} {
		set pinX [expr $pinX - 0.56]
		set rot R180
	} 
	set Layer [dbGet $pTerm.layer.name]	
	if {$Layer == "M6"} {
		set Layer TOP_M
	} 
	puts "$pinName $pinX $pinY $Layer"

     puts $skillfd "label0 = dbCreateLabel(au1 list(\"$Layer\" \"label\") list( $pinX $pinY ) \"$pinName\" \"centerCenter\" \"$rot\" \"stick\" 0.2)"
	puts $skillfd "printf(\">>> makeLayout: Adding label $pinName\\n\")"

} 
if { [dbget top.numPGTerms] != 0 } {
	foreach pTerm [dbGet top.pgTerms] {
		set pinName [join [dbGet $pTerm.name]]
		set pinPos [join [dbGet $pTerm.pt]]
		set pinX [lindex $pinPos 0]
		set pinY [expr [lindex $pinPos 1] ]
		if {$pinY == $ioBox_Y0} {
			set pinY [expr $pinY + 0.56]
			set rot R90
		} 
		if {$pinY == $ioBox_Y1} {
			set pinY [expr $pinY - 0.56]
			set rot R270
		} 
		if {$pinX == $ioBox_X0} {
			set pinX [expr $pinX + 0.56]
			set rot R0
		} 
		if {$pinX == $ioBox_X1} {
			set pinX [expr $pinX - 0.56]
			set rot R180
		} 

		if {[dbGet $pTerm.layer.name] == "M6"} {
			set Layer TOP_M
		} else {
			set Layer [dbGet $pTerm.layer.name]	
		}
		puts "$pinName $pinX $pinY $Layer"

		puts $skillfd "label0 = dbCreateLabel(au1 list(\"$Layer\" \"label\") list( $pinX $pinY ) \"$pinName\" \"centerCenter\" \"$rot\" \"stick\" 0.2)"
		puts $skillfd "printf(\">>> makeLayout: Adding label $pinName\\n\")"

	}
}
close $skillfd 
