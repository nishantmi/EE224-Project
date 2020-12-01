entity xor_16bit is
	port (a,b : in bit_vector(0 to 15);
			s : out bit_vector(0 to 15));
end entity xor_16bit;

architecture Struct of xor_16bit is

	component xor_2 is
		port (in1_xor,in2_xor : in bit; 
				O_xor : out bit);
	end component;
	
begin
	ug0: for i in 0 to 15 generate
			u0: xor_2 port map (a(i),b(i),s(i));
		end generate;
end Struct;





