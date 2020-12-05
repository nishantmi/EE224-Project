library ieee;
use ieee.std_logic_1164.all;
entity zero_check is
	port (r : in std_logic_vector(15 downto 0);
			z : out std_logic);
end entity zero_check;

architecture Struct of zero_check is
	signal prev: std_logic_vector(15 downto 0);
	
	component or_2 is
		port (in1_or,in2_or : in std_logic; 
				O_or : out std_logic);
	end component;
	component not_2 is
		port (in_not : in std_logic;
            O_not: out std_logic);
	end component;
	
begin

	prev(0) <= r(0);
	ug0: for i in 1 to 15 generate
			u0: or_2 port map (r(i),prev(i-1),prev(i));
		end generate;
	u1: not_2 port map (prev(15),z); 
end Struct;

