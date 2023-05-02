`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:26:30 05/02/2023 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
    input clk,
    input buzz,
	 input err,
	 input on,
	 input off,
	 input open,
	 output buzzer,
	 output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit 
	 );
	 wire [2:0] w_state;
	 
	 challenge ch(.clk(clk), .buzz(buzz), .state(w_state), .seg(seg), .digit(digit), .buzzer(buzzer));
	 statedetector st(.clk(clk), .buzz(buzz), .err(err), .on(on), .off(off), .open(open));
	 


endmodule
