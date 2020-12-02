library ieee;
use ieee.std_logic_1164.all;

entity post_pro is
port(
g,p,p_i,c_i,c_0: in std_logic;
s,c: out std_logic);
end post_pro;

architecture Pp of post_pro is

signal k: std_logic;

component and_gate
port (a,b: in std_logic;
c: out std_logic);
end component;

component or_gate
port(a,b: in std_logic;
c: out std_logic);
end component;

component xor_2
port(a,b: in std_logic;
c: out std_logic);
end component;

begin
x: and_gate port map(p,c_0,k);
y: or_gate port map(k,g,c);
z: xor_2 port map(c_i,p_i,s);
end Pp;