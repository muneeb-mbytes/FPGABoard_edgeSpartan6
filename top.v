`timescale 1ns / 1ps



module top(
    input stop,
    input load,

    input updown,

    input clk_50MHz,       // from Edge Spartan 6

    input reset,            // btnC

	 output buzzer,

    output [7:0] seg,       // 7 segment display segment pattern

    output [3:0] digit      // 7 segment display cathodes

    );

    

    // Internal wires for connecting inner modules

    wire w_1Hz;

    wire [3:0] w_1s, w_10s;

    // Instantiate inner design modules

    oneHz_gen hz1(.clk_50MHz(clk_50MHz), .reset(reset), .clk_1Hz(w_1Hz));

    
    digits digs(.stop(stop), .load(load), .updown(updown), .clk_1Hz(w_1Hz), .reset(reset), .buzzer(buzzer), .ones(w_1s), 

                .tens(w_10s));

    
    seg7_control seg7(.clk_50MHz(clk_50MHz), .reset(reset), .ones(w_1s), .tens(w_10s),

                       .seg(seg), .digit(digit));

  
endmodule

