`timescale 1ns / 1ps

module digits(
    input clk_1Hz,
    input reset,
	 input updown,
    output reg [7:0] count
    );
    // ones reg control
    always @(posedge clk_1Hz or posedge reset) 
    begin
	 if(updown)
	  begin
          if(reset)
            count[3:0] <= 4'b0000;	 				
          else
            if(count[3:0] == 4'b1001)
                count[3:0] <= 4'b0000;
            else
                count[3:0] <= count[3:0] + 4'b0001;
	 end
	else
	 begin
          if(reset)
            count[3:0] <= 4'b1001;	 				
          else
            if(count[3:0] == 4'b0000)
                count[3:0] <= 4'b1001;
            else
                count[3:0] <= count[3:0] - 4'b0001;
	 end
	
	end
    // tens reg control       
    always @(posedge clk_1Hz or posedge reset)
	 begin 
	 if(updown)
	  begin
        if(reset) begin
            count[7:4] <= 4'b0000;
			 end
			else
            if(count[3:0] == 4'b1001) begin
                if(count[7:4] == 4'b1001)
		            begin
                    count[7:4] <= 4'b0000;
		            end                   
                 else
                    count[7:4] <= count[7:4] + 4'b0001;
				end
		 end
		else
		 begin
        if(reset) begin
            count[7:4] <= 4'b1001;
			 end
			else
            if(count[3:0] == 4'b0000) begin
                if(count[7:4] == 4'b0000)
		            begin
                    count[7:4] <= 4'b1001;
		            end                   
                 else
                    count[7:4] <= count[7:4] - 4'b0001;
				end
		  end
		 end
  
	  endmodule

  
