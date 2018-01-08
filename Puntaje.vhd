library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Puntaje is
    Port ( equipo : in  STD_LOGIC;
           dp : in  STD_LOGIC;
           tp : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  puntos: out std_logic_vector(6 downto 0)
			  );
			  
end Puntaje;

architecture Behavioral of Puntaje is
signal ap1,ap2: std_logic_vector(6 downto 0) ;
signal a: std_logic_vector(1 downto 0);
begin
a<=tp&dp;
process(equipo,dp,tp,reset,clk)
begin
if(reset='1')then
		ap1<=(others=>'0');
		ap2<=(others=>'0');
elsif(clk'event and clk='1')then 	
	if(equipo='0') then
	case a is  
		when "01"=>	ap1 <= ap1+2;
		when "10"=>ap1<= ap1+3;
		when others => ap1<=ap1;
	end case;
	else
	case a is  
		when "01"=>	ap2 <=ap2+2;
		when "10"=>ap2<=ap2+3;
		when others=>ap2<=ap2;
	end case;
	end if;		
end if;
end process;

--process(ap1,ap2)
--begin
	--if ap1="1100011" or ap2="1100011" then 
		--win<='1';
	--end if;
--end process;
puntos<=ap1 when equipo='0' else
		 ap2;
end Behavioral;

