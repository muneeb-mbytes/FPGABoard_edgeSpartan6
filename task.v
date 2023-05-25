module buzz(state_detect,clk_1Hz,a,b,c,d,buzzout,clk_50MHz,reset_button);
input clk_50MHz;
  input reset_button;
  input clk_1Hz;

wire clk_1,clk2,clk3,clk4;
input a,b,c,d;
output reg buzzout;
output reg state_detect;
	always@(posedge clk_50MHz)
begin
if (a)
state_detect<=2'b00;
else if (b)
state_detect<=2'b01;
else if (c)
state_detect<=2'b10;
else if (d)
state_detect<=2'b11;
end
oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_1Hz(clk_1));
five rt(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_five(clk2));
three gh(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_three(clk3));
four z1(.clk_50MHz(clk_50MHz), .reset_button(reset_button), .clk_four(clk4));
always@(posedge clk_50MHz)
case(state_detect)
2'b00:buzzout=clk_1;
2'b01:buzzout=clk2;
2'b10: buzzout=clk3;
2'b11:buzzout=clk4;
endcase
endmodule


module oneHz_gen(
    input clk_50MHz,
    input reset_button,
    output clk_1Hz
    );

    reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
    reg clk_out_reg = 0;

    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 5220000) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;

    assign clk_1Hz = clk_out_reg;

endmodule

module five(
    input clk_50MHz,
    input reset_button,
    output clk_five
    );

    reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
    reg clk_out_reg = 0;

    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 10465000) begin  // 50MHz / 1Hz / 2 = 25,000,000
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;

    assign clk_five = clk_out_reg;

endmodule
module three(
    input clk_50MHz,
    input reset_button,
    output clk_three
    );

    reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
    reg clk_out_reg = 0;

    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 6592600) begin  // 50MHz / 1Hz / 2 = 25,000,000
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;

    assign clk_three = clk_out_reg;

endmodule

module four(
    input clk_50MHz,
    input reset_button,
    output clk_four
    );

    reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
    reg clk_out_reg = 0;

    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 8800000) begin  // 50MHz / 1Hz / 2 = 25,000,000
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;

    assign clk_four = clk_out_reg;

endmodule
