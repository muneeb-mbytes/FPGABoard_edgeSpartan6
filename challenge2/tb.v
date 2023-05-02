`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:32:46 05/02/2023
// Design Name:   top
// Module Name:   /home/ise/challenge2/ch2/tb.v
// Project Name:  ch2
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

module tb;

	// Inputs
	reg clk_50MHz;
	reg reset;
	reg reset_button;
	reg on;
	reg off;
	reg err;
	reg open;
	reg buzz;

	// Outputs
	wire buzzer;
	wire [7:0] seg;
	wire [3:0] digit;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk_50MHz(clk_50MHz), 
		.reset(reset), 
		.reset_button(reset_button), 
		.on(on), 
		.off(off), 
		.err(err), 
		.open(open), 
		.buzz(buzz), 
		.buzzer(buzzer), 
		.seg(seg), 
		.digit(digit)
	);

	initial begin
		// Initialize Inputs
		clk_50MHz = 0;
		reset = 0;
		reset_button = 0;
		on = 0;
		off = 0;
		err = 0;
		open = 0;
		buzz = 0;

end
initial begin

#10 on = 1'b1;
#10 on =1'b0 ; off =1'b 1;
#10 off=1'b0  ;open =1'b1;
#10 open=1'b0 ; err=1'b1;
#10 err=1'b0;

#10 buzz=1'b1;
		// Wait 100 ns for global reset to finish
		#100 $finish; 
        
		// Add stimulus here

	end
      
endmodule

