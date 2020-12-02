library ieee;
use ieee.std_logic_1164.all;

entity zero is 
	port(x: in std_logic_vector(0 to 15);
		z: out std_logic);
end zero;

architecture Z of zero is

signal x_0: std_logic_vector(0 to 15);

component or_gate
port(a,b: in std_logic;
c: out std_logic);
end component;

begin

x_0(0) <= x(0);

u: for i in 1 to 15 generate
	u_0: or_gate port map(x(i),x_0(i-1),x_0(i));
	end generate;

z <= x_0(15);

end Z;