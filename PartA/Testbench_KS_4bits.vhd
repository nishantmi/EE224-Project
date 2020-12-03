library ieee;
use ieee.std_logic_1164.all;
entity Testbench_KS_4bits is
end Testbench_KS_4bits;

architecture tb of Testbench_KS_4bits is
	signal a,b : bit_vector(0 to 3); -- inputs
	signal s : bit_vector(0 to 3); -- outputs
	signal c_out,c_in : bit;
	
	component KS_4bit is
		port (a,b : in bit_vector(0 to 3);
				c_in : in bit;
				s : out bit_vector(0 to 3);
				c_out : out bit);
	end component;

	begin
	-- Connecting test bench signals with xor_2.vhd
	dut_instance_KS_4: KS_4bit port map (a,b,c_in,s,c_out);
	
	process-- inputs
		begin
		a(0) <= '1';
		a(1) <= '0';
		a(2) <= '0';
		a(3) <= '1';
		
		b(0) <= '0';
		b(1) <= '0';
		b(2) <= '1';
		b(3) <= '1';
		
		c_in <= '0';
		wait for 5 ns;
		a(0) <= '1';
		a(1) <= '1';
		a(2) <= '1';
		a(3) <= '1';
		
		b(0) <= '1';
		b(1) <= '0';
		b(2) <= '1';
		b(3) <= '0';
		
		c_in <= '0';
		wait for 5 ns;
		a(0) <= '1';
		a(1) <= '0';
		a(2) <= '0';
		a(3) <= '1';
		
		b(0) <= '1';
		b(1) <= '1';
		b(2) <= '1';
		b(3) <= '0';
		
		c_in <= '0';
		wait for 5 ns;
		a(0) <= '0';
		a(1) <= '1';
		a(2) <= '0';
		a(3) <= '1';
		
		b(0) <= '1';
		b(1) <= '0';
		b(2) <= '1';
		b(3) <= '0';
		
		c_in <= '0';
		wait for 5 ns;
		
	end process;
	
end tb ;