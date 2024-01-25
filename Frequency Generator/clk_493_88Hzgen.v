`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:17:03 05/25/2023 
// Design Name: 
// Module Name:    clk_493_88Hzgen 
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
module clk_493_88Hzgen(input clk_50MHz,
    input reset,
    output clk_493Hz
);
 reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
 reg clk_out_reg = 0;
	  always @(posedge clk_50MHz or posedge reset)
        if(reset) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
		  if(ctr_reg == 50620) begin  // 50MHz / 1Hz / 2 = 25,000,000
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    assign clk_493Hz = clk_out_reg;


endmodule
