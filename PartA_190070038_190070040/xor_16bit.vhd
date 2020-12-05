library ieee;
use ieee.std_logic_1164.all;
entity xor_16bit is
	port (a,b : in std_logic_vector(15 downto 0);
			s : out std_logic_vector(15 downto 0));
end entity xor_16bit;

architecture Struct of xor_16bit is

	component xor_2 is
		port (in1_xor,in2_xor : in std_logic; 
				O_xor : out std_logic);
	end component;
	
begin
	ug0: for i in 0 to 15 generate
			u0: xor_2 port map (a(i),b(i),s(i));
		end generate;
end Struct;





