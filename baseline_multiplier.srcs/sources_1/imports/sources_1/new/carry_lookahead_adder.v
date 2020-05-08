`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 01:03:00 PM
// Design Name: 
// Module Name: carry_lookahead_adder
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

(* use_dsp = "no" *) 
module multiplier
  #(parameter WIDTH=16)
  (
   input clock,
   input [WIDTH-1:0] data_in_A,
   input [WIDTH-1:0] data_in_B,
   output reg [WIDTH+WIDTH-1:0]  data_out_from_R0,
   output reg done
   );
     
 
 always @(posedge clock)
    begin
        data_out_from_R0 <= data_in_A * data_in_B; // Verilog Concatenation
        done <= 1'b1;
           
  end
  
 
endmodule // carry_lookahead_adder
