`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:35:56 04/16/2023
// Design Name:   debounce_ckt
// Module Name:   /home/rohith/Documents/Debouncing/debouncer_tb.v
// Project Name:  Debouncing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debounce_ckt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;

	// Inputs
	reg button;
	reg clk;
  reg reset;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.button(button), 
		.clk(clk), 
		.reset(reset), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		
		button = 0;
		clk = 0;
    reset = 0;
    #20 reset = 1;
    #60 reset = 0;
end
		// Wait 100 ns for global reset to finish
		always #5 clk=~clk;

    always begin  
		// Add stimulus here
                        $monitor("Inside reset = %0d", reset);
		   #25 button=1;
			
		#10 button=0;
		#25 button=1;
		#15 button=0;
		#20 button=0;
		#10 button=1;
		#30 button=0;
		#15 button=1;
		
    $display("Done with simulation and result = %0d", result);
		
    #200;
	  $finish;	
		

	end
 // To dump the waveforms
 initial begin
   $dumpfile("i3c_avip.vcd");
   $dumpvars();
 end      
endmodule
