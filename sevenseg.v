module sevensmt(bcd,seg);
input [3:0] bcd;    
output[7:0] seg;    
reg [7:0] seg;      
     
always @ (bcd)      
begin
case(bcd)   
           4'b0000: seg = 8'b11000000;   
            4'b0001: seg = 8'b11111001;   
            4'b0010: seg = 8'b10100100;   
            4'b0011: seg = 8'b10110000;   
            4'b0100: seg = 8'b10011001;   
            4'b0101: seg = 8'b10010010;  
            4'b0110: seg = 8'b10000010;   
            4'b0111: seg = 8'b11111000;   
            4'b1000: seg = 8'b10000000;   
            4'b1001: seg = 8'b10010000;   
            4'b1010: seg=8'b11011011;
            4'b1011: seg=8'b11011011; 
				4'b1100: seg=8'b11011011; 
				4'b1101: seg=8'b11011011; 
				4'b1110: seg=8'b11011011;
            4'b1111: seg=8'b11011011; 				
			
        endcase
		  end

endmodule
