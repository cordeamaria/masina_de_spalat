----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2024 09:29:03 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
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
        --sTemp: in std_logic_vector (0 to 3);
        --sVit: in std_logic_vector (0 to 2);
        --ssPS: in std_logic;
        --ssCS: in std_logic;
        --
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
end main;

architecture Behavioral of main is

component UC is
    Port (  clk : in std_logic;
            rst : in std_logic;
            mod_man_aut : in std_logic;
            usa : in std_logic;
            start_buton : in std_logic;    
            start_conf : in std_logic;
            op_PS : in std_logic;
            op_CS : in std_logic;
            temp_fin_ok : in std_logic;
            T1 : in std_logic;
            T10 : in std_logic;
            T20 : in std_logic;
            ---
            usa_in : out std_logic;
            usa_bl : out std_logic; 
            en_timp : out std_logic;
            etapa1, etapa2, etapa3, etapa4, etapa5 : out std_logic; 
            start_pr : out std_logic; 
            en_apa : out std_logic;
            en20, en10, en1 : out std_logic;
            en_2sec : out std_logic;
            en_1min : out std_logic;
            afis : out std_logic;
            load_timp_total : out std_logic);
            --load_timp_ramas : out std_logic);
end component;

component UE is
  Port (--intrari si iesiri din UC
        clk: in std_logic;
        --load_timp_ramas: in std_logic;
        load_timp_total: in std_logic;
        en_timp: in std_logic;
        en_2sec: in std_logic;
        en1, en10, en20 : in std_logic;
        en_apa: in std_logic;
        en_1min: in std_logic;
        afis: in std_logic;
        start_pr: in std_logic;
        --
        op_CS: out std_logic;
        op_PS: out std_logic;
        temp_fin_ok: out std_logic;
        start_conf: out std_logic;
        T1, T10,T20: out std_logic;
        --intrari si iesiri utilizator
        rst : in std_logic;
        load_info : in std_logic;
        mod_man_aut : in std_logic;
        setari_man: in std_logic_vector (0 to 8);
        --start_buton: in std_logic;
        sr: in std_logic;
        ca: in std_logic;
        ci: in std_logic;
        rm: in std_logic;
        aa: in std_logic;
        --
        temp: out std_logic_vector (0 to 3);
        vit: out std_logic_vector (0 to 2);
        ps: out std_logic;
        cs: out std_logic;
        anod : out std_logic_vector (7 downto 0);
        catod : out std_logic_vector (6 downto 0)
         );
end component;

signal sen_timp : std_logic; 
signal sstart_pr : std_logic; 
signal sen_apa :  std_logic;
signal sen20, sen10, sen1 : std_logic;
signal sen_2sec : std_logic;
signal sen_1min :  std_logic;
signal safis :  std_logic;
signal sload_timp_total :  std_logic;
signal sload_timp_ramas :  std_logic;
signal stemp_fin_ok:  std_logic;
signal sstart_conf:  std_logic;
signal sT1, sT10,sT20:  std_logic;
signal sop_CS: std_logic;
signal sop_PS:  std_logic;

begin

Unit_Exe: UE port map ( clk => clk,
                        --load_timp_ramas => sload_timp_ramas,
                        load_timp_total => sload_timp_total,
                        en_timp => sen_timp,
                        en_2sec => sen_2sec,
                        en1 => sen1, en10 => sen10, en20 => sen20,
                        en_apa => sen_apa,
                        en_1min => sen_1min,
                        afis => safis,
                        start_pr => sstart_pr,
        --
                        op_CS => sop_CS,
                        op_PS => sop_PS,
                        temp_fin_ok => stemp_fin_ok,
                        start_conf => sstart_conf,
                        T1 => sT1, T10 => sT10, T20 => sT20, 
        --intrari si iesiri utilizator
                        rst => rst,
                        load_info => load_info,
                        mod_man_aut => mod_man_aut,
                        setari_man => setari_man,
                        --start_buton => start_buton,
                        sr => sr,
                        ca => ca,
                        ci => ci,
                        rm => rm,
                        aa => aa,
        --
                        temp => temp,
                        vit => vit,
                        ps => ps,
                        cs => cs,
                        anod => anod,
                        catod => catod
                        

);

Unit_Cont: UC port map ( clk => clk,
                        rst => rst,
                        mod_man_aut => mod_man_aut,
                        usa => usa,
                        start_buton => start_buton,   
                        start_conf => sstart_conf, 
                        op_PS => sop_PS,
                        op_CS => sop_CS,
                        temp_fin_ok => stemp_fin_ok,
                        T1 => sT1,
                        T10 => sT10,
                        T20 => sT20,
            ---
                        usa_in => usa_in,
                        usa_bl => usa_bl,
                        en_timp => sen_timp,
                        etapa1 => lps, etapa2 => lsp, etapa3 => lcl, etapa4 => lcs, etapa5 => lcf, 
                        start_pr => sstart_pr,
                        en_apa => sen_apa,
                        en20 => sen20, en10 => sen10, en1 => sen1,
                        en_2sec => sen_2sec,
                        en_1min => sen_1min,
                        afis => safis,
                        load_timp_total => sload_timp_total
                        --load_timp_ramas => sload_timp_ramas
);

end Behavioral;
