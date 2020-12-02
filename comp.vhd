library ieee;
use ieee.std_logic_1164.all;

entity comp is
port(
g1,g2,p1,p2: in std_logic;
go,po: out std_logic);
end comp;

architecture C of comp is

signal A: std_logic;

component and_gate
port (a,b: in std_logic;
c: out std_logic);
end component;

component or_gate
port(a,b: in std_logic;
c: out std_logic);
end component;

begin 
x: and_gate port map(p1,g2,A);
y: or_gate port map(A,g1,go);
z: and_gate port map(p1,p2,po);
end C;