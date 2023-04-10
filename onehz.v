module onehz(clk_50M,clk);
input clk_50M; //50Mhz clock 
output reg clk;
reg [27:0] counter;

initial begin
counter <= 28'h0000000;
clk=0;
end

always@(posedge clk_50M)
begin
    counter<=counter + 28'h0000001; // Adding one at every clock pulse
    if (counter>28'h17D7840) // If count value reaches to 25M
    begin
    
        counter<=28'h0000000; // reset the counter
        clk <= ~clk; // and invert the clock pulse level
    end
 end


endmodule
