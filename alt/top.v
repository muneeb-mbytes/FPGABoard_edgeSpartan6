module buzzer (
  input wire clk,
  input wire button,
  output reg buzzer_out
);

  reg [16:0] counter = 17'b0;  // Counter to generate the desired frequency
  reg toggle = 1'b0;           // Toggle to switch the buzzer on/off

  always @(posedge clk) begin
    if (button) begin
      toggle <= ~toggle;        // Toggle the buzzer state when the button is pressed
      counter <= 17'b0;         // Reset the counter on button press
    end else if (counter == 17'd113635) begin
      counter <= 17'b0;         // Reset the counter when it reaches the desired value
      toggle <= ~toggle;        // Toggle the buzzer state
    end else begin
      counter <= counter + 1;   // Increment the counter
    end
  end

  always @(posedge clk) begin
    if (toggle) begin
      buzzer_out <= 1'b1;       // Turn on the buzzer when toggle is true
    end else begin
      buzzer_out <= 1'b0;       // Turn off the buzzer when toggle is false
    end
  end

endmodule



