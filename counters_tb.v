`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:02:04 04/10/2023
// Design Name:   top
// Module Name:   /home/ise/hexacube_updown.counter_challange1/counters_tb.v
// Project Name:  hexacube_updown.counter_challange1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counters_tb;

	// Inputs
	reg stop;
	reg load;
	reg updown;
	reg clk_50MHz;
	reg reset;

	// Outputs
	wire buzzer;
	wire [7:0] seg;
	wire [3:0] digit;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.stop(stop), 
		.load(load), 
		.updown(updown), 
		.clk_50MHz(clk_50MHz), 
		.reset(reset), 
		.buzzer(buzzer), 
		.seg(seg), 
		.digit(digit)
	);

	initial begin
		// Initialize Inputs
		stop = 0;
		load = 0;
		updown = 0;
		clk_50MHz = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      stop = 1;
		load = 0;
		updown = 0;
		clk_50MHz = 1;
		reset = 1;
		
		#100;
		stop = 0;
		load = 0;
		updown = 0;
		clk_50MHz = 1;
		reset = 0;
		#100;
	end
    always #10 clk_50MHz=~clk_50MHz;        
endmodule

