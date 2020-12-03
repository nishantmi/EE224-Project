library ieee;
use ieee.std_logic_1164.all;
entity nand_16bit is
	port (a,b : in std_logic_vector(15 downto 0);
			s : out std_logic_vector(15 downto 0));
end entity nand_16bit;

architecture Struct of nand_16bit is

	component nand_2 is
		port (in1_nand,in2_nand : in std_logic; 
				O_nand : out std_logic);
	end component;
	
begin
	ug0: for i in 0 to 15 generate
			u0: nand_2 port map (a(i),b(i),s(i));
		end generate;
end Struct;
