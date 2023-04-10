`timescale 1ns / 1ps
//
module pushbutton_debouncer (
  input pb,
input clk,  // input pushbutton signal
  output reg pb_db // debounced pushbutton signal
   // number of clock cycles to debounce for
);

reg [7:0] debounce_count;
parameter debounce_cycles = 10 ;
  always @(posedge clk) begin
    if (pb == 1) begin
      if (debounce_count < debounce_cycles) begin
		debounce_count <= debounce_count + 1;
      end else begin
        pb_db <= 1;
        debounce_count <= 0;
      end
    end else begin
      pb_db <= 0;
      debounce_count <= 0;
    end
  end
  endmodule
module updown_counter
(
    input  clk,
    input  rst_n,
    input  up_down,
    output  [6:0] count,
	 input start, input stop, input load, 
	//  input [7:0] decimal,
    output [6:0] bcd,
	 output reg [6:0] seg_display,
	 
	 
    //output reg [6:0] seg2,
	 //buzzer 
	 output reg  buzzer
);
reg [3:0] bcd_digit1;
reg [3:0] bcd_digit2;
reg display_mux;
reg [24:0] timer;
reg [3:0] anode=4'b1100;

reg [3:0] digit1, digit2;  //rem and quo


////reg count_enable_reg;
	reg [3:0] digit_sel;    // digit selection signal
reg count_enable;
//	reg [3:0] val1 ;
//	reg [3:0] val2;
	reg [1:0] anode_sel;
	wire start_db, stop_db, load_db;
wire pb_db,pb_db_prev;

pushbutton_debouncer pb_db_inst (
  .pb(pb),
  .pb_db(pb_db)
);
assign start_db = pb_db & ~pb_db_prev;
assign stop_db = pb_db & pb_db_prev;
assign load_db = pb_db & pb_db_prev;
 reg [6:0] count_reg;


//clk divider
reg [31:0] clkdiv = 32'd0;
always @ (posedge clk)	 
clkdiv = clkdiv +1;

always @(posedge clkdiv[24] or posedge rst_n ) begin
  if (up_down) begin
    if (load_db) begin
      count_reg <= 7'd90;
    end else if (rst_n) begin
      count_reg <= 7'd0;
    end else if (start_db) begin
      if (count_reg == 7'd99) begin
        count_reg <= 7'd0;
        buzzer <= 1'b1;
		  #10;
        buzzer <= 1'b0;
		  end else begin
        count_reg <= count_reg + 7'd1;
      end
    end else if (stop_db) begin
      count_reg <= count_reg + 0;
    end
  end else begin
   if (load_db) begin
      count_reg <= 7'd10;
    end else if (rst_n) begin
      count_reg <= 7'd99;
		    end else if (start_db) begin
      if (count_reg == 7'd0) begin
        count_reg <= 7'd99;
        buzzer <= 1'b1;
        #10;
        buzzer <= 1'b0;
		  end else begin
        count_reg <= count_reg - 7'd1;
      end
    end 
	 else if (stop_db) begin
      count_reg <= count_reg + 0;
   end
  end
end

 assign count = count_reg;
  always @(*) begin
    digit1 = count_reg % 10;   //rem
    digit2 = count_reg / 10;    //quotient
end
assign bcd = {digit2, digit1}; //assign bcd=quo rem
//multiplexing and display the output
always @ (digit1 or digit2 or display_mux) begin
    if (display_mux == 0) begin // first display block
        bcd_digit1 = digit1[3:0];
        case (bcd_digit1)
		   4'd0: seg_display[6:0] = 7'b0000001; // 0
            4'd1: seg_display[6:0] = 7'b1001111; // 1
            4'd2: seg_display[6:0] = 7'b0010010; // 2
            4'd3: seg_display[6:0] = 7'b0000110; // 3
            4'd4: seg_display[6:0] = 7'b1001100; // 4
            4'd5: seg_display[6:0] = 7'b0100100; // 5
				4'd6: seg_display[6:0] = 7'b0100000; // 6
            4'd7: seg_display[6:0] = 7'b0001111; // 7
            4'd8: seg_display[6:0] = 7'b0000000; // 8
            4'd9: seg_display[6:0] = 7'b0000100; // 9
            default: seg_display[6:0] = 7'b1111111; // blank
        endcase
		//  seg_display[7] = 1'b0; // decimal point (optional)
    end
    else begin // second display block
        bcd_digit2 = digit2[3:0];
        case (bcd_digit2)
		  4'd0: seg_display[6:0] = 7'b0000001; // 0
            4'd1: seg_display[6:0] = 7'b1001111; // 1
            4'd2: seg_display[6:0] = 7'b0010010; // 2
            4'd3: seg_display[6:0] = 7'b0000110; // 3
            4'd4: seg_display[6:0] = 7'b1001100; // 4
            4'd5: seg_display[6:0] = 7'b0100100; // 5
				4'd6: seg_display[6:0] = 7'b0100000; // 6
            4'd7: seg_display[6:0] = 7'b0001111; // 7
            4'd8: seg_display[6:0] = 7'b0000000; // 8
            4'd9: seg_display[6:0] = 7'b0000100; // 9
            default: seg_display[6:0] = 7'b1111111; // blank
        endcase
	//	  seg_display[7] = 1'b0; // decimal point (optional)
    end
 end
endmodule
