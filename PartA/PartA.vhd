entity PartA is
	port (a,b : in bit_vector(0 to 15);
			s0,s1 :in bit;
			r : out bit_vector(0 to 15);
			z,c : out bit);
end entity PartA;

architecture Struct of PartA is
	signal xor16b, nand16b,s0_mux, sum_sub,b_adder_input,r_temp : bit_vector(0 to 15);
	signal s1_not,c_temp,c_sum : bit;

	component KS_16bit is
		port (a,b : in bit_vector(0 to 15);
			c_in : in bit;
			s : out bit_vector(0 to 15);
			c_out : out bit);
	end component;
	
	component or_2 is
		port (in1_or,in2_or : in bit; 
				O_or : out bit);
	end component;
	
	component and_2 is
		port (in1_and,in2_and : in bit; 
				O_and : out bit);
	end component;
	
	component not_2 is
		port (in_not : in bit;
            O_not: out bit);
	end component;
	
	component xor_2 is
		port (in1_xor,in2_xor : in bit; 
				O_xor : out bit);
	end component;
	
	component xor_16 is
		port (a,b : in bit_vector(0 to 15);
			s : out bit_vector(0 to 15));
	end component;
	
	component nand_16 is
		port (a,b : in bit_vector(0 to 15);
			s : out bit_vector(0 to 15));
	end component;
	
	component Multiplexer is
		port (I0,I1 : in bit_vector(0 to 15);
				Cntrl : in bit;
				F : out bit_vector(0 to 15));
	end component;
	
	component zero_check is
		port (r : in bit_vector(0 to 15);
				z : out bit);
	end component;
	
begin
	ug0: for i in 0 to 15 generate
			u0: xor_2 port map (b(i),s0,b_adder_input(i));
		end generate;	
	u1: KS_16bit port map (a,b_adder_input,s0,sum_sub,c_sum);
	u2: xor_16 port map (a,b,xor16b);
	u3: nand_16 port map (a,b,nand16b);
	
	u4: Multiplexer port map (nand16b,xor16b,s0,s0_mux);
	u5: Multiplexer port map (sum_sub,s0_mux,s1,r_temp);

	u6: zero_check port map (r_temp,z);
	r <= r_temp;
	
--	Setting carry to 0 for S1 = 1
	u7: not_2 port map (s1,s1_not);
	u8: and_2 port map (s1_not,c_sum,c_temp);
	u9:  or_2 port map (c_temp,s1,c);
	
end Struct;
