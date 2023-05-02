`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:15:03 05/02/2023 
// Design Name: 
// Module Name:    sd 
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
`timescale 1ns / 1ps

module statedetect(result_on,result_off,result_err,result_open,clk_50MHz,state);
input result_on,result_off,result_err,result_open,clk_50MHz;
output reg [1:0] state;

always@(posedge clk_50MHz)
begin
if(result_on)
   state=2'b00;
else if (result_off)
	state=2'b01;
	else if (result_err)
	state=2'b10;
	else if (result_open)
	state=2'b11;
end

endmodule 
