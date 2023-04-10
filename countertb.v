module countertb;

	// Inputs
	reg clk;
	reg ud;
	reg [1:0] state;

	// Outputs
	wire [6:0] count;
	wire roll;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.count(count), 
		.ud(ud), 
		.state(state), 
		.roll(roll)
	);

	initial begin
		// Initialize Inputs
		ud = 0;
		state = 0;

		// Wait 100 ns for global reset to finish
		#100;
		state =2'b10;
		
		#2000 
		ud=1;
		
        
		// Add stimulus here

	end
	initial begin 
	clk=0;
	forever #50 clk=~clk;
	end
      
endmodule

