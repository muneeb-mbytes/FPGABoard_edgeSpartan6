`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:50 05/02/2023 
// Design Name: 
// Module Name:    superdisplay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module superdisplay(
    input err,
    input off,
    input on,
    input open,
    input sound,
	 input clk,
	 input [3:0] digit,
    output [7:0] segment,
    output buzzer
    );
	 
	 wire de_err;
	 wire de_off;
	 wire de_on;
	 wire de_open;
	 wire de_sound;
	 wire state;
	 reg [15:0] refresh_counter;
	 wire [1:0] segstate;
    reg [3:0] regdigit;
	 
debouncer d1 (.button(err),.clk(clk),.result(de_err));
debouncer d2 (.button(off),.clk(clk),.result(de_off));
debouncer d3 (.button(on),.clk(clk),.result(de_on));
debouncer d4 (.button(open),.clk(clk),.result(de_open));
debouncer d5 (.button(sound),.clk(clk),.result(de_sound));

statedetect s1 (.clk(clk),.s1(de_err),.s2(de_off),.s3(de_on),.s4(de_open),.s5(de_sound),.state(state));

always@(posedge clk)
begin
refresh_counter<=refresh_counter+1;
assign segstate=refresh_counter[15:16];
end
always@(*)
begin
case(state)
		  3'b000: begin//error
			case(segstate)
			begin
			2'b00:begin
			regdigit=4'b0001;//add segvalues
			      end
			2'b01:begin
			regdigit=4'b0010;
			end
			2'b10:begin
			regdigit=4'b0100;
			end
			2'b11: begin
			regdigit=4'b1000;
			end
			endcase
		3'b001:begin//off
			case(segstate)
			begin
			2'b00:begin
			regdigit=4'b0001;//add segvalues
			      end
			2'b01:begin
			regdigit=4'b0010;
			end
			2'b10:begin
			regdigit=4'b0100;
			end
			2'b11: begin
			regdigit=4'b1000;
			end
			endcase
		3'b010:begin//on
			case(segstate)
			begin
			2'b00:begin
			regdigit=4'b0001;//add segvalues
			      end
			2'b01:begin
			regdigit=4'b0010;
			end
			2'b10:begin
			regdigit=4'b0100;
			end
			2'b11: begin
			regdigit=4'b1000;
			end
			endcase
		  		  3'b011: begin      //open
		  	case(segstate)
						2'b00:begin
			regdigit=4'b0001;//add segvalues
			      end
			2'b01:begin
			regdigit=4'b0010;
			end
			2'b10:begin
			regdigit=4'b0100;
			end
			2'b11: begin
			regdigit=4'b1000;
			end
			endcase
		  end
		  3'b100: begin      //sound
		  	case(segstate)
			begin
			2'b00:begin
			regdigit=4'b0001;//add segvalues
			      end
			2'b01:begin
			regdigit=4'b0010;
			end
			2'b10:begin
			regdigit=4'b0100;
			end
			2'b11: begin
			regdigit=4'b1000;
			end
			endcase
		  end
		  
		 
endcase
end

endmodule

