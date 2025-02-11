----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2024 10:52:32 PM
-- Design Name: 
-- Module Name: divizor200hz - Behavioral
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

entity divizor200hz is
    Port ( clkin : in STD_LOGIC;
           clkout : out STD_LOGIC);
end divizor200hz;

architecture arh_divizor200hz of divizor200hz is

signal count:integer:=1;
signal clk1:std_logic:='0';
begin

process(clkin,clk1,count)
begin
if rising_edge(clkin) then
  if count=124999 then
     count<=1;
     clk1<=not(clk1);
   else
     count<=count+1;
   end if;
end if;
end process;
clkout<=clk1;


end arh_divizor200hz;
