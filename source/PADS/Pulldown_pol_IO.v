//Verilog HDL for "pALPIDEfs_V2_BLOCKS_CAM", "Pulldown_pol_IO" "functional"
`timescale 1ns / 1ps

module Pulldown_pol_IO ( CIN, AVDD, AVSS, DVDD, DVSS, PAD, SUB, DOUT, OEN );

  inout PAD;
  input OEN;
  inout DVDD;
  output CIN;
  input DOUT;
  inout AVSS;
  inout SUB;
  inout DVSS;
  inout AVDD;
    
  //synopsys translate_off
  assign CIN = PAD;
  assign PAD = OEN ? 1'bz : DOUT;  
  //synopsys translate_on
  
endmodule
