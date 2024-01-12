`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:59 04/16/2023 
// Design Name: 
// Module Name:    bintobcd 
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
module bintobcd(
   input [7:0] count,
   output reg [11:0] bcd
   );
   
integer i;
always @(count) begin
    bcd=0;		 	
    for (i=0;i<8;i=i+1) begin					//Iterate once for each bit in input number
   if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	bcd = {bcd[10:0],count[7-i]};				//Shift one bit, and shift in proper bit from input 
    end 
end
endmodule 
