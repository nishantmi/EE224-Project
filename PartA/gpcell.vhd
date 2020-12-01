entity gpcell is
	port (gin_1,gin_2,pin_1,pin_2 : in bit; 
			gout,pout : out bit);
end entity gpcell;

architecture Struct of gpcell is
	signal prop: bit;
	
--	component xor_2 is
--		port (in1_xor,in2_xor : in bit; 
--				O_xor : out bit);
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
	u0: and_2 port map (pin_2,gin_1,prop);
	u1:  or_2 port map (prop,gin_2,gout);
	u2: and_2 port map (pin_1,pin_2,pout);
end Struct;
