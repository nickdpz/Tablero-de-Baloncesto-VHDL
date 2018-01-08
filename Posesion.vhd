library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Posesion is
    Port ( clk,pausa,reset,equipo: in  STD_LOGIC;  
			  posesion: out std_logic_vector(4 downto 0);
           efecto : out  STD_LOGIC);
end Posesion;

architecture Behavioral of Posesion is
signal reloj: STD_LOGIC_VECTOR (4 downto 0);
signal equipop: STD_LOGIC;
signal igual :std_logic;

begin
igual<=((equipop)xor(equipo));
process(clk,reset,igual,equipo)
	begin 
	if((reset='1')or(igual='1'))then 
		reloj<="11000";
		efecto<='0';
		equipop<=equipo;
	elsif(clk'event and clk='1')then
	
	if(pausa='0')then
		if(reloj="00000")then
			efecto<='1';
		else 
			reloj<=reloj-1;
		end if;
	else
			reloj<=reloj;
	end if;
	
	equipop<=equipo;
	
	end if;
end process;
posesion<=reloj;
end Behavioral;

