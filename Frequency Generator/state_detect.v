`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:31:26 05/25/2023 
// Design Name: 
// Module Name:    state_detect 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module state_detect(result_buzz1,result_buzz2,result_buzz3,result_buzz4,clk_50MHz,state);
input result_buzz1,result_buzz2,result_buzz3,result_buzz4,clk_50MHz; 
//input buttons after passing through debouncer circuit

output reg [1:0] state;

always@(posedge clk_50MHz)
begin
if(result_buzz1)
   state=2'b00; 
else if (result_buzz2)
	state=2'b01;
else if (result_buzz3)
   state=2'b10;
else if (result_buzz4)
   state=2'b11;
end

endmodule
