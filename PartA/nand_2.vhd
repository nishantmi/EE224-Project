entity nand_2 is
    port (in1_nand : in bit;
          in2_nand : in bit;
          O_nand : out bit
          );
end entity nand_2;

architecture arc of nand_2 is
begin
   
    O_nand <= in1_nand nand in2_nand;
   
end arc;