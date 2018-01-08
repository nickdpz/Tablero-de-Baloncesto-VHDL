library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Temporizador is
Port(
clk, reset,aumentomin,aumento,pausa: in std_logic;
segundos: out std_logic_vector(2 downto 0);
minutos:out std_logic_vector(3 downto 0);
periodo:out std_logic_vector(1 downto 0)

);
end Temporizador;

architecture Behavioral of Temporizador is

signal ami: std_logic_vector(3 downto 0);
signal ause: std_logic_vector(3 downto 0);
signal adse: std_logic_vector(2 downto 0);
signal aper: std_logic_vector(1 downto 0);
signal aux :std_logic;

begin
process(pausa,ami,adse,ause,aper)
begin
		if(((aper="11")and(ami="0000")and(adse="000")and(ause="0000"))or(pausa='1')) then
			aux<='1';
			else aux<='0';
		end if;
end process;
process(clk,reset,ami,ause,aux,adse,aper)
	begin 
	if(reset='1')then 
		ause<="0000";
		adse<="000";
		ami<="1100";
		aper<="00";
	elsif(clk'event and clk='1')then	
	case aux is
	when('0') =>
		if(ause="0000")then
			ause<="1001";
			adse<=adse-1;
		else
			ause<=ause-1;
		end if;
		
		if((adse="000")and(ause="0000")and(not(ami="0000")))then
			adse<="101";
			ami<=ami-1;
		end if;
		
		if(ami="0000" and adse="000" and ause="0000") then
			ause<="1001";
			ami<="1100";
			adse<="000";
			aper<=aper+1;
		end if;
	when others=>
	if((aumento='1')and(aumentomin='0'))then
			if(adse="101")then 
				adse<="000";
			if(ami="1011") then
				ami<=ami;
			else
				ami<=ami+1;
			end if;
			else
				adse<=adse+1;
			end if;
	elsif((aumentomin='1')and(aumento='0'))then
			if(ami="1011")then 
			ami<="0000";			
			else
			ami<=ami+1;
			end if;
	else
		ause<=ause;
		adse<=adse;
		ami<=ami;
		aper<=aper;
	end if;
	end case;
	
end if;
end process;
segundos<=adse;
minutos<=ami;
periodo<=aper;
end Behavioral;

