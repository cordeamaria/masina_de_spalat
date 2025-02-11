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

entity counter10min is
    Port ( clk1min : in STD_LOGIC;
           en_10min : in STD_LOGIC;
           t10 : out STD_LOGIC);
end counter10min;

architecture arh_counter10min of counter10min is
begin

process(en_10min,clk1min)
variable numara: integer:=0;

begin
if en_10min='0' 
    then numara:= 0;
        t10<='0';
elsif(falling_edge(clk1min))
    then numara:= numara +1;
    if numara=10 
        then t10<='1';
            numara:=0;
    else 
        t10<='0';
    end if;
end if;
end process;

end arh_counter10min;
