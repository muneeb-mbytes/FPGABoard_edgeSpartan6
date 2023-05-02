`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:40:45 05/02/2023
// Design Name:   top_module
// Module Name:   /home/ise/challenge2_hexacube/challenge_tb.v
// Project Name:  challenge2_hexacube
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module challenge_tb;

	// Inputs
	reg clk;
	reg buzz;
	reg err;
	reg on;
	reg off;
	reg open;

	// Outputs
	wire buzzer;
	wire [7:0] seg;
	wire [3:0] digit;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.buzz(buzz), 
		.err(err), 
		.on(on), 
		.off(off), 
		.open(open), 
		.buzzer(buzzer), 
		.seg(seg), 
		.digit(digit)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		buzz = 0;
		err = 0;
		on = 0;
		off = 0;
		open = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 0;
		buzz = 1;
		err = 0;
		on = 0;
		off = 0;
		open = 0;
		
		#100;
		clk = 0;
		buzz = 0;
		err = 1;
		on = 0;
		off = 0;
		open = 0;
        
		#100;
		clk = 0;
		buzz = 0;
		err = 0;
		on = 1;
		off = 0;
		open = 0;
		
		#100;
		clk = 0;
		buzz = 0;
		err = 0;
		on = 0;
		off = 1;
		open = 0;
		
		#100;
		clk = 0;
		buzz = 0;
		err = 0;
		on = 0;
		off = 0;
		open = 1;
        
        
		// Add stimulus here

	end
	always #10 clk = ~clk;
      
endmodule
