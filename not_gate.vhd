library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
port( a: in bit;
b: out bit);
end not_gate;

architecture N of not_gate is
begin
b <= (not a);
end N;