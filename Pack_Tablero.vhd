library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Pack_Tablero is

component DivisorFrecuencia 
  Port ( clk : in  STD_LOGIC;
         reset : in  STD_LOGIC;
         salida : out  STD_LOGIC
			);
end component;

component Puntaje
Port( equipo : in  STD_LOGIC;
		dp : in  STD_LOGIC;
      tp : in  STD_LOGIC;
      clk : in  STD_LOGIC;
      reset : in  STD_LOGIC;
		puntos: out std_logic_vector(6 downto 0)
		);
end component;

component Temporizador is
Port(	clk, reset,aumentomin,aumento,pausa: in std_logic;
		segundos: out std_logic_vector(2 downto 0);
		minutos:out std_logic_vector(3 downto 0);
		periodo:out std_logic_vector(1 downto 0)
		);
end component;

component Posesion is
    Port ( clk,pausa,reset,equipo: in  STD_LOGIC;  
			  posesion: out std_logic_vector(4 downto 0);
           efecto : out  STD_LOGIC
		);
end component;
component Visualizacion is
Port ( segundos : in  STD_LOGIC_VECTOR(2 downto 0);
       minutos : in  STD_LOGIC_VECTOR(3 downto 0);
       segPosesion : in  STD_LOGIC_VECTOR (4 downto 0);
       periodo : in  STD_LOGIC_VECTOR (1 downto 0);
       puntaje : in  STD_LOGIC_VECTOR(6 downto 0);
       equipo, enable : in  STD_LOGIC;
		 selec:in std_logic_vector(1 downto 0);
       salida : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end component;
end Pack_Tablero;

