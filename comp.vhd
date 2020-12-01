library ieee;
use ieee.std_logic_1164.all;

entity comp is
port(
g1,g2,p1,p2: in bit;
go,po: out bit);
end comp;

architecture C of comp is

signal A: bit;

component and_gate
port (a,b: in bit;
c: out bit);
end component;

component or_gate
port(a,b: in bit;
c: out bit);
end component;

begin 
x: and_gate port map(p1,g2,A);
y: or_gate port map(A,g1,go);
z: and_gate port map(p1,p2,po);
end C;