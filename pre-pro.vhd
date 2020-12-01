library ieee;
use ieee.std_logic_1164.all;

entity pre-pro is
port(
a,b: in bit;
g,p: out bit);
end pre-pro;

architecture pp of pre-pro is

component xor_2
port(a,b: in bit;
c: out bit);
end component;

component and_gate
port (a,b: in bit;
c: out bit);
end component;

begin
x: and_gate port map(a,b,g);
y: xor_2 port map(a,b,p);
end pp