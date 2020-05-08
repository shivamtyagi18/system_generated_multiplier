`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 10:02:08 PM
// Design Name: 
// Module Name: cla_TB
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


module cla_TB #(parameter  size_of_vectors = 32, Word_size = 8, Max_Quantization = 32,  Desired_Quantization=16)(
    input reg en, 
//    mux_sel_5 ,
//     input reg [Max_Quantization-1:0] mux_sel,
    input reg clock, reset,
//    input reg [ Word_size-1:0 ] A [ Max_Quantization-1:0 ], B [ Max_Quantization-1:0 ],
//    output  wire [ Word_size-1:0 ] R0 [ Max_Quantization :0 ],
      output [Desired_Quantization+Desired_Quantization-1:0] data_out_from_R0,
    
    input reg [Desired_Quantization-1:0] data_in_A, data_in_B
//    output [Word_size-1:0] data_out_A [Desired_Quantization-1:0], data_out_B [Desired_Quantization-1:0]
    );
    
    CLA_Adder_Wrapper_level2 instance_tb(
    .en_5 ( en ),
  	.clock (clock),
//  	.mux_sel_5(mux_sel_5),
//  	.reset(reset),
  	.data_out_from_R0(data_out_from_R0),
  	.data_in_A(data_in_A),
//    .data_out_A(data_out_A),
    .data_in_B(data_in_B)
//    .data_out_B(data_out_B)
    
    );
    
    reg [Desired_Quantization-1:0] data_in_A_start, data_in_B_start;
    integer i;
    
    
    
    initial begin
      clock = 0; 
//      reset = 1;
    end 
      
    always 
       #20  clock =  ! clock;
    
    initial begin
    
        en = 5'd0;
        
        #10
//        reset = 0;
        
        #10
         
        
        en = 5'b1;
//        mux_sel_5 = 5'b1; // for 32-bit quantization
    
    end
    
    
    initial
        begin
        
//        #20
//        data_in_A = 32'd 15;
//        data_in_B = 32'd 10;

        // initial values of inputs to start
        data_in_A_start = 32'd 1;
        data_in_B_start = 32'd 2;
        
        #20
        
//        loop to increment the input values
        
        for (i = 0; i < 100; i = i + 1)
            begin
        
                #40
                data_in_A = data_in_A_start + i;
                data_in_B = data_in_B_start + i;
        
        end 
        
        $stop;

            
        end
        
      
endmodule

