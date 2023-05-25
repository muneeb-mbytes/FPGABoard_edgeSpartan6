`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:19 05/25/2023 
// Design Name: 
// Module Name:    toppp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
/////////////////////////////////////////////////////////////////////////////////

module oneHz_gen(
    input clk_50MHz,
    output clk_1Hz,
	 output reg buzzer
	
    );
    
    reg [25:0] ctr_reg = 0;                 // 26 bits to cover 25000000
    reg clk_out_reg = 0;
	 parameter freq1=261,freq2=523,freq3=349;

    
    always @(posedge clk_50MHz)
    
		  begin
		  if(freq1)
		  begin
            if(ctr_reg ==47892) begin  // 50MHz / 261Hz / 2 = 25,000,000
                ctr_reg <= 0;
					 buzzer<=1'b1;
					 end
				else
				begin
                clk_out_reg <= ~clk_out_reg;
					 buzzer<=1'b0;
				
            end
				end
				else if(freq2)
				begin
				if(ctr_reg == 47801) begin  // 50MHz / 523Hz / 2 = 25,000,000
                ctr_reg <= 0;
				    buzzer<=1'b1;
					 end
			   else
					 begin
                clk_out_reg <= ~clk_out_reg;
					 buzzer<=1'b0;
					 end
            end
				else if(freq3)
				begin
				if(ctr_reg == 71633) begin  // 50MHz / 349Hz / 2 = 25,000,000
                ctr_reg <= 0;
					 buzzer<=1'b1;
					 end
					 else
					 begin
                clk_out_reg <= ~clk_out_reg;
					 buzzer<=1'b0;
					 end
					 end
		
            else 
                ctr_reg <= ctr_reg + 1;
   end 
    assign clk_1Hz = clk_out_reg;
  
endmodule
