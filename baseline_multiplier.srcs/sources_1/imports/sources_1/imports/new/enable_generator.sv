`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 01:24:19 AM
// Design Name: 
// Module Name: enable_generator
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


module enable_generator #(parameter Word_size = 8, Max_Quantization = 32,  Desired_Quantization=1)(
    input clock,
    input en_5,
    output [Word_size-1:0] en_32,
    input mux_sel_5,
    output [Word_size-1:0] mux_sel_32
    );
    
    (*keep_hierarchy="yes"*) enable_decoder en_decoder(
    .clock(clock),
    .en_5(en_5),
    .en_32(en_32)
    );
    
    (*keep_hierarchy="yes"*) enable_decoder mux_decoder(
    .clock(clock),
    .en_5(mux_sel_5),
    .en_32(mux_sel_32)
    );
    
endmodule
