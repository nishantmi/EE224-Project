library ieee;
use ieee.std_logic_1164.all;

entity nand_16 is
port(a,b : in std_logic_vector(0 to 15);
c: out std_logic_vector(0 to 15));
end nand_16;

architecture N_16 of nand_16 is

component nand_gate
port(a,b: in std_logic;
c: out std_logic);
end component;

begin

u: for i in 0 to 15 generate
	u_0: nand_gate port map(a(i),b(i),c(i));
	end generate;
	
end N_16;