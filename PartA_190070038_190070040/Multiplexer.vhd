library ieee;
use ieee.std_logic_1164.all;
entity Multiplexer is
	port (I0,I1 : in std_logic_vector(15 downto 0);
			Cntrl : in std_logic;
			F : out std_logic_vector(15 downto 0));
end entity Multiplexer;

architecture Struct of Multiplexer is
	signal notS,T1,T2: std_logic_vector(15 downto 0);
	
	component or_2 is
		port (in1_or,in2_or : in std_logic;
				O_or : out std_logic);
	end component;
	
	component not_2 is
		port (in_not : in std_logic;
            O_not: out std_logic);
	end component;
	
	component and_2 is
		port (in1_and,in2_and : in std_logic; 
				O_and : out std_logic);
	end component;
	
	
begin
-- Multiplexer
	ug0: for i in 0 to 15 generate
				u3: not_2 port map (Cntrl,notS(i));
				u2: and_2 port map (notS(i),I0(i),T1(i));
				u1: and_2 port map (Cntrl,I1(i),T2(i));
				u0: or_2 port map (T2(i),T1(i),F(i));
			end generate;
	
end Struct;

