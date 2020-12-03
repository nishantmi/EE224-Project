library ieee;
use ieee.std_logic_1164.all;
entity not_2 is
    port (in_not : in std_logic;
          O_not: out std_logic
          );
end entity not_2;

architecture arc of not_2 is
begin
   
    O_not <= not in_not;
   
end arc;