module seg_decoder(bcd,seg);
input [6:0] bcd;
output reg [15:0] seg;

always @ (bcd)
begin
   case(bcd)
          0: seg = 16'b00000011_00000011; // "0"     
          1: seg = 16'b00000011_10011111; // "1" 
          2: seg = 16'b00000011_00100101; // "2" 
          3: seg = 16'b00000011_00001101; // "3" 
          4: seg = 16'b00000011_10011001; // "4" 
          5: seg = 16'b00000011_01001001; // "5" 
          6: seg = 16'b00000011_01000001; // "6" 
          7: seg= 16'b00000011_00011111; // "7" 
          8: seg = 16'b00000011_00000001; // "8"     
          9: seg = 16'b00000011_00001001; // "9"
          
          10: seg = 16'b10011111_00000011; // "10"     
          11: seg = 16'b10011111_10011111; // "11" 
          12: seg = 16'b10011111_00100101; // "12" 
          13: seg = 16'b10011111_00001101; // "13" 
          14: seg = 16'b10011111_10011001; // "14" 
          15: seg= 16'b10011111_01001001; // "15" 
          16: seg = 16'b10011111_01000001; // "16" 
          17: seg = 16'b10011111_00011111; // "17" 
          18: seg = 16'b10011111_00000001; // "18"     
          19: seg = 16'b10011111_00001001; // "19"
          
  
          20: seg = 16'b00100101_00000011; // "20"     
          21: seg = 16'b00100101_10011111; // "21" 
          22: seg = 16'b00100101_00100101; // "22" 
          23: seg = 16'b00100101_00001101; // "23" 
          24: seg = 16'b00100101_10011001; // "24" 
          25: seg = 16'b00100101_01001001; // "25" 
          26: seg = 16'b00100101_01000001; // "26" 
          27: seg = 16'b00100101_00011111; // "27" 
          28: seg = 16'b00100101_00000001; // "28"     
          29: seg = 16'b00100101_00001001; // "29"


          30: seg = 16'b00001101_00000011; // "10"     
          31: seg = 16'b00001101_10011111; // "11" 
          32: seg = 16'b00001101_00100101; // "12" 
          33: seg = 16'b00001101_00001101; // "13" 
          34: seg = 16'b00001101_10011001; // "16" 
          35: seg = 16'b00001101_01001001; // "15" 
          36: seg = 16'b00001101_01000001; // "16" 
          37: seg = 16'b00001101_00011111; // "17" 
          38: seg = 16'b00001101_00000001; // "18"     
          39: seg = 16'b00001101_00001001; // "19"

          40: seg = 16'b10011001_00000011; // "10"     
          41: seg = 16'b10011001_10011111; // "11" 
          42: seg = 16'b10011001_00100101; // "12" 
          43: seg = 16'b10011001_00001101; // "13" 
          44: seg = 16'b10011001_10011001; // "16" 
          45: seg = 16'b10011001_01001001; // "15" 
          46: seg = 16'b10011001_01000001; // "16" 
          47: seg = 16'b10011001_00011111; // "17" 
          48: seg = 16'b10011001_00000001; // "18"     
          49: seg = 16'b10011001_00001001; // "19"

          50: seg = 16'b01001001_00000011; // "10"     
          51: seg = 16'b01001001_10011111; // "11" 
          52: seg = 16'b01001001_00100101; // "12" 
          53: seg = 16'b01001001_00001101; // "13" 
          54: seg = 16'b01001001_10011001; // "16" 
          55: seg = 16'b01001001_01001001; // "15" 
          56: seg = 16'b01001001_01000001; // "16" 
          57: seg = 16'b01001001_00011111; // "17" 
          58: seg = 16'b01001001_00000001; // "18"     
          59: seg = 16'b01001001_00001001; // "19"
			 
          60: seg = 16'b01000001_00000011; // "10"     
          61: seg = 16'b01000001_10011111; // "11" 
          62: seg = 16'b01000001_00100101; // "12" 
          63: seg = 16'b01000001_00001101; // "13" 
          64: seg = 16'b01000001_10011001; // "16" 
          65: seg = 16'b01000001_01001001; // "15" 
          66: seg = 16'b01000001_01000001; // "16" 
          67: seg = 16'b01000001_00011111; // "17" 
          68: seg = 16'b01000001_00000001; // "18"     
          69: seg = 16'b01000001_00001001; // "19"
			 
          70: seg = 16'b00011111_00000011; // "10"     
          71: seg = 16'b00011111_10011111; // "11" 
          72: seg = 16'b00011111_00100101; // "12" 
          73: seg = 16'b00011111_00001101; // "13" 
          74: seg = 16'b00011111_10011001; // "16" 
          75: seg = 16'b00011111_01001001; // "15" 
          76: seg = 16'b00011111_01000001; // "16" 
          77: seg = 16'b00011111_00011111; // "17" 
          78: seg = 16'b00011111_00000001; // "18"     
          79: seg = 16'b00011111_00001001; // "19"
			 
          80: seg = 16'b00000001_00000011; // "10"     
          81: seg = 16'b00000001_10011111; // "11" 
          82: seg = 16'b00000001_00100101; // "12" 
          83: seg = 16'b00000001_00001101; // "13" 
          84: seg = 16'b00000001_10011001; // "16" 
          85: seg = 16'b00000001_01001001; // "15" 
          86: seg = 16'b00000001_01000001; // "16" 
          87: seg = 16'b00000001_00011111; // "17" 
          88: seg = 16'b00000001_00000001; // "18"     
          89: seg = 16'b00000001_00001001; // "19"
			 
          90: seg = 16'b00001001_00000011; // "10"     
          91: seg = 16'b00001001_10011111; // "11" 
          92: seg = 16'b00001001_00100101; // "12" 
          93: seg = 16'b00001001_00001101; // "13" 
          94: seg = 16'b00001001_10011001; // "16" 
          95: seg = 16'b00001001_01001001; // "15" 
          96: seg = 16'b00001001_01000001; // "16" 
          97: seg = 16'b00001001_00011111; // "17" 
          98: seg = 16'b00001001_00000001; // "18"     
          99: seg = 16'b00001001_00001001; // "19"
			 
		endcase
end		
			 
endmodule