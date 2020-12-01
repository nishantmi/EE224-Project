entity Multiplexer is
	port (I0,I1 : in bit_vector(0 to 15);
			Cntrl : in bit;
			F : out bit_vector(0 to 15));
end entity Multiplexer;

architecture Struct of Multiplexer is
	signal notS,T1,T2: bit_vector(0 to 15);
	
	component or_2 is
		port (in1_or,in2_or : in bit;
				O_or : out bit);
	end component;
	
	component not_2 is
		port (in_not : in bit;
            O_not: out bit);
	end component;
	
	component and_2 is
		port (in1_and,in2_and : in bit; 
				O_and : out bit);
	end component;
	
	
begin
-- Multiplexer
	ug0: for i in 0 to 15 generate
				u3: not_2 port map (Cntrl,notS(i));
				u2: and_2 port map (notS(i),I0(i),T1(i));
				u1: and_2 port map (Cntrl,I1(i),T2(i));
				u0: or_2 port map (T2(i),T1(i),F(i));
			end generate;
	
end Struct;

