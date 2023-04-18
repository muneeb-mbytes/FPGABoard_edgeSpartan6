module debouncer(
input button,
input clk,
input reset,
output result
    );

/************************************* Internal Variables **********************************/    
//wire result;
wire Q1;
wire Q2;
wire EN1;
wire EN2;
wire xor_out;
/****************************** Debounce ckt Implementation code ****************************************/

DFF FF1 (button,clk,reset,1'b1,Q1);
DFF FF2 (Q1,clk,reset, 1'b1,Q2);
     
xor g1 (xor_out,Q1,Q2);

counter C1 (clk,xor_out,~c,c);     
DFF FF3 (Q2,clk,~c, c,result);

endmodule


/***************************************** N-bit counter *************************************/
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
                                    if (Cout == N) 
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

module DFF(input D,input clk, input reset, input EN ,output Q);
reg temp;
            always @(posedge clk) 
                    begin
                      if(reset) begin
                        temp <=0;
                        $monitor($time,"Inside reset temp = %0d", temp);
                      end
                      else begin
                        if(EN)
                                begin
                                   temp <= D; 
                                end 
										  else
										  temp<=temp;
                    end  
                        $monitor($time,"Inside temp = %0d", temp);
                  end
assign 	Q=temp;					  
endmodule

      
