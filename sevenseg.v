module sevensmt(bcd,digit,seg);
input [3:0] bcd; 
input [3:0] digit;
output[7:0] seg;    
reg [7:0] seg;      
 
assign digit = 4'b1111;

always @ (bcd)      
begin
case(bcd)   
           4'b0000: seg = 8'b00000011;   
            4'b0001: seg = 8'b10011111;   
            4'b0010: seg = 8'b00100101;   
            4'b0011: seg = 8'b00001101;   
            4'b0100: seg = 8'b10011001;   
            4'b0101: seg = 8'b01001001;  
            4'b0110: seg = 8'b01000001;   
            4'b0111: seg = 8'b00011111;   
            4'b1000: seg = 8'b00000001;   
            4'b1001: seg = 8'b00001001;   
            4'b1010: seg=8'b11011011;
            4'b1011: seg=8'b11011011; 
	    4'b1100: seg=8'b11011011; 
	    4'b1101: seg=8'b11011011; 
	    4'b1110: seg=8'b11011011;
            4'b1111: seg=8'b11011011; 				
			
        endcase
		  end

endmodule
