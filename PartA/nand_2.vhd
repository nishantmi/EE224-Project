library ieee;
use ieee.std_logic_1164.all;
entity nand_2 is
    port (in1_nand : in std_logic;
          in2_nand : in std_logic;
          O_nand : out std_logic
          );
end entity nand_2;

architecture arc of nand_2 is
begin
   
    O_nand <= in1_nand nand in2_nand;
   
end arc;