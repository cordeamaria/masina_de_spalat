----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2024 10:03:24 PM
-- Design Name: 
-- Module Name: UE - Behavioral
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

entity UE is
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
end UE;


architecture arhUE of UE is

component Encoder is
    Port ( sr : in STD_LOGIC;
           ca : in STD_LOGIC;
           ci : in STD_LOGIC;
           rm : in STD_LOGIC;
           aa : in STD_LOGIC;
           mod_ales : out STD_LOGIC_VECTOR (0 to 2));
end component;

component memorieROM is
    Port ( mod_ales : in STD_LOGIC_VECTOR (0 to 2);
           setari_aut: out std_logic_vector (0 to 8)
           );
end component;

component mux2_1_setari_program is
  Port ( setari_aut: in  std_logic_vector (0 to 8);
         setari_man: in  std_logic_vector (0 to 8);
         mod_man_aut: in std_logic;
         setari_out: out  std_logic_vector (0 to 8));
end component;

component registru_9biti is
  Port (clk: in std_logic;
        rst: in std_logic;
        load : in std_logic;
        input_v: in std_logic_vector (0 to 8);
        temp: out std_logic_vector (0 to 3);
        vit: out std_logic_vector (0 to 2);
        ps: out std_logic;
        cs: out std_logic);
end component;

component incalzire_apa is
    Port ( en_apa : in STD_LOGIC;
           clk2sec : in STD_LOGIC;
           temp : in STD_LOGIC_VECTOR (6 downto 0);
           temp_fin_ok : out STD_LOGIC);
end component;

component verif_poate_incepe is
    Port ( stemp : in STD_LOGIC_VECTOR (0 to 3);
           svit : in STD_LOGIC_VECTOR (0 to 2);
           start_conf : out STD_LOGIC);
end component;

component counter1min is
    Port ( clk1min : in STD_LOGIC;
           en_1min : in STD_LOGIC;
           t1 : out STD_LOGIC);
end component;

component counter10min is
    Port ( clk1min : in STD_LOGIC;
           en_10min : in STD_LOGIC;
           t10 : out STD_LOGIC);
end component;

component counter20min is
    Port ( clk1min : in STD_LOGIC;
           en_20min : in STD_LOGIC;
           t20 : out STD_LOGIC);
end component;

component divizor200hz is
    Port ( clkin : in STD_LOGIC;
           clkout : out STD_LOGIC);
end component;

component divizor2sec is
    Port ( en2sec : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk2sec : out STD_LOGIC);
end component;

component divizor1min is
    Port ( en1 : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk1min : out STD_LOGIC);
end component;

component afisaj4cifre is
      port (
      clk : in std_logic;
      afis:in std_logic;
      timp : in std_logic_vector(8 downto 0); 
      anod : out std_logic_vector(7 downto 0);
      catod : out std_logic_vector(6 downto 0)
  );
end component;

component calcul_temp is
     Port (  temp_aleasa : in std_logic_vector (0 to 3);
             temp_calc : out std_logic_vector (6 downto 0)
             );
end component;

component calcul_timp is
  Port (temp : in std_logic_vector (0 to 3);
        ps : in std_logic;
        cs : in std_logic;
        --timp_total : out std_logic_vector(6 downto 0);
        timp_ramas : out std_logic_vector(8 downto 0)
         );
end component;

component mux2_1_afis is
    Port ( startprogram : in STD_LOGIC;
           timp_total : in STD_LOGIC_VECTOR (8 downto 0);
           timp_ramas : in STD_LOGIC_VECTOR(8 downto 0);
           timp_afisaj : out STD_LOGIC_VECTOR(8 downto 0));
end component;

component counter_timp_ramas is
  Port (clk : in std_logic;
        en_timp : in std_logic;
        timp_total : in std_logic_vector (8 downto 0);
        load_timp : in std_logic;
        timp_ramas : out std_logic_vector (8 downto 0)
        );
end component;

