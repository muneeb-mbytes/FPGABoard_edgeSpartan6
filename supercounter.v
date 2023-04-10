module supercounter(start,stop,reset,load,clk_50M,ud,digit,anode,rollover);
output reg [7:0] anode;
output reg rollover;
input [3:0] digit;
input start,stop,reset,load,clk_50M,ud;
wire clk; // 1Hz Clock signal
wire [6:0] count; //counter value
wire [15:0] seg;
wire [1:0] state;
reg [15:0] refresh_counter;
wire segstate;
wire roll;
reg [3:0] regdigit;



onehz inst1(.clk_50M(clk_50M),.clk(clk));  //one hertz clk generator
statedetect inst2(.start(start),.stop(stop),.load(load),.reset(reset),.clk(clk),.state(state));
counter inst3(.clk(clk),.count(count),.ud(ud),.state(state),.roll(roll));
buzzer inst4(.clk(clk),.roll(roll));
seg_decoder inst5(.bcd(count),.seg(seg));


always@(posedge clk_50M)
begin
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
end 

assign segstate = refresh_counter[15];

always@(*)
begin
case(segstate)
	1'b0 : begin
		   regdigit=4'b0001;  //Activate ones
			anode=seg[7:0];
			end
	1:b1 : begin
			regdigit=4'b0010;
			anode=seg[15:8];	//Activate tens
			end
endcase
end
assign digit=regdigit;
endmodule
