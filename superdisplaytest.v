`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:52 05/02/2023
// Design Name:   statedetect
// Module Name:   D:/verilog/demux/supercountertb.v
// Project Name:  demux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: statedetect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module superdisplaytb;

	// Inputs
	reg err;
	reg off;
	reg on;
	reg open;
	reg sound;
	reg clk;
	reg [3:0] digit;

	// Outputs
	wire [7:0] segment;
	wire buzzer;

	// Instantiate the Unit Under Test (UUT)
	superdisplay uut (
		.clk(clk), 
		.err(err), 
		.off(off), 
		.on(on), 
		.open(open), 
		.sound(sound), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		
		off = 0;
		on = 0;
		err = 0;
		open= 0;
		buzzer = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		always #10 clk=~clk;
		#10 err=1;
		#20 buzzer=1;
		#25 err=0;
		open=1;
		

	end
      
endmodule

