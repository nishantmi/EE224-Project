library ieee;
use ieee.std_logic_1164.all;

entity xor_16 is 
port(a,b : in std_logic_vector(0 to 15);
c: out std_logic_vector(0 to 15));
end xor_16;

architecture X_16 of xor_16 is

component xor_2
port(a,b: in std_logic;
c: out std_logic);
end component;

begin

u0: for i in 0 to 15 generate
	u0_0: xor_2 port map(a(i),b(i),c(i));
	end generate;

end x_16;