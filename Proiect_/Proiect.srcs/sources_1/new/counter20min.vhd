----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 08:12:26 PM
-- Design Name: 
-- Module Name: counter1min - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter20min is
    Port ( clk1min : in STD_LOGIC;
           en_20min : in STD_LOGIC;
           t20 : out STD_LOGIC);
end counter20min;

architecture arh_counter20min of counter20min is
begin

process(en_20min,clk1min)
variable numara: integer:=0;

begin
if en_20min='0' 
    then numara:=0;
        t20<='0';
elsif(falling_edge(clk1min))
    then numara:= numara+1;
    if numara= 20 
        then t20<='1';
            numara:=0;
    else 
        t20<='0';
    end if;
end if;
end process;

end arh_counter20min;
