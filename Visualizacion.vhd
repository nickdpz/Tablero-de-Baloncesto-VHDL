library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Visualizacion is
    Port ( segundos : in  STD_LOGIC_VECTOR(2 downto 0);
           minutos : in  STD_LOGIC_VECTOR(3 downto 0);
           segPosesion : in  STD_LOGIC_VECTOR (4 downto 0);
           periodo : in  STD_LOGIC_VECTOR (1 downto 0);
           puntaje : in  STD_LOGIC_VECTOR(6 downto 0);
           equipo, enable : in  STD_LOGIC;
			  selec:in std_logic_vector(1 downto 0);
           salida : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end Visualizacion;
			  
architecture Behavioral of Visualizacion is
signal y: std_logic_vector(2 downto 0);
begin
y(0)<=(not(enable)and(not(selec(0))))and(not(selec(1)));
y(1)<=(not(enable)and(selec(0))and(not(selec(1))));
y(2)<=(not(enable)and(not(selec(0))))and(selec(1));

salida<=('0')&(minutos&segundos) when y(0)='1' else
		  "ZZZZZZZZ";
salida<=('0')&(segPosesion&periodo) when y(1)='1' else
		  "ZZZZZZZZ";
salida<=puntaje&equipo when y(2)='1' else
			"ZZZZZZZZ";

end Behavioral;