library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is
port(
a,b: in std_logic;
c: out std_logic);
end xor_2;

architecture X of xor_2 is

signal P, Q, R, S: std_logic;

component and_gate
port (a,b: in std_logic;
c: out std_logic);
end component;

component or_gate
port(a,b: in std_logic;
c: out std_logic);
end component;

component not_gate
port(a: in std_logic;
b: out std_logic);
end component;

begin 
u0: not_gate port map(a,P);
u1: not_gate port map(b,Q);
u2: and_gate port map(a,Q,R);
u3: and_gate port map(P,b,S);
u4: or_gate port map(R,S,c);
end X;