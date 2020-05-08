`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 01:32:38 PM
// Design Name: 
// Module Name: CLA_Memory
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


module CLA_Memory_Module  #(parameter Word_size = 8, Quantization = 16)(
    input [Quantization-1:0] data_in,
    input clock,en,
    output reg [Quantization-1:0] data_out [Word_size-1:0] ,
    output reg done_mem
    );
    integer i;
    
    reg [5:0] count = 5'b0;  // bitsize of each slice, 8 in this case
    reg [Quantization-1:0] data_out_local [Word_size-1:0];
    reg done_mem_local;

    
    always @(posedge clock)
        begin
//            $display("test1 %b", data_in, count, en);
            if(en & (data_in >= 0)) begin
//            $display(data_in);
               if (count < Word_size)  
                begin
                    for (i = 0 ; i < Quantization ; i = i + 1)
                        begin
                            data_out_local [count][i] <= data_in [i];
                        end
//                    $display("data out %b",0);
//                    $display(data_out);
                    count = count + 1;   
                 end 
               if (count == 8)
                begin
                   done_mem_local <=1'b1;
                   count <= 0; 
                end  
            end
        end
        
        always @(posedge clock)
        begin
            if(done_mem_local) begin
                data_out <= data_out_local;
                done_mem <= done_mem_local;
               end  
        
        end 



endmodule
