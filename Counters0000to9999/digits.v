`timescale 1ns / 1ps
//module of counter logic
module digits(
    input clk_1Hz,
    input result_reset,
	 input updown,
	 input result_load,
	 input state,
	 output reg buzzer,
    output reg [15:0] count
    );
	 reg temp;
	 always @(posedge clk_1Hz or posedge result_reset)
begin
    if(result_reset==1) begin                   //when reset is pressed
     if(updown==0)
      count <= 16'd9999;
     else		
    count <=0;
	 end
	 else if(temp>0) begin
	     temp <= temp - 1;
		  buzzer <= 0;
		  end
   else if(state==1'b1) begin                       // When stop button is pressed
    count <= count;
	 end
    else if(state == 1'b0) begin                     // Start counting when start is pressed
      if(updown==1 && result_load==0)          // Up mode
        if(count==16'd9999) begin
		    buzzer<=1'b1;                        // Rollover from 99 to 0
			 temp<=1;
          count<=16'd0; 
			 end
        else
		    count<=count+16'd1;
				// Incrementing
      else if(updown==1 && result_load==1)    // Up mode and load pressed 
        count<=16'd9990;

      else if(updown==0 && result_load==0)   // In down mode
        if(count==0)begin
		    buzzer<=1'b1;                      // Rollover from 0 to 99
			 temp<=1;
          count<=16'd9999; 
			 end
        else
          count<=count-16'd1;                // Decrementing
      else                                  // In down mode and load pressed
        count<=16'd10;
	end
end

endmodule
