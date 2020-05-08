`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 01:11:47 AM
// Design Name: 
// Module Name: input_buffer
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


module input_buffer 
    #(parameter size_of_vectors = 32, Word_size = 8, Max_Quantization = 32, Desired_Quantization=16)(
        input  [Desired_Quantization-1:0] data_in_A, data_in_B,
        input clock, en_mem,
        output  wire [Desired_Quantization-1:0] data_out_A [Word_size-1:0], data_out_B [Word_size-1:0],
        output wire done_mem_A, done_mem_B
    );

    (*keep_hierarchy="yes"*) CLA_Memory_Module bsi_mem_A (
        .data_in(data_in_A),
        .clock(clock),
        .en(en_mem),
        .data_out(data_out_A), // Final block of 32, 8-bit slices of 8 datapoints of A for input to CLA Adder
        .done_mem(done_mem_A)  // Final block og 32, 8-bit slices of 8 datapoints of B for input to CLA Adder
    ); 
    
    (*keep_hierarchy="yes"*) CLA_Memory_Module bsi_mem_B(
        .data_in(data_in_B),
        .clock(clock),
        .en(en_mem),
        .data_out(data_out_B),
        .done_mem(done_mem_B)
    );
endmodule
