
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:06 05/02/2023 
// Design Name: 
// Module Name:    main 
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
`timescale 1ns / 1ps

module seg7_control(
    input clk_50MHz,
    input reset_button,
    input [15:0] bcd,
    output reg [7:0] seg,       // segment pattern 0-9
    output reg [3:0] digit      // digit select signals
    );// Parameters for segment patterns
    parameter O  = 8'b00000011;  // 0
    parameter N   = 8'b00010011;  // 1
    parameter P   = 8'b00110001;  // 2 
    parameter E = 8'b01100001;  // 3
    parameter dash  = 8'b11110101;  // 4
    parameter F = 8'b01110001;  // 5
    
	 // To select each digit in turn
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk_50MHz or posedge reset_button) begin
        if(reset_button) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else
		    if(digit_timer == 49_999) begin         // The period of 50MHz clock is 20ns (1/(50*1,000,000) seconds)
                digit_timer <= 0;                   // 20ns x 50,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0000;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b0000;   // Turn on thousands digit
        endcase
    end
	   // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            2'b01 : begin       // tens DIGIT
                        case(bcd[7:4])
			   
                            4'b0000 : seg = N;
                        endcase
                    end
                    
            2'b10 : begin       // Thundreds DIGIT
                        case(bcd[11:8])
			    4'b0000 : seg = O;
                            
			endcase
                    end
						  endcase
                    

// Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b1000;   // Turn on thousands digit
        endcase
    end
	   // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            2'b00 : begin       // ones DIGIT
                        case(bcd[3:0])
			   
                            4'b0000 : seg = N;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(bcd[7:4])
			    4'b0000 : seg = E;
                            
			endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
 			            case(bcd[11:8])
			                
                            4'b0000 : seg = P;
                            
                        endcase
                          
									  
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
 			           case(bcd[15:12])
			                   4'b0000 : seg = O;
                          
                        endcase
                            
									  
                    end
        endcase




always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b0000;   // Turn on thousands digit
				endcase
				end
 always @*
        case(digit_select)
            2'b00 : begin       // tens DIGIT
                        case(bcd[3:0])
			   
                            4'b0000 : seg = F;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(bcd[7:4])
			    4'b0000 : seg = F;
                            
			endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
 			            case(bcd[11:8])
			                
                            4'b0000 : seg = O;
                            
                        endcase
                          
									  
                    end
        				  
        endcase
always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b0000;   // Turn on thousands digit
				endcase
				end
 always @*
        case(digit_select)
            2'b00 : begin       // tens DIGIT
                        case(bcd[3:0])
			   
                            4'b0000 : seg = F;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(bcd[7:4])
			    4'b0000 : seg = F;
                            
			endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
 			            case(bcd[11:8])
			                
                            4'b0000 : seg = O;
                            
                        endcase
                          
									  
                    end
        endcase





always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b0000;   // Turn on thousands digit
				endcase
				end
 always @*
        case(digit_select)
            2'b00 : begin       // tens DIGIT
                        case(bcd[3:0])
			   
                            4'b0000 : seg = F;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(bcd[7:4])
			    4'b0000 : seg = F;
                            
			endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
 			            case(bcd[11:8])
			                
                            4'b0000 : seg = O;
                            
                        endcase
                          
									  
                    end
        endcase



always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b0000;   // Turn on thousands digit
				endcase
				end
 always @*
        case(digit_select)
            2'b00 : begin       // tens DIGIT
                        case(bcd[3:0])
			   
                            4'b0000 : seg = dash;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(bcd[7:4])
			    4'b0000 : seg = dash;
                            
			endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
 			            case(bcd[11:8])
			                
                            4'b0000 : seg = E;
                            
                        endcase
                          
									  
                    end
        endcase
endmodule
