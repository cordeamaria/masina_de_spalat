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

entity debouncer_30ns is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           btn_out : out STD_LOGIC);
end debouncer_30ns;

architecture Behavioral of debouncer_30ns is

component  bistabilD is
  port (
    clkd,D : IN STD_LOGIC;
    Q: OUT STD_LOGIC
    );
end component;

signal Q0: STD_LOGIC := '0';
signal Q1: STD_LOGIC := '0';
signal Q2: STD_LOGIC := '0';
begin

D1: bistabilD port map(clk, Q1, Q2);
D2: bistabilD port map(clk, Q0, Q1);
D3: bistabilD port map(clk, btn, Q0);
btn_out <= Q0 and Q1 and Q2;

end Behavioral;