signal sencoded : std_logic_vector (0 to 2);
signal ssetari_aut : std_logic_vector (0 to 8);
signal ssetari_out : std_logic_vector (0 to 8);
signal stemp : std_logic_vector (0 to 3);
signal svit : std_logic_vector (0 to 2);
signal sps : std_logic;
signal scs : std_logic;
signal start_buton_f: std_logic;
signal sclk2secst : std_logic;
signal sclk2secdr : std_logic;
signal sclk1minst : std_logic;
signal sclk1mindr : std_logic;
signal stemp_h : std_logic_vector (6 downto 0);
signal sclk200hz : std_logic;
signal stimp_ssd :std_logic_vector (8 downto 0);
signal sstart_conf: std_logic;
signal stimp_total : std_logic_vector(8 downto 0);
signal stimp_ramas : std_logic_vector(8 downto 0);
signal sctimp_ramas : std_logic_vector(8 downto 0);

begin

encoderpm: encoder port map ( sr => sr,
                            ca => ca,
                            ci => ci,
                            rm => rm,
                            aa => aa,
                            mod_ales => sencoded
);

memorieROMpm: memorieROM port map ( mod_ales => sencoded,
                                    setari_aut => ssetari_aut
);

mux2_1_setari_programpm: mux2_1_setari_program port map (setari_aut => ssetari_aut,
                                    setari_man => setari_man,
                                    mod_man_aut => mod_man_aut,
                                    setari_out => ssetari_out
);

registru_9bitipm: registru_9biti port map (clk => clk,
                                    rst => rst,
                                    load => load_info,
                                    input_v => ssetari_out,
                                    temp => stemp,
                                    vit => svit,
                                    ps => sps,
                                    cs => scs
);

temp <= stemp;
vit <= svit;
ps <= sps;
cs <= scs;
op_cs <= scs;
op_ps <= sps;
incalzire_apapm: incalzire_apa port map (en_apa => en_apa,
                                    clk2sec => sclk2secst, 
                                    temp => stemp_h,
                                    temp_fin_ok => temp_fin_ok
);

verif_poate_incepepm: verif_poate_incepe port map (stemp => stemp,
                                    svit => svit,
                                    start_conf => start_conf
);

counter1minpm: counter1min port map( clk1min => sclk1minst,
                                    en_1min => en1,
                                    t1 => t1
);

counter10minpm: counter10min port map( clk1min => sclk1minst,
                                    en_10min => en10,
                                    t10 => t10
);

counter20minpm: counter20min port map( clk1min => sclk1minst,
                                    en_20min => en20,
                                    t20 => t20
);

divizor200hzpm: divizor200hz port map(clkin => clk,
                                    clkout => sclk200hz
);

divizor2sec_st_pm: divizor2sec port map(en2sec => en_2sec,
                            clk => clk,
                            clk2sec => sclk2secst
);

divizor1min_st_pm: divizor1min port map(en1 => en_1min,
                                    clk => sclk2secst,
                                    clk1min => sclk1minst
);

divizor2sec_dr_pm: divizor2sec port map(en2sec => en_timp,
                            clk => clk,
                            clk2sec => sclk2secdr
);
divizor1min_dr_pm: divizor1min port map(en1 => en_timp,
                                    clk => sclk2secdr,
                                    clk1min => sclk1mindr
);

afisaj4cifrepm: afisaj4cifre port map (
                                   
                                    clk => sclk200hz,
                                    afis => afis,
                                    timp => stimp_ssd,
                                    anod => anod,
                                    catod => catod
);

calcul_temppm: calcul_temp port map (temp_aleasa => stemp,
                                    temp_calc => stemp_h
);

calcul_timppm: calcul_timp port map(temp => stemp,
                                    ps => sps,
                                    cs => scs,
                                    timp_ramas => stimp_ramas
);

mux2_1_afispm: mux2_1_afis port map(startprogram => start_pr,
                                    timp_total => stimp_ramas,
                                    timp_ramas => sctimp_ramas,
                                    timp_afisaj => stimp_ssd
);

counter_timp_ramaspm: counter_timp_ramas port map(clk => sclk1mindr,
                                    en_timp => en_timp,
                                    timp_total => stimp_ramas,
                                    load_timp => load_timp_total,
                                    timp_ramas => sctimp_ramas
);

end arhUE;
