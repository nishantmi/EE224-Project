library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is
port(
a,b: in bit;
c: out bit);
end xor_2;

architecture X of xor_2 is

signal A, B, C, D: bit;

component and_gate
port (a,b: in bit;
c: out bit);
end component;

component or_gate
port(a,b: in bit;
c: out bit);
end component;

component not_gate
port(a: in bit;
b: out bit);
end component;

begin 
p: not_gate port map(a,A);
q: not_gate port map(b,B);
r: and_gate port map(a,B,C);
s: and_gate port map(A,b,D);
t: or_gate port map(C,D,c);
end X;