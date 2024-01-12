`timescale 1ns / 1ps


module top(
    input clk_50MHz,       // from Edge Spartan 6
    input reset, 
    input updown,        	 
    output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit      // 7 segment display cathodes
    );
    
    // Internal wires for connecting inner modules
    wire w_1Hz;
    wire [7:0] w_count;
	  // Instantiate inner design modules
    oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset(reset), .clk_1Hz(w_1Hz));
    
    digits digs(.clk_1Hz(w_1Hz), .reset(reset), .updown(updown), .count(w_count));
    
    seg7_control seg7(.clk_50MHz(clk_50MHz), .reset(reset), .count(w_count), .seg(seg), .digit(digit));
  
endmodule
