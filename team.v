timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:45:38 05/02/2023 
// Design Name: 
// Module Name:    open 
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
//////////////////////////////////////////////////////////////////////////////////
module open(  input wire [3:0] data,
  output reg [6:0] segments
);
parameter [15:0] TRUTH_TABLE = 16'hFC7E;
always @(*) begin
  case (data)
    4'b0000: segments = TRUTH_TABLE[15:8]; // Display 'O'
    4'b0001: segments = TRUTH_TABLE[7:0];  // Display 'P'
    4'b0010: segments = TRUTH_TABLE[13:6]; // Display 'E'
    4'b0011: segments = TRUTH_TABLE[12:5]; // Display 'N'
    default: segments = 7'b111_1111;       // Turn off all segments
  endcase
end   


endmodule
