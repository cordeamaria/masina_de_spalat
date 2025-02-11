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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity divizor2sec is
    Port ( en2sec : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk2sec : out STD_LOGIC);
end divizor2sec;

architecture arh_divizor2sec of divizor2sec is


signal count:integer:=1;
signal clk1:std_logic:='0';
begin

process(clk,clk1,en2sec,count)
begin
if en2sec='0' then count<=1;
               clk1<='0';
elsif rising_edge(clk) then
  if count=50000000 then
     count<=1;
     clk1<=not(clk1);
   else
     count<=count+1;
   end if;
end if;
end process;
clk2sec<=clk1;

end arh_divizor2sec;
