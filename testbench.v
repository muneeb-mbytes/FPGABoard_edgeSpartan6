module countercheck;

	// Inputs
	reg start;
	reg stop;
	reg reset;
	reg load;
	reg clk_50M;
	reg ud;
	reg [3:0] digit;

	// Outputs
	wire [7:0] anode;
	wire rollover;

	// Instantiate the Unit Under Test (UUT)
	supercounter uut (
		.start(start), 
		.stop(stop), 
		.reset(reset), 
		.load(load), 
		.clk_50M(clk_50M), 
		.ud(ud), 
		.digit(digit), 
		.anode(anode), 
		.rollover(rollover)
	);

	initial begin
		// Initialize Inputs
		start = 0;
		stop = 0;
		reset = 1'b1;
		load = 0;
		ud = 0;
		digit = 4'b0000;
		clk_50M=1'b1;
		#100 ud=1'b1;
		start=1;
		#100 load=1'b1;
		

		// Wait 100 ns for global reset to finish
	
        
		// Add stimulus here

	end
	initial begin
	forever 
	#10 clk_50M=~clk_50M;
	end
      
endmodule
