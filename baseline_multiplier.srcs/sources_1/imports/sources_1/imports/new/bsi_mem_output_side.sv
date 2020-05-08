`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 06:07:19 PM
// Design Name: 
// Module Name: bsi_mem_output_side
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


module bsi_mem_output_side #(parameter Word_size = 8, Quantization = 32)(
    input [Quantization-1:0] data_in [Word_size-1:0],
    input en,
    output wire [Quantization-1:0] data_out [Word_size-1:0] ,
    output wire done_mem
    );
    
    
    genvar i, count;
    generate
        for (i = 0 ; i < Word_size ; i = i+1) begin : transpose
            for (count = 0 ; count < Quantization ; count = count+1) 
                begin
                    assign data_out [i][count] = data_in [i][count];     
                end           
         end
         assign done_mem = en;
        endgenerate
   
 
endmodule
