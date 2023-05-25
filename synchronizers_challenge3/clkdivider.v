module two_six_one(
    input clk_50MHz,
    input reset_button,
    output clk_261Hz
    );
    
    reg [25:0] ctr_reg = 0;                
    reg clk_out_reg = 0;
    
    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 95000) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_261Hz = clk_out_reg;
    
endmodule

module three_two_nine(
    input clk_50MHz,
    input reset_button,
    output clk_329Hz
    );
    
    reg [25:0] ctr_reg = 0;                
    reg clk_out_reg = 0;
    
    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 75750) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_329Hz = clk_out_reg;
    
endmodule

module four_one_five(
    input clk_50MHz,
    input reset_button,
    output clk_415Hz
    );
    
    reg [25:0] ctr_reg = 0;                
    reg clk_out_reg = 0;
    
    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 60000) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_415Hz = clk_out_reg;
    
endmodule


module five_two_three(
    input clk_50MHz,
    input reset_button,
    output clk_523Hz
    );
    
    reg [25:0] ctr_reg = 0;                
    reg clk_out_reg = 0;
    
    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 47750) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_523Hz = clk_out_reg;
    
endmodule
