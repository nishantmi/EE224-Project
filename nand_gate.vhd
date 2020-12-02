library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
port(
a,b: in std_logic;
c: out std_logic);
end nand_gate;

architecture N of nand_gate is

signal x: std_logic;

component and_gate
port (a,b: in std_logic;
c: out std_logic);
end component;

component not_gate
port(a: in std_logic;
b: out std_logic);
end component;

begin

u0: and_gate port map(a,b,x);
u1: not_gate port map(x,c);

end N;
