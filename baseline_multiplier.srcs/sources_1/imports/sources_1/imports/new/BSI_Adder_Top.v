`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2019 01:58:25 AM
// Design Name: 
// Module Name: CLA_Adder_Top_Module
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

// word_size = number of features in vector (per slice)
//Max_Quantization = number of maximum quantisation bits available
// size_of_vector = total number of data points

module System_Multiplier_Top #(parameter Word_size = 8, Max_Quantization = 32,  Desired_Quantization=16)(
//    input [Word_size-1:0] en_top ,
  	input clk_top,
//  	input [Word_size-1:0] mux_sel,
  	input [Desired_Quantization-1:0] A [Word_size-1:0],
  	input [Desired_Quantization-1:0] B [Word_size-1:0],
//  	inout [Word_size-1:0] C [Max_Quantization:0],
  	output [Desired_Quantization+Desired_Quantization-1:0] R0 [Word_size-1:0],
    output reg done_top
    );
 
  ; //As per quantization
//  wire [Word_size-1:0] C_top[Max_Quantization:0]; // Carry output
  wire [Word_size-1:0] mux_out[Desired_Quantization:0]; //
  wire [Word_size-1:0] done_top_local;
//  wire [Max_Quantization-1:0] en_top_local = done_top_local & en_top  ; //0 if done_top=1

  reg [Desired_Quantization-1:0] A_local [Word_size-1:0] ;
  reg [Desired_Quantization-1:0] B_local [Word_size-1:0];
  
//  assign C_top[0]= 8'b0 ; // First carry value
//  assign R0 [ Max_Quantization ] = C_top [ Max_Quantization ]; // joining Final Carry slice to output
//  assign done_top = done_top_local[ Max_Quantization-1 ];
//  assign done_top = myfunction ( done_top_local , 32'hffffffff ) ;
//  assign mux_out [ Word_size ] = 0;
   
     
  genvar i;
  generate
  for (i = 0 ; i < Word_size ; i = i+1) begin : multiplier
  (* keep_hierarchy="yes" *) multiplier inst_2 (
    .data_in_A ( A_local[i] ),
    .data_in_B ( B_local[i] ),
//  	.q2 ( mux_out[i] ),
//    .en ( en_top [i] ),
    .clock ( clk_top ),
    .data_out_from_R0 ( R0[i] ),
//    .C ( C_top [i+1] ),
    .done ( done_top_local [i] )
    );
    
//    (*keep_hierarchy="yes"*) mux2_1 mux02 (
//    .din_0 ( 8'b0 )       , // Mux first input 
//    .din_1 ( C_top[i] )     , // Mux Second input
//    .sel ( mux_sel[i] )       , // Select input
//    .mux_out ( mux_out [i] )         // Mux output 0 or C_top depending on the quantization
//    );
    
    end
   endgenerate
   
   
   
    //  function to check if all the done_top_local bits are set
    function  myfunction;
    input [Word_size-1:0]a;
    input [Word_size-1:0]b;
    begin
        if (a && b)
        begin
            myfunction = 1'b1;
         end
         else begin
            myfunction = 1'b0;
          end
    end
   endfunction
   
   always @(posedge clk_top)
    begin
        done_top = myfunction ( done_top_local , 8'hff ) ;
        if (done_top) begin
            A_local = A;
            B_local = B;
//            done_top = 0;
           end
    
    end
   
  	
endmodule  