`timescale 1ns / 1ps
//State detect to hold the value as high when push button is pressed
module statedetect(result_c4,result_e4,clk_50MHz,state,result_ab4,result_c5);
input result_c4,result_e4,clk_50MHz,result_ab4,result_c5;
 //input buttons after passing through debouncer circuit
output reg [1:0] state;

always@(posedge clk_50MHz)
begin
if(result_c4)
   state=2'b00;
else if (result_e4)
	state=2'b01;
else if (result_ab4)
           state=2'b10;
else if(result_c5)
          state=2'b11;
end

endmodule
