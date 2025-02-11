----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2024 03:47:46 PM
-- Design Name: 
-- Module Name: sim - Behavioral
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

entity sim is
--  Port ( );
end sim;

architecture Behavioral of sim is
component main is
  Port (clk: in std_logic;
        rst: in std_logic;
        load_info : in std_logic;
        start_buton: in std_logic;
        usa: in std_logic;
        mod_man_aut: in std_logic;
        sr: in std_logic;
        ca: in std_logic;
        ci: in std_logic;
        rm: in std_logic;
        aa: in std_logic;
        setari_man: in std_logic_vector (0 to 8);
        
        usa_in: out std_logic;
        usa_bl: out std_logic;
        temp: out std_logic_vector (0 to 3);
        vit: out std_logic_vector (0 to 2);
        ps: out std_logic;
        cs: out std_logic;
        lps: out std_logic;
        lsp: out std_logic;
        lcl: out std_logic;
        lcs: out std_logic;
        lcf: out std_logic;
        anod: out std_logic_vector (7 downto 0);
        catod: out std_logic_vector (6 downto 0)
        );
end component;
signal clk,rst,load_info,start_buton, usa, mod_man_aut,sr, ca,ci, rm,aa:std_logic:='0';
signal setari_man:std_logic_vector (0 to 8);
signal usa_in, usa_bl,ps,cs,lps,lsp,lcl,lcs,lcf:std_logic;
signal temp:std_logic_vector(0 to 3);
signal vit:std_logic_vector(0 to 2);
signal anod: std_logic_vector (7 downto 0);
signal catod: std_logic_vector (6 downto 0);
constant perioada:time:=10ns;
begin
uut: main port map(clk,rst,load_info,start_buton, usa, mod_man_aut,sr, ca,ci, rm,aa,setari_man,
                  usa_in, usa_bl, temp, vit,ps,cs,lps,lsp,lcl,lcs,lcf, anod,catod);
ceas:process
begin
clk<='0';
wait for perioada/2;
clk<='1';
wait for perioada/2;
end process;
stimului:process
begin
sr<='1';
wait for perioada;
load_info<='1';
wait for perioada;
usa<='1';
wait for perioada;
start_buton<='1';
end process;
end Behavioral;