`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:39:15 05/02/2023 
// Design Name: 
// Module Name:    challenge 
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
module challenge(
    input clk,
    input buzz,
	 input [2:0] state,
    output reg [7:0] seg,       // segment pattern 0-9
    output reg [3:0] digit,
    output reg buzzer	 );
	 reg [27:0] count;
	 reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
	 parameter E=  8'b01100001;
    parameter F = 8'b01110001;
    parameter n = 8'b00010011;
    parameter O = 8'b00000011;
    parameter P = 8'b00110001;
    parameter r = 8'b11110101;
	 parameter letter = 8'b11111101;
	always @(posedge clk)
	begin
	if(digit_timer == 49_999) begin         // The period of 50MHz clock is 20ns (1/(50*1,000,000) seconds)
                digit_timer <= 0;                   // 20ns x 50,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
	 always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b1000;   // Turn on thousands digit
        endcase
    end
	always @(posedge clk)
	begin
	if(buzz)
	begin
	buzzer = 1'b1;
	count = 100000000;
	end
	else if(count>0)
	begin
	  count = count - 1;
	  if(count == 0)
	    buzzer = 0;
	end
	case(digit_select)
   2'b00 : begin    
	case(state)
	3'b001: seg = r;
	3'b010: seg = letter;
	3'b011: seg = F;
	3'b100: seg = n;
	endcase
	end
	
	2'b01 : begin
	case(state)
	3'b001: seg = r;
	3'b010: seg = n;
	3'b011: seg = F;
	3'b100: seg = E;
	endcase
	end
	
	2'b10: begin
	case(state)
	3'b001: seg = E;
	3'b010: seg = O;
	3'b011: seg = O;
	3'b100: seg = P;
	endcase
	end
	
	2'b11: begin
	case(state)
	3'b001: seg = letter;
	3'b010: seg = letter;
	3'b011: seg = letter;
	3'b100: seg = O;
	endcase
	end
	endcase
end
endmodule
