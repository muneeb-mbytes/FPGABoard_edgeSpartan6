module statedetect(start,stop,load,reset,clk,state);
input start,stop,load,reset,clk;
output reg [1:0] state;

always@(posedge clk)
begin
if(reset)
   state=2'b00;
else if (load)
	state=2'b01;
else if (start)
	state=2'b10;
else if (stop)
	state=2'b11;
end

endmodule
