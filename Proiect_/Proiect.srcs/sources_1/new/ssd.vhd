library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity afisaj4cifre is
      port (
      clk : in std_logic;
      afis:in std_logic;
      timp : in std_logic_vector(8 downto 0); 
      anod : out std_logic_vector(7 downto 0);
      catod : out std_logic_vector(6 downto 0)
  );
end afisaj4cifre;
architecture structural of afisaj4cifre is
component convertor_4digit is
       port (  
           afis: in std_logic;
           number : in std_logic_vector(8 downto 0);
           digit0 : out std_logic_vector(3 downto 0);
           digit1 : out std_logic_vector(3 downto 0);
           digit2 : out std_logic_vector(3 downto 0);
           digit3 : out std_logic_vector(3 downto 0)
       );
end component;



signal count : std_logic_vector(1 downto 0) := "00";
signal input_decoder: std_logic_vector(3 downto 0);
signal d0,d1,d2,d3: std_logic_vector(3 downto 0);

begin
C1: convertor_4digit port map(afis,timp,d0,d1,d2,d3);
	process(clk)
	begin
	if rising_edge(clk) then 
		count<=count+1;
	end if;
	end process;

--Anozi
	process(count)
	begin
	case count is
	when "00" => anod <="11111110";
	when "01" => anod <="11111101";
	when "10" => anod <="11111011";
	when "11" => anod <="11110111";
	when others => anod <="11111111";
	end case;

	end process;

-- pentru digits
	process(count,d0,d1,d2,d3)
	BEGIN
	case count is
	when "00" => input_decoder <= d0;
	when "01" => input_decoder <= d1;
	when "10" => input_decoder <= d2;
	when "11" => input_decoder <= d3;
	when others => NULL;
	end case;
	end process;
	
process(input_decoder,afis)
	begin
	if afis = '0' then
		case input_decoder is
		when "0000" => catod <= "1000000";  -- 0
        when "0001" => catod <= "1111001";  -- 1
        when "0010" => catod <= "0100100";  -- 2
        when "0011" => catod <= "0110000";  -- 3
        when "0100" => catod <= "0011001";  -- 4
        when "0101" => catod <= "0010010";  -- 5
        when "0110" => catod <= "0000010";  -- 6
        when "0111" => catod <= "1111000";  -- 7
        when "1000" => catod <= "0000000";  -- 8
        when "1001" => catod <= "0010000";  -- 9
        when others => catod <= "1111111";  -- off
		end case;
	else 
		case input_decoder is
         when "1010" => catod <= "0000110"; -- E
         when "1011" => catod <= "0101011"; -- n
         when "1100" => catod <= "0100001"; -- d
         when "1101" => catod <= "1111111"; -- off 
         when others => catod <= "1111111";  -- off
        end case;
		end if;
		end process;
	
end structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity convertor_4digit is
       port (  
           afis: in std_logic;
           number : in std_logic_vector(8 downto 0);
           digit0 : out std_logic_vector(3 downto 0);
           digit1 : out std_logic_vector(3 downto 0);
           digit2 : out std_logic_vector(3 downto 0);
           digit3 : out std_logic_vector(3 downto 0)
       );
   end entity convertor_4digit;
   
architecture Behavioral of convertor_4digit is
       signal ten : integer := 10;
       signal numar :integer range 0 to 10000;
       signal digit00, digit10, digit20,digit30: INTEGER range 0 to 9;
 begin
   process(afis,number,numar,ten)
   begin
     digit0 <= "0000";
     digit1 <= "0000";
     digit2 <= "0000";
     digit3 <= "0000";

    if afis='0' then
       NUMAR <= to_integer(unsigned(number));
       digit30 <= NUMAR / (ten * ten * ten);
       digit20 <= (NUMAR / (ten * ten)) mod ten;
       digit10 <= (NUMAR / ten) mod ten;
       digit00 <= NUMAR mod ten;
   
       digit0 <= std_logic_vector(to_unsigned(digit00, digit0'length));
       digit1 <= std_logic_vector(to_unsigned(digit10, digit1'length));
       digit2 <= std_logic_vector(to_unsigned(digit20, digit2'length));
       digit3 <= std_logic_vector(to_unsigned(digit30, digit3'length));
   else
   if afis='1' then
   digit3 <="1010";
   digit2 <= "1011";
   digit1 <= "1100";
   digit0 <="1101";
end if;
end if;
end process;
end architecture Behavioral;