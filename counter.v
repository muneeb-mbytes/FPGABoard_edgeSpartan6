module upordown(
    input wire Clk,
    input wire reset,
    input wire UpOrDown,
    input wire load,
    input wire stop,
    input wire start,
    output [6:0] Count,output buz
  
);
reg buz;
reg [6:0] Count = 7'd0;
reg [31:0] clkdiv ;
always@(posedge Clk)
clkdiv=clkdiv + 1;

always @(posedge clkdiv[25])
 begin
    if (stop) begin
        Count <= Count;buz<=1'd0;
    end

  else if (UpOrDown && start) begin // Up mode selected
  
  if (Count == 7'd99) begin
            Count <= 7'd0;buz<=1'd1;
        end else if (load) begin
            Count <= 7'd90;buz<=1'd0;
        end else if (reset) begin
            Count <= 7'd0;buz<=1'd0;
        end else begin
            Count <= Count + 1;buz<=1'd0;
        end
    end else if (!UpOrDown && start) begin // Down mode selected
        if (Count == 7'd0) begin
            Count <= 7'd99;buz<=1'd1;
        end else if (load) begin
            Count <= 7'd10;buz<=1'd0;
        end else if (reset) begin
            Count <= 7'd99;buz<=1'd0;
        end else begin
            Count <= Count - 1;buz<=1'd0;
     end
    end
end


   

endmodule
