`timescale 1ns / 1ps
//State detect to hold the value as high when push button is pressed
module statedetect(result_start,result_stop,clk_50MHz,state);
input result_start,result_stop,clk_50MHz; //input buttons after passing through debouncer circuit
output reg state;

always@(posedge clk_50MHz)
begin
if(result_start)
   state=1'b0;
else if (result_stop)
	state=1'b1;
end

endmodule 