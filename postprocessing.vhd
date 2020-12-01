entity postprocessing is
	port (g,p,p_i,c_prev,c_in : in bit; 
			s,c : out bit);
end entity postprocessing;

architecture Struct of postprocessing is
	signal pc_in: bit;
	
	component xor_2 is
		port (in1_xor,in2_xor : in bit; 
				O_xor : out bit);
	end component;
	
--	component not_2 is
--		port (in_not : in bit;
--				O_not: out bit);
--	end component;
	
	component or_2 is
		port (in1_or, in2_or : in bit;
				O_or : out bit);
	end component;

	component and_2 is
		port (in1_and,in2_and : in bit; 
				O_and : out bit);
	end component;
	
begin
	u0: and_2 port map (c_in,p,pc_in);
	u1:  or_2 port map (g,pc_in,c);
	u2: xor_2 port map (p_i,c_prev,s);
end Struct;
