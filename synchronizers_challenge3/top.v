module top(
    input clk_50MHz,          //Inbuilt clock of Edge Spartan 6
    input reset,
	 input reset_button,
    input c5,
	 input c4,
	 input e4,
	 input ab4,
//    input updown,	           //mode control
	 output buzzer,
    output [7:0] seg,       // 7 segment display segment pattern
    output [3:0] digit      // 7 segment display anodes
    );
    
    // Internal wires for connecting inner modules
    wire w_261Hz;
	 wire w_329Hz;
	 wire w_415Hz;
	 wire w_523Hz;
    wire [15:0] w_count;
	 wire [15:0] w_bcd;
	 wire w_result_c5, w_result_c4, w_result_e4, w_result_ab4;
	 wire [1:0] w_state;
	  // Instantiate inner design modules
    two_six_one hz1(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_261Hz(w_261Hz));
	 three_two_nine hz2(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_329Hz(w_329Hz));
	 four_one_five hz3(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_415Hz(w_415Hz));
	 five_two_three hz4(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_523Hz(w_523Hz));
	 
	 debouncer db(.c4(c4), .e4(e4), .ab4(ab4), .c5(c5), .clk_50MHz(clk_50MHz), 
	              /.reset(reset),/ .result_c4(w_result_c4), .result_e4(w_result_e4), .result_ab4(w_result_ab4), .result_c5(w_result_c5));
    
	 statedetect sd(.result_c4(w_result_c4), .result_e4(w_result_e4),.result_ab4(w_result_ab4),.result_c5(w_result_c5), .clk_50MHz(clk_50MHz), .state(w_state));
    
	 digits digs(.clk_261Hz(w_261Hz),.clk_329Hz(w_329Hz),.clk_415Hz(w_415Hz),.clk_523Hz(w_523Hz),  .state(w_state), .buzzer(buzzer)/, .count(w_count)/);
	 
	
	 
  
endmodule
