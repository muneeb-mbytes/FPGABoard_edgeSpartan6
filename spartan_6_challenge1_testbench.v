module counter_testbench();
reg clk, reset,load,updown, start, stop;
wire [7:0] count;

udcounter dut(clk, reset, load, updown, count, start, stop);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#10;
updown=0;
reset=0;
load=0;
start=1;			//Start is always on(and hence level based)
stop=0;
#100;
stop=1;			//Stop is an interrupt(level based)
#100;
stop=0;
#100;
reset=1;
#10;
reset=0;
#990;
load=1;			//load is edge triggered
#10;
load=0;
#110;
updown=1;		//updown is level triggered(switch)
#990;
load=1;
#10;
load=0;
end
endmodule
