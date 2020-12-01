library ieee;
use ieee.std_logic_1164.all;

entity post-pro is
port(
g,p,p_i,c_i,c_0: in bit;
s,c: out bit);
end post-pro;

architecture Pp of post-pro is

signal k: bit;

component and_gate
port (a,b: in bit;
c: out bit);
end component;

component or_gate
port(a,b: in bit;
c: out bit);
end component;

component xor_2
port(a,b: in bit;
c: out bit);
end component;

begin
x: and_gate port map(p,c_0,k);
y: or_gate port map(k,g,c);
z: xor_2 port map(c_i,p_i,s);
end Pp;