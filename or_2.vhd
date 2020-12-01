entity or_2 is
    port (in1_or : in bit;
          in2_or : in bit;
          O_or : out bit
          );
end or_2;

architecture arc of or_2 is
begin
   
    O_or <= in1_or or in2_or;
   
end arc;