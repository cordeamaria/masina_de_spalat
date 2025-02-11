----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 10:47:36 PM
-- Design Name: 
-- Module Name: incalzireapa - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity incalzire_apa is
    Port ( en_apa : in STD_LOGIC;
           clk2sec : in STD_LOGIC;
           temp : in STD_LOGIC_VECTOR (6 downto 0);
           temp_fin_ok : out STD_LOGIC);
end incalzire_apa;

architecture arh_Incalzire_apa of incalzire_apa is

signal numara: std_logic_vector(6 downto 0);

begin

process(en_apa,clk2sec)
begin
if en_apa='0' 
    then temp_fin_ok <='0';
            numara<="0001111";
else
    if(rising_edge(clk2sec)) 
        then numara <= std_logic_vector(unsigned(numara) + 1);
        if numara=temp 
            then temp_fin_ok <='1';
        else temp_fin_ok <='0';
        end if;
    end if;
end if;
end process;

end arh_Incalzire_apa;
