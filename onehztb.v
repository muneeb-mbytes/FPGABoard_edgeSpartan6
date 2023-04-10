module onehzcheck;

	// Inputs
	reg clk_50M;

	// Outputs
	wire clk;

	// Instantiate the Unit Under Test (UUT)
	onehz uut (
		.clk_50M(clk_50M), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk_50M = 0;

		
		// Add stimulus here

	end
	initial begin
	forever #10 clk_50M=~clk_50M;
   end
endmodule
