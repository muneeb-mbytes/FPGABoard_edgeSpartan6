`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:46:46 05/25/2023 
// Design Name: 
// Module Name:    main_logic 
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
module main_logic(
input clk_50MHz,
input clk_261Hz,
input clk_277Hz,
input clk_493Hz,
input clk_523Hz,
input [1:0] state,
output reg buzzer
);

always @(posedge clk_50MHz)
begin
case(state)
2'b00 : buzzer = clk_261Hz;
2'b01 : buzzer = clk_277Hz;
2'b10 : buzzer = clk_493Hz;
2'b11 : buzzer = clk_523Hz;
endcase
end

endmodule
