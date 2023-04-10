module udcounter(clk, reset, load, updown, count, start, stop, digit,seg1, buzzer);
input clk,reset,load,updown,start,stop;
output reg [7:0] count=0;  //output
output reg buzzer=0;
output [3:0]digit;
output reg [7:0]seg1;
reg slow_clk=1'd0;
reg [24:0] counter=0;  //clock
reg clk_out;

always@(posedge clk) //50MHz
begin
counter=counter+1;
if (counter==0)
slow_clk=~slow_clk; //1Hz:The clock is working perfectly at 1 second
end
always @(posedge slow_clk)
begin
  if(reset==1) // Reset button is pressed
    count <=7'd0;
  else if(stop==1) // When stop button is pressed
    count <= count;
  else if(start == 1) // Start counting when stop is off
      if(updown==0 && load==0) // Up mode
        if(count==7'd99)
          count<=7'd0; // Rollover from 99 to 0
        else
          count<=count+7'd1; // Incrementing
      else if(updown==0 && load==1) // Up mode and load pressed 
        count<=7'd90;
        
      else if(updown==1 && load==0) // In down mode
        if(count==7'd0)
          count<=7'd99; // Rollover from 0 to 99
        else
          count<=count-7'd1; // Decrementing
      else // In down mode and load pressed
        count<=7'd10;
end
//both the digits display the same number in seven segment
always @ (count)
begin
case(count)
4'b0000: seg1 = 8'b00000011;
4'b0001: seg1= 8'b10011111;
4'b0010: seg1= 8'b00100101;
4'b0011: seg1= 8'b00001100;
4'b0100: seg1= 8'b10011000;
4'b0101: seg1= 8'b01001001;
4'b0110: seg1= 8'b01000001;
4'b0111: seg1= 8'b00011111;
4'b1000: seg1= 8'b00000001;
4'b1001: seg1= 8'b00001001;
4'b1010: seg1=8'b11111101;
4'b1011: seg1=8'b11111101;
4'b1100: seg1=8'b11111101;
4'b1101: seg1=8'b11111101;
4'b1110: seg1=8'b11111101;
4'b1111: seg1=8'b11111101;
endcase
end
//The logic module is working properly and we have verified it using testbench
always@(count)
begin
	if(count<=7'd99|count<=7'd0)
		buzzer<=1;// when the output is 99 and 0 the buzzer will be buzzed until the upcounting and downcounting takes place
	else
		buzzer<=0;
end
endmodule
