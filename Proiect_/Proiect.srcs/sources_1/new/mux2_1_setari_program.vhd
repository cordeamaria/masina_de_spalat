----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2024 02:20:18 PM
-- Design Name: 
-- Module Name: mux2_1_setari_program - arh_mux2_1_setari_program
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

entity mux2_1_setari_program is
  Port ( setari_aut: in  std_logic_vector (0 to 8);
         setari_man: in  std_logic_vector (0 to 8);
         mod_man_aut: in std_logic;
         setari_out: out  std_logic_vector (0 to 8));
end mux2_1_setari_program;

architecture arh_mux2_1_setari_program of mux2_1_setari_program is
begin
    with mod_man_aut select setari_out <=
        setari_aut when '0',
        setari_man when '1',
        (others => '0') when others;
end arh_mux2_1_setari_program;
