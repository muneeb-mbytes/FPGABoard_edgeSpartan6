`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:46 04/17/2023
// Design Name:   digits
// Module Name:   /home/ise/ISE/hexa_sparta_counter/digits_tb.v
// Project Name:  hexa_sparta_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: digits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module digits_tb;

	// Inputs
	reg clk_1Hz;
	reg reset;
	reg updown;

	// Outputs
	wire [7:0] count;

	// Instantiate the Unit Under Test (UUT)
	digits uut (
		.clk_1Hz(clk_1Hz), 
		.reset(reset), 
		.updown(updown), 
		.count(count)
	);

	initial begin
		// Initialize Inputs
		clk_1Hz = 0;
		reset = 1;
		updown = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      reset = 0;
		updown = 1;
		
		#100;
        
		// Add stimulus here
      reset = 0;
		updown = 0;
	end
      always #10 clk_1Hz=~clk_1Hz; 
endmodule
