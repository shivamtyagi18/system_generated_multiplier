`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 03:16:53 AM
// Design Name: 
// Module Name: clock_generator
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


module clock_generator(
        input  wire clk100MHz,
        input  wire rst,
        output reg  clk_500MHz
//        output reg  clk_5KHz
    );

    integer count1;

    always @ (posedge clk100MHz) begin
        if (rst) begin
            count1 = 0;
//            count2 = 0;
//            clk_5KHz = 0;
            clk_500MHz = 1;
        end
        else begin
            if (count1 == 2) begin
                clk_500MHz = ~clk_500MHz;
                count1 = 0;
            end
            count1 = count1 + 1;           
        end
    end

endmodule
