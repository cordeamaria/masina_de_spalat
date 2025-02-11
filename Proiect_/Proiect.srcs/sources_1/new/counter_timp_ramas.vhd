----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 03:27:45 PM
-- Design Name: 
-- Module Name: counter_timp_ramas - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_timp_ramas is
  Port (clk : in std_logic;
        en_timp : in std_logic;
        timp_total : in std_logic_vector (8 downto 0);
        load_timp : in std_logic;
        timp_ramas : out std_logic_vector (8 downto 0)
        );
end counter_timp_ramas;

architecture arh_counter_timp_ramas of counter_timp_ramas is

begin

process (clk, en_timp, load_timp, timp_total)

variable aux : std_logic_vector (8 downto 0); -- := (others => '0');

begin
if en_timp = '0' 
    then if load_timp = '1' 
        then aux := timp_total;
            timp_ramas <= timp_total;
         else 
            NULL;
         end if;
         
else
    if falling_edge(clk)      
        then if  aux /= "00000000"
                then aux := aux - 1; 
             else
                NULL;
             end if;
             timp_ramas <= aux;
    end if;
end if;

end process;

end arh_counter_timp_ramas;
