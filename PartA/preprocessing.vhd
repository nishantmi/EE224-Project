library ieee;
use ieee.std_logic_1164.all;
entity preprocessing is
	port (a,b : in std_logic; 
			g,p : out std_logic);
end entity preprocessing;

architecture Struct of preprocessing is

	component xor_2 is
		port (in1_xor,in2_xor : in std_logic; 
				O_xor : out std_logic);
	end component;

	component and_2 is
		port (in1_and,in2_and : in std_logic; 
				O_and : out std_logic);
	end component;
	
begin
	u0: xor_2 port map (a,b,p);
	u1: and_2 port map (a,b,g);
end Struct;
