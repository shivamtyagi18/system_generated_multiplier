`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 01:04:39 PM
// Design Name: 
// Module Name: carry_lookahead_adder_tb
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


module carry_lookahead_adder_tb #(parameter WIDTH = 32) (
  input reg clock,
  input reg [WIDTH-1:0] data_in_A = 0,
  input reg [WIDTH-1:0] data_in_B = 0,
  output wire [WIDTH:0] data_out_from_R0
  );
   
  carry_lookahead_adder carry_lookahead_inst
    (
     .clock(clock),
     .data_in_A(data_in_A),
     .data_in_B(data_in_B),
     .data_out_from_R0(data_out_from_R0)
     );
     
   initial begin
       clock = 0; 
    end 
      
    always 
       #10 clock =  ! clock;;
 
  initial
    begin
    
       #100
        data_in_A = 32'd 6;
        data_in_B = 32'd 15;
        
        //2
        #10
        data_in_A = 32'd 256;
        data_in_B = 32'd 10;
        
        //3
        #20
        data_in_A = 32'd 6;
        data_in_B = 32'd 15;
        
        //4
        #20
        data_in_A = 32'd 0;
        data_in_B = 32'd 0;
        
        //5
        #20
        data_in_A = 32'd 5;
        data_in_B = 32'd 5;
        
        //6
        #20
        data_in_A = 32'd 2;
        data_in_B = 32'd 2;
        
        //7
        #20
        data_in_A = 32'd 6;
        data_in_B = 32'd 6;
        
        //8
        #20
        data_in_A = 32'd 10; 
        data_in_B = 32'd 10;
        
        //9
        #20
        data_in_A = 32'd 0;
        data_in_B = 32'd 0;
//        en = 5'b0;
//        reset = 1;
        
        //10
        #20
        data_in_A = 32'd 10;
        data_in_B = 32'd 7;
        
        //11
        #20
        data_in_A = 32'd 15;
        data_in_B = 32'd 5;
        
        //12
        #20
        data_in_A = 32'd 8;
        data_in_B = 32'd 0;
        
        //13
        #20
        data_in_A = 32'd 16;
        data_in_B = 32'd 5;
        
        //14
        #20
        data_in_A = 32'd 22;
        data_in_B = 32'd 2;
        
        //15
        #20
        data_in_A = 32'd 16;
        data_in_B = 32'd 60;
        
        //16
        #20
        data_in_A = 32'd 10; 
        data_in_B = 32'd 10;    
        
        //17
        #20
        data_in_A = 32'd 2;
        data_in_B = 32'd 2;
        
        //18
        #20
        data_in_A = 32'd 10;
        data_in_B = 32'd 0;
        
//        $stop;
      
    end
 
endmodule // carry_lookahead_adder_tb
