entity not_2 is
    port (in_not : in bit;
          O_not: out bit
          );
end not_2;

architecture arc of not_2 is
begin
   
    O_not <= not in_not;
   
end arc;