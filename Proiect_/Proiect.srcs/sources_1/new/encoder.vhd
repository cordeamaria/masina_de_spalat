----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 11:14:25 PM
-- Design Name: 
-- Module Name: Encoder - Behavioral
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

entity Encoder is
    Port ( sr : in STD_LOGIC;
           ca : in STD_LOGIC;
           ci : in STD_LOGIC;
           rm : in STD_LOGIC;
           aa : in STD_LOGIC;
           mod_ales : out STD_LOGIC_VECTOR (0 to 2));
end Encoder;

architecture Behavioral of Encoder is

begin
process(sr,ca,ci,rm,aa)
begin
    if sr='1' and ca='0' and ci='0' and rm='0' and aa='0' then
         mod_ales<="001";
    elsif sr='0' and ca='1' and ci='0' and rm='0' and aa='0' then
        mod_ales<="010";
    elsif sr='0' and ca='0' and ci='1' and rm='0' and aa='0' then
        mod_ales<="011";
    elsif sr='0' and ca='0' and ci='0' and rm='1' and aa='0' then
        mod_ales<="100";
    elsif sr='0' and ca='0' and ci='0' and rm='0' and aa='1' then
        mod_ales<="101";
    else mod_ales <= "110";
    end if; 
 
end process;

end Behavioral;
