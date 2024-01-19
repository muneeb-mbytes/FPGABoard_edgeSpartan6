Counting 0 t0 99 using FPGA

https://github.com/muneeb-mbytes/edge_spartan6/issues/1#issue-1654770525

https://github.com/muneeb-mbytes/edge_spartan6/issues/1#issuecomment-1496785547

https://github.com/muneeb-mbytes/edge_spartan6/issues/1#issuecomment-1496786165

https://github.com/muneeb-mbytes/edge_spartan6/issues/1#issuecomment-1496790609


Explaination each file

    1. bintobcd
A module to convert binary numbers to BCD numbers using a “double dabble algorithm”.
The input [7:0] and output [11:0] were declared as input will be a binary number and output will be a BCD number.
We first declare BCD (output) as 0, then using for loop we iterate 8 times for each bit in input number. Then shift one bit to the left, shift in a proper bit from input and check for condition, where if any BCD digit is “greater than or equal to 5” (>=5). 
If yes then add 3 to that binary number and continue the shifting.
 
    2. digits
The module where inputs like clk, reset, updown, result_load, state and output buzzer, and count of type reg are declared. 
A temp variable is also declared.
So always at posedge clk or posedge reset, if reset is pressed,
=> if updown is 0, then the count will be less than or equal to (<=) 99, else count will be 0.
=> else if temp greater than 0, temp is assigned “temp <= temp - 1 “ and buzzer is also 0.
=> else if (When the stop button is pressed) if the state is 1, then the count value will be updated and if the state is 0 
  (Start counting when start is pressed) if it is in up mode and load is 0 and if count==99, then it rolls from 99 to 0, else counts will be incremented.
=> else if it is in up mode and load is 1 and if count==99, then count will be 90.
=> else if it is in down mode and load is 0 and if count==0, then it rolls from 0 to 99, else count will be decremented.

    3. Final_counters_ucf.ucf
UCF files are used to interact with Xilinx’s implementation tools. Here we assign ports on FPGA for the inputs and outputs we declared.

    4. oneHz_gen
A module for the generation of clock of 1Hz. Here we declare input as clk_50MHz, reset and output as clk_1Hz.
We declare two registers for keep count,
ctr_reg: A 26-bit register to count the number of clock cycles.
clk_out_reg: A single-bit register to generate the 1Hz clock signal.
When reset is pressed both the registers will be 0, 
else if the counter reaches a value of 24999999 (input 50MHz / 1Hz / 2 = 25,000,000), it is reset to 0, and the 1Hz clock signal is toggled, 
else counter will be incremented and that will be assigned to the output.

    5. seg7_control
A module where inputs like clk_50MHz, reset, bcd[11:0] and outputs seg[7:0] ( for segment pattern 0-9) and digit[3:0] 
(digit select signals) are declared as a type reg.
Parameters for segment patterns are also declared as parameter ZERO  = 8'b00000011; till 9.
To select each digit in turn a 2-bit counter for selecting each of 4 digits is declared as digit_select and also a counter 
for digit refresh of 16-bit is declared as digit_timer. 
Logic for controlling digit select and digit timer 
Always on posedge clk or reset, if reset is high then both the counters will be 0.
else if digit_timer is equal to 49999 (The period of 50MHz clock is 20ns       (1/(50*1,000,000) seconds) 20ns x 50,000 = 1ms),
then digit_timer will be 0 as it is already at max state and digit_select will be incremented else digit_timer will be incremented.
=>Logic for driving the 4 bit anode output based on digit select
A case statement which turns on the required digit based on the digit_select.

=> Logic for driving segments based on which digit is selected and the value of each digit
Here case(digit_select) 
if it is 2’b00:
Then the case of(bcd[3:0]) first 4 bits each one represents a different value from 0-9.
if it is 2’b01:
Then the case of(bcd[7:4]) next 4 bits each one represents a different value from 0-9.
if it is 2’b10: it represents a hundreds digit as  letter.
if it is 2’b11: it represents thousands digit as letter.

    6. statedetect
A module of state detect to hold the value as high when push button is pressed.
Inputs are result_start,result_stop,clk_50MHz which are after passing through the debouncer circuit, and output is state of type reg.
At every posedge clk, if result_start then state is else if result_stop then state is 1

    7. top
A module where all the inputs and outputs are declared from all other files. 
Here wires are used for connecting inner modules.










