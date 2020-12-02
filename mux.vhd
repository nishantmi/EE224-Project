library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
A1,A2,A3,A4: in std_logic_vector(0 to 15);
s: in std_logic_vector(0 to 1);
X: out std_logic_vector(0 to 15));
end mux;

architecture M of mux is

begin 

with s select

X <= A1 when "00",
	  A2 when "01",
	  A3 when "10",
	  A4 when "11";
	  
end M;