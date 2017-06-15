
catch {exec rm defCellLib.il}
set skillfd [open "defCellLib.il" "w"]
puts $skillfd "designLib =\"$oaLibName\""
puts $skillfd [format "%s%s%s" "cellName = \"" "$DESIGN" "\""]
close $skillfd
puts "Making final virtuoso layout view... (check makeLayout.log for details)"


set OA_PATH "/projects/TOWER180/ALICEITS/IS_OA_5096/workAreas/camarin/ALICEITS_OA/work_libs/user/cds/library/$oaLibName"
if {[file exists $OA_PATH]} {
	catch {exec rm -rf $OA_PATH/LAPA/encounter_abstract}
	catch {exec rm -rf $OA_PATH/$DESIGN/encounter}
	catch {exec rm -rf $OA_PATH/$DESIGN/layout}
     puts "deleted"
}

saveDesign -cellview "$oaLibName ${DESIGN} encounter"

catch {exec virtuoso -nograph -log makeLayout.log -replay ../scripts/makeLayout.il}

#exec lefin -lef "$outDir/${DESIGN}.lef" -lib "$oaLibName"  -overwrite 

puts "Importing the Abstract view into OA"

