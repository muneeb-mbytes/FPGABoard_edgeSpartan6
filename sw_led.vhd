----------------------------------------------------------------------------------
-- All the switches are connected to LEDs to view its logic state
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sw_led is
    Port ( sw : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           led : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end sw_led;

architecture Behavioral of sw_led is

begin

led <= sw;
end Behavioral;

