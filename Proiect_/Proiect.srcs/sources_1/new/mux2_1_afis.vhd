----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2024 02:13:42 PM
-- Design Name: 
-- Module Name: muxtimp2la1 - Behavioral
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

entity mux2_1_afis is
    Port ( startprogram : in STD_LOGIC;
           timp_total : in STD_LOGIC_VECTOR (8 downto 0);
           timp_ramas : in STD_LOGIC_VECTOR(8 downto 0);
           timp_afisaj : out STD_LOGIC_VECTOR(8 downto 0));
end mux2_1_afis;

architecture arh_mux2_1_afis of mux2_1_afis is

begin

process(startprogram, timp_total, timp_ramas)

begin
if startprogram='0' 
    then timp_afisaj <= timp_total;
elsif startprogram='1' 
    then timp_afisaj <= timp_ramas;
end if;
end process;

end arh_mux2_1_afis;
