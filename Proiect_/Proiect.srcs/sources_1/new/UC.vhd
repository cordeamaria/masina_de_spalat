----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 04:19:12 PM
-- Design Name: 
-- Module Name: organigrama - Behavioral
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
use IEEE.NUMERIC_STD.ALL; -- Uncomment this line for arithmetic operations

entity UC is
    Port ( 
        clk : in std_logic;
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
        load_timp_total : out std_logic
    );
end UC;

architecture arhUC of UC is
    type stare_t is (
        Stare_Init, Asteptare, S1, S2, S3, S4, S5, 
        E11, E12, E13, S6, E21, E22, E23, S7, 
        E31, S8, E41, S9, E51, S10, S11, S12, S13
    );
    signal stare, next_stare : stare_t;

    component debouncer_30ns is
        Port ( 
            btn : in STD_LOGIC;
            clk : in STD_LOGIC;
            btn_out : out STD_LOGIC
        );
    end component;

    signal start_buton_f : std_logic;

begin

    
    debouncer_30nspm: debouncer_30ns port map (
        btn => start_buton,
        clk => clk,
        btn_out => start_buton_f
    );

   
    ACTUALIZEAZA_STARE: process (rst, clk)
    begin 
        if rst = '1' then
            stare <= Stare_Init;
        elsif rising_edge(clk) then
            stare <= next_stare;
        end if;
    end process;

 
    IESIRI_IN_FUNCTIE_DE_STARE_CURENTA: process (stare)
    begin 
       
        usa_in <= '0';
        usa_bl <= '0';
        etapa1 <= '0';
        etapa2 <= '0';    
        etapa3 <= '0';
        etapa4 <= '0';
        etapa5 <= '0';
        en_timp <= '0';
        en10 <= '0';
        en20 <= '0';
        en1 <= '0';
        en_1min <= '0';
        en_2sec <= '0';
        en_apa <= '0';
        start_pr <= '0';
        load_timp_total <= '0';
        afis <= '0';
        
        case stare is 
            when Stare_Init => 
                NULL;
            when Asteptare => 
                NULL;
            when S1 => 
                NULL;
            when S2 =>
                NULL;
            when S3 =>
                NULL;
            when S4 =>
                usa_in <= '1';
            when S5 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                load_timp_total <= '1';
           when S6 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
           when E11 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en_apa <= '1';
                etapa1 <= '1';
           when E12 => 
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                etapa1 <= '1';
           when E13 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en_1min <= '1';
                en10 <= '1';
                etapa1 <= '1';
           when S7 => 
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
           when E21 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en_apa <= '1';
                etapa2 <= '1';
            when E22 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                etapa2 <= '1';
            when E23 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en_1min <= '1';
                en20 <= '1';
                etapa2 <= '1';
            when S8 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
            when E31 => 
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en_1min <= '1';
                en10 <= '1';
                etapa3 <= '1';
            when S9 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
            when E41 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en10 <= '1';
                en_2sec <= '1';
                en_1min <= '1';
                etapa4 <= '1';
            when S10 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
            when E51 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en10 <= '1';
                en_2sec <= '1';
                en_1min <= '1';
                etapa5 <= '1';
            when S11 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
            when S12 =>
                usa_in <= '1';
                usa_bl <= '1';
                start_pr <= '1';
                en_timp <= '1';
                en_2sec <= '1';
                en1 <= '1';
                en_1min <= '1';
            when S13 =>
                usa_in <= '1';
                start_pr <= '1';
                afis <= '1';
            when others =>
                NULL;
        end case;
    end process;

    -- State transition logic
TRANZITII: process (stare, usa, start_buton_f, op_PS, op_CS, T10, T20, T1, start_conf, temp_fin_ok, mod_man_aut)
    begin
        case stare is
            when Stare_Init =>
                next_stare <= Asteptare;
            when Asteptare =>
                if mod_man_aut = '1' then 
                    next_stare <= S1;
                else 
                    next_stare <= S2;
                end if;
            when S1 =>
                next_stare <= S3;
            when S2 =>
                next_stare <= S3;
            when S3 =>
                if usa = '1' then 
                    next_stare <= S4;
                else 
                    next_stare <= S3;
                end if;
            when S4 =>
                if start_buton_f = '1' and start_conf = '1' then 
                    next_stare <= S5;
                else 
                    next_stare <= S4;
                end if;
            when S5 =>
                next_stare <= S6;
            when S6 =>
                if op_PS = '1' then 
                    next_stare <= E11;
                else 
                    next_stare <= S7;
                end if;
            when E11 =>
                if temp_fin_ok = '1' then 
                    next_stare <= E12;
                else 
                    next_stare <= E11;
                end if;
             when E12 =>
                next_stare <= E13;
             when E13 =>
                if T10 = '1' then 
                    next_stare <= S7;
                else 
                    next_stare <= E13;
                end if;
             when S7 =>
                next_stare <= E21;
             when E21 =>
                if temp_fin_ok = '1' then 
                    next_stare <= E22;
                else
                    next_stare <= E21;
                end if;
             when E22 =>
                next_stare <= E23;
             when E23 =>
                if T20 = '1' then
                    next_stare <= S8;
                else 
                    next_stare <= E23;
                end if;
            when S8 =>
                next_stare <= E31;
            when E31 => 
                if T10 = '1' then
                    next_stare <= S9;
                else 
                    next_stare <= E31;
                end if;
            when S9 =>
                if op_CS = '1' then
                    next_stare <= E41;
                else
                    next_stare <= S10;
                end if;
            when E41 =>
                if T10 = '1' then 
                    next_stare <= S10;
                else 
                    next_stare <= E41;
                end if;
            when S10 =>
                next_stare <= E51;
            when E51 =>
                if T10 = '1' then 
                    next_stare <= S11;
                else
                    next_stare <= E51;
                end if;
            when S11 =>
                next_stare <= S12;
            when S12 =>
                if T1 = '1' then     
                    next_stare <= S13;
                else
                    next_stare <= S12;
                end if;
            when S13 => 
                if usa = '0' then
                    next_stare <= Stare_Init;
                else
                    next_stare <= S13;
                end if;
            when others =>
                NULL;
        end case;
    end process;

end arhUC;

