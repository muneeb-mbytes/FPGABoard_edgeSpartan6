-------------------------------------------------------
--- the code get BCD input from 4 slide switches and 
--- display the output in seven segment display.
--
-- "BCDin[0]"  P22;
-- "BCDin[1]"  P21;
-- "BCDin[2]"  P17;
-- "BCDin[3]"  P16;
--
-- "digit[0]"  P127;
-- "digit[1]"  P131;
-- "digit[2]"  P132;
-- "digit[3]"  P133;
--
-- "Seven_Segment[0]"  P134;
-- "Seven_Segment[1]"  P137;
-- "Seven_Segment[2]"  P138;
-- "Seven_Segment[3]"  P139;
-- "Seven_Segment[4]"  P140;
-- "Seven_Segment[5]"  P141;
-- "Seven_Segment[6]"  P142;
-- "Seven_Segment[7]"  P143;
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
entity bcd_7segment is
Port ( 
BCDin : in STD_LOGIC_VECTOR (3 downto 0);  -- Slide Switch 
digit : out STD_LOGIC_VECTOR (3 downto 0);        -- Enable 4 digit
Seven_Segment : out STD_LOGIC_VECTOR (7 downto 0)); -- 7 Segments and Dot LEDs
end bcd_7segment;
  
architecture Behavioral of bcd_7segment is
  
begin
  
digit <= "1111";
process(BCDin)
begin
  
case BCDin is
when "0000" =>
Seven_Segment <= "00000011"; ---0 
when "0001" =>
Seven_Segment <= "10011111"; ---1 
when "0010" =>
Seven_Segment <= "00100101"; ---2 
when "0011" =>
Seven_Segment <= "00001101"; ---3 
when "0100" =>
Seven_Segment <= "10011001"; ---4 
when "0101" =>
Seven_Segment <= "01001001"; ---5 
when "0110" =>
Seven_Segment <= "01000001"; ---6 
when "0111" =>
Seven_Segment <= "00011111"; ---7 
when "1000" =>
Seven_Segment <= "00000001"; ---8 
when "1001" =>
Seven_Segment <= "00001001"; ---9
when others =>
Seven_Segment <= "11111111"; ---null
end case;
  
end process;
  
end Behavioral;