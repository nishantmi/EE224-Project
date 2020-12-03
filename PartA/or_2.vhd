library ieee;
use ieee.std_logic_1164.all;
entity or_2 is
    port (in1_or : in std_logic;
          in2_or : in std_logic;
          O_or : out std_logic
          );
end entity or_2;

architecture arc of or_2 is
begin
   
    O_or <= in1_or or in2_or;
   
end arc;