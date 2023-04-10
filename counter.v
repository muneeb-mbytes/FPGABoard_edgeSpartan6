module counter(clk,count,ud,state,roll);
input clk,ud;
input [1:0] state;
output reg [6:0] count;
output reg roll;

always@(posedge clk)
begin
if(ud)   //up counting
begin
if(state==2'b00)   //reset
count<=7'd0;
else if(state==2'b01) //load
count<=7'd90;
else if(state==2'b10)  //start counting
begin
count<=count+7'd1;
if(count>7'd99)
begin
count<=7'd0; 
 roll<=1'b1;//rollover

end
end
else
count<=count;  //stop mode
end
else  //down counting
begin
if(state==2'b00)  //reset
count<=7'd99;
else if(state==2'b01)  //load
count<=7'd10;
else if(state==2'b10)  //start
begin
count<=count-7'd1;
if(count>7'd0)
begin
count<=7'd99;
roll<=1'b1;//rollover
end  
end
else
count<=count;
end
end


endmodule
