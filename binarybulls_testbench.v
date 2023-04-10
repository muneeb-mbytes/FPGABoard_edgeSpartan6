`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:45 04/09/2023
// Design Name:   updown_counter
// Module Name:   /home/ise/Desktop/cont/bench3_withoutenable.v
// Project Name:  cont
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: updown_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bench3_withoutenable;

	// Inputs
	reg clk;
	reg rst_n;
	reg up_down;
	reg start;
	reg stop;
	reg load;

	// Outputs
	wire [6:0] count;
	wire [6:0] bcd;
	//wire [6:0] seg_out;
	//wire [1:0] anode;
	wire buzzer;

	// Instantiate the Unit Under Test (UUT)
	updown_counter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.up_down(up_down), 
		.count(count), 
		.start(start), 
		.stop(stop), 
		.load(load), 
		.bcd(bcd), 
		//.seg_out(seg_out), 
		//.anode(anode), 
		.buzzer(buzzer)
	);
	
initial  clk=1'b0;
	always #5 clk=~clk;
	initial
    begin
        rst_n= 1;start=1;
		  
        #10;
        rst_n= 0;start =1;
    end
	 
	 initial
    begin

        up_down = 1; stop=0;load=0;// Set up_down to 1 for counting up
        #1500;
		  start=0;stop=1;
		  #50;
		  start=1;stop=0;
		  #50;
		  //count_enable=1;
		  load=1;start=0;
		  #50;
		  load=0;start=1;//count_enable=1;
		  #100;
		  start=0;
		  stop=1;
		//  count_enable=0;
		  #100;
		  start=1;
		  stop=0;
		  #50;
		  start=0;stop=1;
		//  count_enable=1;
		  #50;
		  load=0;stop=0;
		  start=1; up_down=0;
		  #1000;
		   start=0;stop=1;
		  #50;
		  start=1;stop=0;
		  #50;
		  load=1;start=0;
		  #50;
		load=0; start=0; rst_n=1;
		#50;
        start=1; // Set up_down to 0 for counting down
        #20;
        $finish;

		  end
		  always @(posedge clk) begin
    $display("count = %d, bcd = %d,  buzzer = %b",
             count, bcd,  buzzer);
  end
      
endmodule
