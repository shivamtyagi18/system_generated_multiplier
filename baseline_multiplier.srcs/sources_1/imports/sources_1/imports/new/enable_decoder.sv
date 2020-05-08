`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 03:48:30 PM
// Design Name: 
// Module Name: enable_decoder
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


module enable_decoder #(parameter Word_size = 8)(
    input clock,
    input en_5,
    output reg [Word_size-1:0] en_32
    );
    
     always @(posedge clock)
        begin
            if ( en_5 == 1'b1 )
                begin
                    en_32 = 32'b11111111;
                end
             else begin
                en_32 = 32'b0;
                end
            
        end
endmodule
