entity Testbench_KS_16bits is
end Testbench_KS_16bits;

architecture tb of Testbench_KS_16bits is
	signal a,b : bit_vector(0 to 15); -- inputs
	signal s : bit_vector(0 to 15); -- outputs
	signal c_out,c_in : bit;
	
	component KS_16bit is
		port (a,b : in bit_vector(0 to 15);
				c_in : in bit;
				s : out bit_vector(0 to 15);
				c_out : out bit);
	end component;

	begin
	-- Connecting test bench signals with xor_2.vhd
	dut_instance_KS_16: KS_16bit port map (a,b,c_in,s,c_out);
	
	process-- inputs
		begin
		a(0) <= '1';
		a(1) <= '1';
		a(2) <= '0';
		a(3) <= '1';
		
		a(4) <= '0';
		a(5) <= '1';
		a(6) <= '0';
		a(7) <= '1';
		
		a(8) <= '1';
		a(9) <= '0';
		a(10) <= '1';
		a(11) <= '1';
		
		a(12) <= '1';
		a(13) <= '0';
		a(14) <= '0';
		a(15) <= '1';
		
		
		b(0) <= '0';
		b(1) <= '1';
		b(2) <= '0';
		b(3) <= '1';
		
		b(4) <= '0';
		b(5) <= '1';
		b(6) <= '1';
		b(7) <= '0';
		
		b(8) <= '1';
		b(9) <= '1';
		b(10) <= '0';
		b(11) <= '1';
		
		b(12) <= '0';
		b(13) <= '0';
		b(14) <= '1';
		b(15) <= '1';
		
		c_in <= '0';
		wait for 5 ns;
		
	end process;
	
end tb ;