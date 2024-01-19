module full_addtb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#70; a=0;b=0;cin=1;
       #70; a=0;b=1;cin=0;
		 #70; a=0;b=1;cin=1;
		 #70; a=1;b=0;cin=0;
		 #70; a=1;b=0;cin=1;
		 #70; a=1;b=1;cin=0;
		 #70; a=1;b=1;cin=1;
		// Add stimulus here

	end
      
endmodule
