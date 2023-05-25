
module digits(
    input clk_261Hz,
	 input clk_329Hz,
	 input clk_415Hz,
	 input clk_523Hz,
    //input result_reset,
	 //input updown,
	 input result_load,
	 input [1:0] state,
	 output reg buzzer
   // output reg [15:0] count
    );
	 reg temp;
	 if (state==2'b00)
	 always @(posedge clk_261Hz )
	 buzzer<=1;
//begin
//if (state==2'b00)
   else if (state==2'b01)
	 always @(posedge clk_329Hz )
	 buzzer<=1;
	 else if (state==2'b10)
	 always @(posedge clk_415Hz )
	 buzzer<=1;
	 else if (state==2'b11)
	 always @(posedge clk_523Hz )
	 buzzer<=1;

//else if (state==2'b01)
//buzzer<=1;
//else if (state==2'b10)
//buzzer<=1;
//else if (state==2'b11)
//buzzer<=1;
//end


endmodule
