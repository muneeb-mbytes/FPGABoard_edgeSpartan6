module statetb;

	// Inputs
	reg start;
	reg stop;
	reg load;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] state;

	// Instantiate the Unit Under Test (UUT)
	statedetect uut (
		.start(start), 
		.stop(stop), 
		.load(load), 
		.reset(reset), 
		.clk(clk), 
		.state(state)
	);
