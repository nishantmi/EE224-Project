library ieee;
use ieee.std_logic_1164.all;
entity postprocessing is
	port (g,p,p_i,c_prev,c_in : in std_logic; 
			s,c : out std_logic);
end entity postprocessing;

architecture Struct of postprocessing is
	signal pc_in: std_logic;
	
	component xor_2 is
		port (in1_xor,in2_xor : in std_logic; 
				O_xor : out std_logic);
	end component;
	
	component or_2 is
		port (in1_or, in2_or : in std_logic;
				O_or : out std_logic);
	end component;

	component and_2 is
		port (in1_and,in2_and : in std_logic; 
				O_and : out std_logic);
	end component;
	
begin
	u0: and_2 port map (c_in,p,pc_in);
	u1:  or_2 port map (g,pc_in,c);
	u2: xor_2 port map (p_i,c_prev,s);
end Struct;
