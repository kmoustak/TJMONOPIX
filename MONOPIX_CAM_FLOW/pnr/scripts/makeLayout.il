
;###################################################
;##
;## Created on Nov  26  2009 
;## by Sandro Bonacini
;## CERN PH/ESE/ME
;##
;###################################################

viewName = "encounter"
viewName1 = "layout"
load("defCellLib.il")

l0= ddGetObj(designLib)
 
;############ process autoLayout ###########


au0 = dbOpenCellViewByType(l0 cellName viewName "maskLayout" "a")
dbSave(au0 designLib cellName viewName1)
dbClose(au0)

;au1 = dbOpenCellViewByType(l0 cellName viewName1 "maskLayout" "a")
;load("addPins.il")
;# 1. add labels for each pin
;dbSave(au1)
;dbClose(au1)

au2 = dbOpenCellViewByType(l0 cellName viewName1 "maskLayout" "a")
;;; Remaster all abstracts to layout views
leRemasterInstances(au2 "" "" "abstract" "" "" "layout" nil) 

dbSave(au2 designLib cellName viewName1)
dbClose(au2)

