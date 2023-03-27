module gate_test;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	gateand uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
#40 a=0;b=1;
#40 a=1;b=0;
#40 a=1;b=1;
	
	end
	initial begin
      $monitor("%d %d =%d",a,b,y);
		end
endmodule
