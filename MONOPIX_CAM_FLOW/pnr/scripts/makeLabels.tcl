proc createPinsLabels {} {
  set mcp_terms [dbGet top.terms]
  foreach mcp_term $mcp_terms {
    set mcp_termLoc [lindex [dbGet $mcp_term.pt] 0]
    set mcp_termStatus [dbGet $mcp_term.pStatus]
    set mcp_x [lindex $mcp_termLoc 0]
    set mcp_y [lindex $mcp_termLoc 1]
    set mcp_termLayer [dbGet $mcp_term.layer]
    switch [dbGet $mcp_termLayer.direction] {
      Vertical {set mcp_orient R90}
      Horizontal {set mcp_orient R0}
    }
    set termName [dbGet $mcp_term.name]
    #
    # Remove curly brackets around term names that are bus bits:
    #
    set termName [regsub ({) $termName ""]
    set termName [regsub (}) $termName ""]
    set mcp_termLayerName [dbGet $mcp_termLayer.name]
    
    #if {$mcp_termLayerName== "M10"} {
    #    set mcp_termLayerName "AP"
    #}
    
    regsub -all "\[\[\]" $termName "\<" termName
    regsub -all "\[\]\]" $termName "\>" termName
                
    # Add label if term is not unplaced:
    if {$mcp_termStatus != "unplaced"} {
      
      add_text -height 8 -pt $mcp_x $mcp_y -label $termName -orient R270 -layer $mcp_termLayerName 
      #-oaPurpose label
      puts "$termName $mcp_x $mcp_y $mcp_termLayerName"
    }
  }
}

proc deletePinsLabels {} {
  set mcp_allTexts [dbGet top.texts]
  foreach mcp_text $mcp_allTexts {
    dbDeleteObj $mcp_text
  }
}

createPinsLabels