module yu;

 // Inputs
 reg Clk;
 reg reset;
 reg UpOrDown;
 reg load;
 reg stop;
 reg start;

 // Outputs
 wire [6:0] Count;
 wire buz;

 // Instantiate the Unit Under Test (UUT)
 upordown uut (
  .Clk(Clk), 
  .reset(reset), 
  .UpOrDown(UpOrDown), 
  .load(load), 
  .stop(stop), 
  .start(start), 
  .Count(Count), 
  .buz(buz)
 );
initial Clk = 0; 
    always #2 Clk = ~Clk;
 initial begin
  start=1; reset = 0;
        UpOrDown = 0;
        #50;
    start=0;stop=1;
        #50;
    start=1;stop=0;
    #50;
reset=1;
#50
reset=0;
#50;
load=1;
#50;
load=0;
    
 
        
    #100; 
  UpOrDown = 1;
        #50;
        reset = 1;
#50;
reset=0;
#50
load=1;
#50
load=0;

#50;
    start=0;stop=1;
        #50;
    start=1;stop=0;

    
 end
initial begin
$monitor($time," %d %d %d %d %d %d %d",start,UpOrDown,reset,load,stop,buz,Count); 
end
      
endmodule
