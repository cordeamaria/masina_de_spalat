----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 11:28:22 PM
-- Design Name: 
-- Module Name: verificare - Behavioral
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

entity verif_poate_incepe is
    Port ( stemp : in STD_LOGIC_VECTOR (0 to 3);
           svit : in STD_LOGIC_VECTOR (0 to 2);
           start_conf : out STD_LOGIC);
end verif_poate_incepe;

architecture arh_verif_poate_incepe of verif_poate_incepe is

begin

process(stemp,svit)
begin
if stemp="0000" or svit="000" 
    then start_conf <='0';
else
    start_conf <='1';         
end if;
end process;

end arh_verif_poate_incepe;
