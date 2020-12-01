entity preprocessing is
	port (a,b : in bit; 
			g,p : out bit);
end entity preprocessing;

architecture Struct of preprocessing is

	component xor_2 is
		port (in1_xor,in2_xor : in bit; 
				O_xor : out bit);
	end component;

	component and_2 is
		port (in1_and,in2_and : in bit; 
				O_and : out bit);
	end component;
	
begin
	u0: xor_2 port map (a,b,p);
	u1: and_2 port map (a,b,g);
end Struct;
