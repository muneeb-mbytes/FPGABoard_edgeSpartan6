module sevensmttb;

	// Inputs
	reg [3:0] bcd;

	// Outputs
	wire [7:0] seg;

	// Instantiate the Unit Under Test (UUT)
	sevensmt uut (
		.bcd(bcd), 
		.seg(seg)
	);

	initial begin
		
		

		
		 bcd=4'b0000;
		#50; bcd=4'b0001;
		#50; bcd=4'b0010;
		#50; bcd=4'b0011;
		#50; bcd=4'b0100;
		#50; bcd=4'b0101;
		#50; bcd=4'b0110;
		#50; bcd=4'b0111;
		#50; bcd=4'b1000;
		#50; bcd=4'b1001;
		#50; bcd=4'b1010;
		#50; bcd=4'b1011;
		#50; bcd=4'b1100;
		#50; bcd=4'b1101;
		#50; bcd=4'b1110;
		#50; bcd=4'b1111;
		
		
		
        
	
		end
      
endmodule
