`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 12:12:50 AM
// Design Name: 
// Module Name: output_buffer
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


module output_buffer 
    #(parameter size_of_vectors = 32, Word_size = 8, Max_Quantization = 32, Desired_Quantization=32)(
  	input clock,
  	input done_addition,
  	input [Desired_Quantization-1:0] R0 [Word_size-1:0],
  	output [Desired_Quantization-1:0] data_out_for_R0,
  	output done
    ); 
    
    wire [Desired_Quantization-1:0] data_out_R0 [Word_size-1:0];
    wire done_from_output_memory;
    
    (*keep_hierarchy="yes"*) bsi_mem_output_side bsi_mem_output_side(
        .data_in(R0),
        .en(done_addition),
        .data_out(data_out_R0),
        .done_mem(done_from_output_memory)
    );
    
    (*keep_hierarchy="yes"*) output_mem_to_R0 output_mem_to_R0(
        .data_in_from_mem(data_out_R0),
        .done_mem(done_from_output_memory),
        .clock(clock),
        .data_out_for_R0(data_out_for_R0),
        .done(done)
    );
endmodule
