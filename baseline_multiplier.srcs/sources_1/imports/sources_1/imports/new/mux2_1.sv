`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 10:06:35 AM
// Design Name: 
// Module Name: mux2_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2_1 #(parameter Word_size = 8) (
    din_0      , // Mux first input
    din_1      , // Mux Second input
    sel        , // Select input
    mux_out      // Mux output
  );
  //-----------Input Ports---------------
  input [Word_size-1:0] din_0, din_1;
  input sel ;
  //-----------Output Ports---------------
  output [Word_size-1:0] mux_out;
  //------------Internal Variables--------
  wire  [Word_size-1:0] mux_out;
  //-------------Code Start-----------------
  assign mux_out = (sel) ? din_1 : din_0;

endmodule
