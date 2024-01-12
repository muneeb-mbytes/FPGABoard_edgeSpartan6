`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:44:45 04/18/2023 
// Design Name: 
// Module Name:    count1 
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
module digits(
    input clk_1Hz,
    input reset,
	 input updown,
	 input stop,
	 input start,
	 input load,
    output reg [6:0] count
    );
	 always @(posedge clk_1Hz or posedge reset)
begin
    if(reset==1) begin
     if(updown)
      count <= 7'd99;
     else		// Reset button is pressed
    count <=7'd0;
	 end
   else if(stop==1) // When stop button is pressed
    count <= count;
    else if(start == 1) // Start counting when stop is off
      if(updown==0 && load==0) // Up mode
        if(count==7'd99)
          count<=7'd0; // Rollover from 99 to 0
        else
		    count<=count+7'd1;
				// Incrementing
      else if(updown==0 && load==1) // Up mode and load pressed 
        count<=7'd90;

      else if(updown==1 && load==0)
			// In down mode
        if(count==7'd0)
          count<=7'd99; // Rollover from 0 to 99
        else
          count<=count-7'd1; // Decrementing
      else // In down mode and load pressed
        count<=7'd10;
end
endmodule
