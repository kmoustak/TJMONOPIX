
###########
# Blockage on M5 above POL 
###########

# Place M5 blockages over all POL with GAP sufficient for M5 routing around the PAD

globalNetConnect VDDP -type pgpin -pin VDD -inst *
globalNetConnect GNDP -type pgpin -pin VSS -inst *

globalNetConnect VDDP -type pgpin -pin VDDP -inst *
globalNetConnect GNDP -type pgpin -pin GNDP -inst *

globalNetConnect VDDP -type pgpin -pin DVDD -inst *
globalNetConnect GNDP -type pgpin -pin DVSS -inst *


### Ring arond the Core

addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer TOP_M -user_defined_region {20 140 20 500 18175 500 18175 140} -type core_rings -around user_defined -jog_distance 0.56 -threshold 0.56 -nets {VDDP GNDP} -follow core -stacked_via_bottom_layer M1 -layer {bottom M4 top M4 right M3 left M3} -width 5 -spacing 1 -offset 0.56 


#### Matrix Power connection 

sroute -connect { blockPin } -layerChangeRange { M4 TOP_M } -blockPinTarget { nearestTarget } -deleteExistingRoutes -blockPinRouteWithPinWidth -allowJogging 1 -crossoverViaLayerRange { M1 TOP_M } -allowLayerChange 1 -nets { GNDP VDDP } -blockPin useLef -block { matrix_dac } -targetViaLayerRange { M1 TOP_M }

sroute -connect { blockPin } -layerChangeRange { M4 TOP_M } -blockPinTarget { nearestTarget } -blockPinRouteWithPinWidth -blockPinLayerRange { TOP_M TOP_M } -allowJogging 1 -crossoverViaLayerRange { M1 TOP_M } -allowLayerChange 1 -nets { GNDP VDDP } -blockPin { onBoundary topBoundary } -targetViaLayerRange { M1 TOP_M }


setAddStripeMode -remove_floating_stripe_over_block false

#addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M1 -spacing 0.28 -merge_stripes_value 0.56 -direction horizontal -layer M5 -block_ring_bottom_layer_limit M1 -stop_x 0 -stop_y 0 -width 5 -area {} -nets {VDDP GNDP} -start_x 0 -stacked_via_bottom_layer M1 -start_y 0


addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit TOP_M -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M3 -set_to_set_distance 25 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit TOP_M -spacing 1 -switch_layer_over_obs 1 -merge_stripes_value 0.84 -layer TOP_M -block_ring_bottom_layer_limit M3 -width {10 } -nets {VDDP GNDP} -stacked_via_bottom_layer M1

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit TOP_M -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M4 -set_to_set_distance 50 -ybottom_offset 10 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit TOP_M -spacing 0.6 -merge_stripes_value 0.56 -direction horizontal -layer M5 -block_ring_bottom_layer_limit M4 -width 10 -nets {GNDP VDDP} -stacked_via_bottom_layer M1
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M5 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit M3 -set_to_set_distance 50 -skip_via_on_pin Standardcell -stacked_via_top_layer TOP_M -padcore_ring_top_layer_limit M5 -spacing 0.6 -merge_stripes_value 0.56 -layer M4 -block_ring_bottom_layer_limit M3 -width 10 -nets {GNDP VDDP} -stacked_via_bottom_layer M1 

setSrouteMode  -splitLongVia { 2 4 -1 1} 
sroute -connect {corePin} -nets { GNDP VDDP }  -layerChangeRange { M1 M4 }   

#saveDesign $SAVE_DESIGN_PR_FILE
saveDesign -cellview "$oaLibName $DESIGN pplan"

