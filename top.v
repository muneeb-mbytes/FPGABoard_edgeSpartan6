`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:55 05/25/2023 
// Design Name: 
// Module Name:    toop 
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
module top( input clk_50MHz,
    output clk_1Hz,
	 output buzzer,
	input freq1,
	input freq2,
	input freq3,
	input reset_button,
	input reset);



debouncer db(.freq1(freq1), .freq2(freq2), .freq3(freq3), .reset_button(reset_button), .clk_50MHz(clk_50MHz), 
	              .reset(reset), .result_start(w_result_start), .result_stop(w_result_stop), .result_load(w_result_load), .result_reset(w_result_reset));
oneHz_gen uut(.clk_50MHz(clk_50MHz),.clk_1Hz(clk_1Hz),.buzzer(buzzer));


    endmodule
	 
