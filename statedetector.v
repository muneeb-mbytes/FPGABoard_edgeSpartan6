`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:43:53 05/02/2023 
// Design Name: 
// Module Name:    statedetector 
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
module statedetector(
    input clk,
    input buzz,
	 input err,
	 input on,
	 input off,
	 input open,
    output reg [2:0] state
    );
   
always@(posedge clk)
begin
if(buzz)
   state=3'b000;
else if(err)
	state=3'b001;
else if(on)
    state = 3'b010;
else if(off)
    state = 3'b011;
else if(open)
    state = 3'b100;
end

endmodule
