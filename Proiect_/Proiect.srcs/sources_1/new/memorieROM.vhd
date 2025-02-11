----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 10:38:58 PM
-- Design Name: 
-- Module Name: memorieROM - Behavioral
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

entity memorieROM is
    Port ( mod_ales : in STD_LOGIC_VECTOR (0 to 2);
           --temperatura : out STD_LOGIC_VECTOR (0 to 3);
           --viteza : out STD_LOGIC_VECTOR (0 to 2);
           --PS : out STD_LOGIC;
           --CS : out STD_LOGIC);
           setari_aut: out std_logic_vector (0 to 8));
end memorieROM;

architecture Behavioral of memorieROM is
SIGNAL proprietati: STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
begin
process(mod_ales)
begin
case mod_ales is
    when "001" => proprietati<="100000100";
    when "010" => proprietati<="001010000";
    when "011" => proprietati<="010001001";
    when "100" => proprietati<="010001010";
    when "101" => proprietati<="000100101";
    when "110" => proprietati<="000000000";
    when others =>proprietati<=(others=>'0');
 end case;
end process;
    --temperatura<=proprietati(8 downto 5);
    --viteza<=proprietati(4 downto 2);
    --PS<=proprietati(1);
    --CS<=proprietati(0);
    setari_aut <= proprietati;
end Behavioral;
