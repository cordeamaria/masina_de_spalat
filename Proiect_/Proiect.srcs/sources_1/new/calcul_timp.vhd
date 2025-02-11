----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2024 08:40:34 AM
-- Design Name: 
-- Module Name: calcul_timp - Behavioral
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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calcul_timp is
  Port (temp : in std_logic_vector (0 to 3);
        ps : in std_logic;
        cs : in std_logic;
        --timp_total : out std_logic_vector(6 downto 0);
        timp_ramas : out std_logic_vector(8 downto 0)
         );
end calcul_timp;

architecture arh_calcul_timp of calcul_timp is

begin

process(ps, cs, temp)
variable aux_timp_ramas: STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
--variable aux_timp_ramas: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');

begin

aux_timp_ramas := (others => '0');
aux_timp_ramas := aux_timp_ramas + 40 ; -- clatire + centrifugare + spalare (fara incalzire)

if ps = '1' 
    then aux_timp_ramas := aux_timp_ramas + 10;
else 
    NULL;
end if;
	
if cs = '1' 
    then aux_timp_ramas := aux_timp_ramas + 10;
else
	NULL;
end if;

case temp is
	when "0001" =>
        aux_timp_ramas := aux_timp_ramas + 75;
        if ps ='1' 
          then aux_timp_ramas := aux_timp_ramas + 75;
        end if;
			
	when "0010" =>
        aux_timp_ramas := aux_timp_ramas + 45;
        if ps ='1' 
          then aux_timp_ramas := aux_timp_ramas + 45;
        end if;
			
	when "0100" =>
        aux_timp_ramas := aux_timp_ramas + 25;
        if ps ='1' 
          then aux_timp_ramas := aux_timp_ramas + 25;
        end if;
		
	when "1000" =>
		aux_timp_ramas := aux_timp_ramas + 15;
		if ps ='1' 
		  then aux_timp_ramas := aux_timp_ramas + 15;
		end if;
			
	when others =>
		aux_timp_ramas := (others => '0');
		--aux_timp_ramas := (others => '0');
end case;

--timp_total <= aux_timp_total;
timp_ramas <= aux_timp_ramas;

end process;

end arh_calcul_timp;
