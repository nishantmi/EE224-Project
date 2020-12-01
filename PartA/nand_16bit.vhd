entity nand_16bit is
	port (a,b : in bit_vector(0 to 15);
			s : out bit_vector(0 to 15));
end entity nand_16bit;

architecture Struct of nand_16bit is

	component nand_2 is
		port (in1_nand,in2_nand : in bit; 
				O_nand : out bit);
	end component;
	
begin
	ug0: for i in 0 to 15 generate
			u0: nand_2 port map (a(i),b(i),s(i));
		end generate;
end Struct;
