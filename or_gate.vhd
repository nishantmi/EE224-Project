library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port (a,b: in bit;
c: out bit);
end or_gate;

architecture O of or_gate is
begin
c <= a or b;
end O;