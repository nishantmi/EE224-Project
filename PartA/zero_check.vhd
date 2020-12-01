entity zero_check is
	port (r : in bit_vector(0 to 15);
			z : out bit);
end entity zero_check;

architecture Struct of zero_check is
	signal prev: bit_vector(0 to 15);
	
	component or_2 is
		port (in1_or,in2_or : in bit; 
				O_or : out bit);
	end component;
	
begin

	prev(0) <= r(0);
	ug0: for i in 1 to 15 generate
			u0: or_2 port map (r(i),prev(i-1),prev(i));
		end generate;
	z <= prev(15);
end Struct;

