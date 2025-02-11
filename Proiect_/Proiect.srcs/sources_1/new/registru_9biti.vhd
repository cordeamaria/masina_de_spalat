----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2024 04:35:48 PM
-- Design Name: 
-- Module Name: registru_9biti - arh_reg
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

entity registru_9biti is
  Port (clk: in std_logic;
        rst: in std_logic;
        load : in std_logic;
        input_v: in std_logic_vector (0 to 8);
        temp: out std_logic_vector (0 to 3);
        vit: out std_logic_vector (0 to 2);
        ps: out std_logic;
        cs: out std_logic);
end registru_9biti;

architecture arh_reg of registru_9biti is

signal out_temp: std_logic_vector (0 to 8) := "000000000";

begin

process (clk,rst,load)
begin
    if rst = '1' 
        then out_temp <= "000000000";
    elsif rising_edge(clk) and load = '1'
        then out_temp <= input_v;
    end if;    

end process;  

temp <= out_temp (0 to 3);
vit <= out_temp (4 to 6);
ps <= out_temp(7);
cs <= out_temp(8);  

end arh_reg;
