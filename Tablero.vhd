----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Pack_Tablero.all;

entity Tablero is
    Port ( clk,reset,equipo,dp,tp,pausa,aumin,aumseg: in  STD_LOGIC;
				seleccion: in std_logic_vector (1 downto 0);
				salida: out std_logic_vector(7 downto 0));
end Tablero;

architecture Behavioral of Tablero is
signal aclk,efecto: std_logic;
signal puntos: std_logic_vector(6 downto 0);
signal segundos: std_logic_vector(2 downto 0);
signal minutos: std_logic_vector(3 downto 0);
signal periodo: std_logic_vector(1 downto 0);
signal timeposesion: std_logic_vector(4 downto 0);
begin
	c1: Puntaje port map(equipo,dp,tp,aclk,reset,puntos);
	c2: DivisorFrecuencia port map(clk,reset,aclk);
	c3: Temporizador port map(aclk,reset,aumin,aumseg,pausa,segundos,minutos,periodo);
	c4: Posesion port map(aclk,pausa,reset,equipo,timeposesion,efecto);
	c5: Visualizacion port map(segundos,minutos,timeposesion,periodo,puntos,equipo,efecto,seleccion,salida);
end Behavioral;

