module buzzer(clk,roll);
input clk;
output reg roll;

always@(posedge clk)
begin 
if(roll)
roll<=1'b0;
end
endmodule
