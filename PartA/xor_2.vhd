--entity for xor
entity xor_2 is
	port (in1_xor,in2_xor : in bit; 
			O_xor : out bit);
end entity xor_2;

architecture flow of xor_2 is
	
	begin
		O_xor <= in1_xor xor in2_xor;
end flow;
