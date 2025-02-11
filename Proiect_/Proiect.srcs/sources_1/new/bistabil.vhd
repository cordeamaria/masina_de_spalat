----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 09:42:23 AM
-- Design Name: 
-- Module Name: debouncer_30ns - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;

entity bistabilD IS
  port (
    clkd, D: in STD_LOGIC;
    Q: out STD_LOGIC
    );
end bistabilD;

architecture arhBist of bistabilD is

begin

process(clkd)
begin
    if RISING_EDGE(clkd) then
        Q <= D;
    end if;
end process;

end arhBist;
