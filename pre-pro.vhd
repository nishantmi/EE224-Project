library ieee;
use ieee.std_logic_1164.all;

entity pre_pro is
port(
a,b: in std_logic;
g,p: out std_logic);
end pre_pro;

architecture pp of pre_pro is

component xor_2
port(a,b: in std_logic;
c: out std_logic);
end component;

component and_gate
port (a,b: in std_logic;
c: out std_logic);
end component;

begin
x: and_gate port map(a,b,g);
y: xor_2 port map(a,b,p);
end pp;