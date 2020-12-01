entity and_2 is
    port (in1_and : in bit;
          in2_and : in bit;
          O_and : out bit
          );
end entity and_2;

architecture arc of and_2 is
begin
   
    O_and <= in1_and and in2_and;
   
end arc;