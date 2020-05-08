`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2020 12:12:56 PM
// Design Name: 
// Module Name: CLA_Adder_Wrapper_level1
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

// Module to call 4X4 CLA Adder Module for 100% hardware utilisation
// by distributing inputs into group of 4 for processing.
// word_size = number of features in vector (per slice)
//Max_Quantization = number of maximum quantisation bits available
// size_of_vector = total number of data points


module System_Multiplier_Wrapper_level1  #(parameter size_of_vectors = 32, Word_size = 8, Max_Quantization = 32, Desired_Quantization=16)(
    input  en_5,
//     mux_sel_5 ,
  	input clock,
  	output [Desired_Quantization+Desired_Quantization-1:0] data_out_for_R0,
  	output done,
  	output done_addition,
  	input  [Desired_Quantization-1:0] data_in_A, data_in_B
    ); 

    
    wire [Desired_Quantization-1:0] data_out_A [Word_size-1:0] , data_out_B [Word_size-1:0];
   
    wire [Word_size-1:0] en_32, mux_sel_32;
    wire done_mem_A, done_mem_B;
    wire [ Desired_Quantization+Desired_Quantization-1:0 ] R0 [ Word_size-1 :0 ];
    wire en_mem = en_5;
    
    (*keep_hierarchy="yes"*) input_buffer input_buffer_instance (
        .data_in_A              (data_in_A), 
        .data_in_B              (data_in_B),
        .clock                  (clock),
        .en_mem                 (en_mem),
        .data_out_A             (data_out_A),
        .data_out_B             (data_out_B),
        .done_mem_A             (done_mem_A), 
        .done_mem_B             (done_mem_B)
    );
    
    
    (*keep_hierarchy="yes"*) System_Multiplier_Top System_Multiplier_Top_instance(
//    .en_top(en_32_local),
  	.clk_top         (clock),
//  	.mux_sel(mux_sel_32_local),
  	.A               (data_out_A),
  	.B               (data_out_B),
  	.R0              (R0),
    .done_top        (done_addition)
    );
 

     (*keep_hierarchy="yes"*) output_buffer output_buffer_to_R0(
        .clock               (clock),
        .done_addition       (done_addition),
  	    .R0                  (R0),
  	    .data_out_for_R0     (data_out_for_R0),
  	    .done                (done)
    );

    
endmodule
