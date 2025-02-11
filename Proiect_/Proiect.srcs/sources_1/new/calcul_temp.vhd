----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 08:29:49 AM
-- Design Name: 
-- Module Name: calcul_temp - Behavioral
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

entity calcul_temp is
     Port (  temp_aleasa : in std_logic_vector (0 to 3);
             temp_calc : out std_logic_vector (6 downto 0)
             );
end calcul_temp;

architecture arh_calc_temp of calcul_temp is

begin

with temp_aleasa select temp_calc <=
    "1011010" when "0001",
    "0111100" when "0010",
	"0101000" when "0100",
	"0011110" when "1000",
	"0000000" when others;

end arh_calc_temp;
