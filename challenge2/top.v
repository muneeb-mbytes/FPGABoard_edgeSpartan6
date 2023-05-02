`timescale 1ns / 1ps

module top(
    input clk_50MHz,
    input reset,	 // from Basys 3
    input reset_button,
	 input on,
	 input off,
	 input err,
    input open,	 // btnC
	 input buzz,
	 output buzzer,
    output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit      // 7 segment display anodes
    );
    
    // Internal wires for connecting inner modules
   // wire w_1Hz;
   // wire [7:0] w_count;
	// wire [7:0] w_bcd;
	 wire w_result_on, w_result_off, w_result_err, w_result_open, w_state;
	  // Instantiate inner design modules
 //   oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_1Hz(w_1Hz));
	 
	 debouncer db(.on(on), .off(off), .err(err), .open(open), .clk_50MHz(clk_50MHz), 
	              .reset(reset), .result_on(w_result_on), .result_off(w_result_off), .result_err(w_result_err), .result_open(w_result_open));
    
	 statedetect sd(.result_on(w_result_on), .result_off(w_result_off),.result_err(w_result_err), .result_open(w_result_open), .clk_50MHz(clk_50MHz), .state(w_state));
    
	// digits digs(.clk_1Hz(w_1Hz), .result_reset(w_result_reset), .updown(updown), .result_load(w_result_load), .state(w_state), .buzzer(buzzer), .count(w_count));
	 
	// bintobcd bcd_code(.count(w_count), .bcd(w_bcd));
    
    seg7_control seg7(.clk_50MHz(clk_50MHz), .reset_button(reset_button),.result_on(w_result_on), .result_off(w_result_off),.result_err(w_result_err), .result_open(w_result_open),.seg(seg), .digit(digit));
	 
  
endmodule

