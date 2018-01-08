library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity DivisorFrecuencia is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end DivisorFrecuencia;

architecture Behavioral of DivisorFrecuencia is

signal ep, ef: std_logic_vector(25 downto 0);--10111110101111000010000000--
begin
process(ep)
	begin
	if(ep="10111110101111000010000000")then 
		salida<='1';
		ef<=(others=>'0');	
	else
		salida<='0'; 
		ef<=ep+1;
	end if; 
end process;

process(clk,reset)
	begin 
	if(reset='1')then 
		ep<=(others=>'0');
	elsif(clk'event and clk='1')then
		ep<=ef;
	end if;
end process;

end Behavioral;

