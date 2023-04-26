`timescale 1ns / 1ps

module top(
    input clk_50MHz,          //Inbuilt clock of Edge Spartan 6
    input reset,	 
    input reset_button,
	 input start,
	 input stop,
	 input load,
    input updown,	           //mode control
	 output buzzer,
    output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit      // 7 segment display anodes
    );
    
    // Internal wires for connecting inner modules
    wire w_1Hz;
    wire [7:0] w_count;
	 wire [11:0] w_bcd;
	 wire w_result_reset, w_result_start, w_result_stop, w_result_load, w_state;
	  // Instantiate inner design modules
    oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_1Hz(w_1Hz));
	 
	 debouncer db(.start(start), .stop(stop), .load(load), .reset_button(reset_button), .clk_50MHz(clk_50MHz), 
	              .reset(reset), .result_start(w_result_start), .result_stop(w_result_stop), .result_load(w_result_load), .result_reset(w_result_reset));
    
	 statedetect sd(.result_start(w_result_start), .result_stop(w_result_stop), .clk_50MHz(clk_50MHz), .state(w_state));
    
	 digits digs(.clk_1Hz(w_1Hz), .result_reset(w_result_reset), .updown(updown), .result_load(w_result_load), .state(w_state), .buzzer(buzzer), .count(w_count));
	 
	 bintobcd bcd_code(.count(w_count), .bcd(w_bcd));
    
    seg7_control seg7(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .bcd(w_bcd), .seg(seg), .digit(digit));
	 
  
endmodule
