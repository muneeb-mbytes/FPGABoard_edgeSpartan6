`timescale 1ns / 1ps

module top(
    input clk_50MHz,       // from Basys 3
    input reset,
    input updown,	 // btnC
    output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit      // 7 segment display anodes
    );
    
    // Internal wires for connecting inner modules
    wire w_1Hz;
    wire [7:0] w_count;
	 wire [11:0] w_bcd;
	  // Instantiate inner design modules
    oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset(reset), .clk_1Hz(w_1Hz));
    
    digits digs(.clk_1Hz(w_1Hz), .reset(reset), .updown(updown), .count(w_count));
	 
	 bintobcd bcd_code(.count(w_count), .bcd(w_bcd));
    
    seg7_control seg7(.clk_50MHz(clk_50MHz), .reset(reset), .bcd(w_bcd), .seg(seg), .digit(digit));
	 
  
endmodule
