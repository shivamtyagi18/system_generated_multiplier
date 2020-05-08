`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2020 05:44:47 PM
// Design Name: 
// Module Name: CLA_Adder_Wrapper_level2
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

// Craete slices from the actual input to be fed to level1
// word_size = number of features in vector (per slice)
//Max_Quantization = number of maximum quantisation bits available
// size_of_vector = total number of data points

module CLA_Adder_Wrapper_level2 #(parameter  size_of_vectors = 16, Word_size = 8, Max_Quantization = 32,  Desired_Quantization=16)(
    input en_5, 
//    mux_sel_5 , // 5 bits decoded to 32 en outputs for 32 Quantization
    input clock,
//    input reset,
    output [Desired_Quantization+Desired_Quantization-1:0] data_out_from_R0,
    output done,
    input [Desired_Quantization-1:0] data_in_A, data_in_B
    );
    
    wire done_addition; //en_5_local, mux_5_local;
    
    (*keep_hierarchy="yes"*) System_Multiplier_Wrapper_level1 instance_of_wrapper_level1(
    .en_5 ( en_5 ),
  	.clock (clock),
//  	.mux_sel_5(mux_sel_5),
  	.data_in_A(data_in_A),
  	.data_in_B(data_in_B),
  	.data_out_for_R0(data_out_from_R0),
  	.done(done),
  	.done_addition(done_addition)
    );
    
    
    
    
    
  
endmodule


  
    
    

