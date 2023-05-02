module debouncer(
	input on,
	input off,
	input err,
	input open,
	input buzzer,
	input clk_50MHz,
	//input reset,
	output result_on,
	output result_off,
	output result_err,
	output result_open,
	output result_buzzer
	);
		 /***** Internal Variables ****/    
	//wire result;
	wire Q1_1;
	wire Q2_1;
	wire EN1;
	wire EN2;
	wire xor_out_1;
	/**/
	wire Q1_2;
	wire Q2_2;
	wire xor_out_2;
	
	/**/
	wire Q1_3;
	wire Q2_3;
	wire xor_out_3;
	
	/**/
	wire Q1_4;
	wire Q2_4;
	wire xor_out_4;
	
	wire Q1_5;
	wire Q2_5;
	wire xor_out_5;
	/**** Debounce ckt Implementation code ******/
	
	DFF FF1_1 (on,clk_50MHz,reset,1'b1,Q1_1);
	DFF FF2_1 (Q1_1,clk_50MHz,reset, 1'b1,Q2_1);
	     
	xor g1_1 (xor_out_1,Q1_1,Q2_1);
	
	counter C1_1 (clk_50MHz,xor_out_1,~c_1,c_1);     
	DFF FF3_1 (Q2_1,clk_50MHz,reset, c_1,result_on);
	/*******/	
	DFF FF1_2 (off,clk_50MHz,reset,1'b1,Q1_2);
	DFF FF2_2 (Q1_2,clk_50MHz,reset, 1'b1,Q2_2);
	     
	xor g1_2 (xor_out_2,Q1_2,Q2_2);
	
	counter C1_2 (clk_50MHz,xor_out_2,~c_2,c_2);     
	DFF FF3_2 (Q2_2,clk_50MHz,reset, c_2,result_off);
	/******/		
	DFF FF1_3 (err,clk_50MHz,reset,1'b1,Q1_3);
	DFF FF2_3 (Q1_3,clk_50MHz,reset, 1'b1,Q2_3);
	     
	xor g1_3 (xor_out_3,Q1_3,Q2_3);
	
	counter C1_3 (clk_50MHz,xor_out_3,~c_3,c_3);     
	DFF FF3_3 (Q2_3,clk_50MHz,reset, c_3,result_err);
	/******/		
	DFF FF1_4 (open,clk_50MHz,reset,1'b1,Q1_4);
	DFF FF2_4 (Q1_4,clk_50MHz,reset, 1'b1,Q2_4);
	     
	xor g1_4 (xor_out_4,Q1_4,Q2_4);
	
	counter C1_4 (clk_50MHz,xor_out_4,~c_4,c_4);     
	DFF FF3_4 (Q2_5,clk_50MHz,reset, c_4,result_open);
	/******/
	DFF FF1_5 (buzzer,clk_50MHz,reset,1'b1,Q1_5);
	DFF FF2_5 (Q1_5,clk_50MHz,reset, 1'b1,Q2_5);
	     
	xor g1_5 (xor_out_5,Q1_5,Q2_5);
	
	counter C1_5 (clk_50MHz,xor_out_5,~c_5,c_5);     
	DFF FF3_5 (Q2_5,clk_50MHz,reset, c_5,result_buzzer);
	
	endmodule
	/***** N-bit counter *****/
	 module counter (clk, SCLR,EN,c);
	     input clk;
	     input SCLR;   // Clear of counter //
	     input EN ; // Active 'HIGH' Enable //
	     reg [5:0] Cout; // Counter Output //
	     output reg c; 
	         parameter N = 5;
	
	            always@(posedge clk)
	                    if(SCLR) 
	                        begin
							  Cout <= 5'd0;
							  c<=1'd0;
							  end
	                        else if (EN)    
	                            begin
	                                    if (Cout == 5) 
	                                    begin
	                                            c<=1'd1;
	                                            Cout <= 5'd0;
	                                    end 
													 else
	                                    begin
	                                            Cout <= Cout + 1'd1;
	                                            c<=1'd0;
	                                    end
	                            end
	                    
	endmodule     
	 
	// D Flip Flop Module (with Enable)
	
	module DFF(input D,input clk, input reset_button, input EN ,output Q);
	reg temp;
	always @(posedge clk) 
	                    begin
	                      if(reset_button) begin
	                        temp <=0;
	                      end
	                      else begin
	                        if(EN)
	                                begin
	                                   temp <= D; 
	                                end 
											  else
											  temp<=temp;
	                    end  
	                  end
	assign 	Q=temp;					  
	endmodule
