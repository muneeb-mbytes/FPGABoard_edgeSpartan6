`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:22:00 05/25/2023 
// Design Name: 
// Module Name:    top 
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
module top(
    input buzz1,
	 input buzz2,
	 input buzz3,
	 input buzz4,
	 input clk_50MHz,
	 input reset,
	 output buzzer
	 );
	 
	 wire result_buzz1, result_buzz2, result_buzz3, result_buzz4, clk_261Hz, clk_277Hz, clk_493Hz, clk_523Hz;
	 wire [1:0] state;
	 debouncer db(.buzz1(buzz1), .buzz2(buzz2), .buzz3(buzz3), .buzz4(buzz4), .reset(reset), .clk_50MHz(clk_50MHz), .result_buzz1(result_buzz1), 
	              .result_buzz2(result_buzz2), .result_buzz3(result_buzz3), .result_buzz4(result_buzz4));
					  
   state_detect sd(.result_buzz1(result_buzz1), .result_buzz2(result_buzz2), .result_buzz3(result_buzz3), .result_buzz4(result_buzz4),
                  .clk_50MHz(clk_50MHz), .state(state));
						
	clk_261_63Hzgen clk1(.clk_50MHz(clk_50MHz), .reset(reset), .clk_261Hz(clk_261Hz));
	clk_277_18Hzgen clk2(.clk_50MHz(clk_50MHz), .reset(reset), .clk_277Hz(clk_277Hz));
	clk_493_88Hzgen clk3(.clk_50MHz(clk_50MHz), .reset(reset), .clk_493Hz(clk_493Hz));
	clk_523_25Hzgen clk4(.clk_50MHz(clk_50MHz), .reset(reset), .clk_523Hz(clk_523Hz));
						
   main_logic ml(.clk_50MHz(clk_50MHz), .clk_261Hz(clk_261Hz), .clk_277Hz(clk_277Hz), .clk_493Hz(clk_493Hz), .clk_523Hz(clk_523Hz), .state(state),
	               .buzzer(buzzer));
   
	


endmodule
