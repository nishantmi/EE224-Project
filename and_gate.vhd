library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
port(
a,b: in std_logic;
c: out std_logic);
end and_gate;

architecture A of and_gate is

begin
c <= a and b;
end A;