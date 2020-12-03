library ieee;
use ieee.std_logic_1164.all;
entity and_2 is
    port (in1_and : in std_logic;
          in2_and : in std_logic;
          O_and : out std_logic
          );
end entity and_2;

architecture arc of and_2 is
begin
   
    O_and <= in1_and and in2_and;
   
end arc;