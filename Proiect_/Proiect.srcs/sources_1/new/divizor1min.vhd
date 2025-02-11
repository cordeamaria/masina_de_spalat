----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 06:53:55 PM
-- Design Name: 
-- Module Name: div2sec - Behavioral
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

        ---DUVZIOR1SEC
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divizor1min is
    Port ( en1 : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk1min : out STD_LOGIC);
end divizor1min;

architecture arh_divizor1min of divizor1min is
signal clkaux:std_logic := '0';
begin
process(en1,clk,clkaux)
begin
if en1='0' then
    clk1min<='0';
 else 
    clk1min<=clk;
 end if;
end process;
end arh_divizor1min;