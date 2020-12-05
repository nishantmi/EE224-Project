library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity Testbench_manual is
end entity;
architecture Behave of Testbench_manual is
	signal input_vector: std_logic_vector(33 downto 0);    
	signal output_vector: std_logic_vector(17 downto 0);

	component DUT is
		port(input_vector: in std_logic_vector(33 downto 0);    
				output_vector: out std_logic_vector(17 downto 0));
   end component;
  
begin 

	process
--First two bits: S1 S0(Control bits)
--Next 16 bits: b
--Last 16 bits: a
	begin
--	Testing only corner cases
-- For Addition
		input_vector <= "0000000000000000000000000000000000"; -- Output:10 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "0011111111111111111111111111111111"; -- Output:01 1111 1111 1111 1110
		wait for 5 ns;
		input_vector <= "0001010101010101011010101010101010"; -- Output:00 1111 1111 1111 1111
		wait for 5 ns;
		input_vector <= "0010101010101010110101010101010101"; -- Output:11 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "0001101101101101100011011011011011"; -- Output:00 1010 0100 1001 0001
		wait for 5 ns;

--	Testing only corner cases
---- For Subtraction
--Note: Subtraction = a - b
		input_vector <= "0100000000000000000000000000000000"; -- Output:11 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "0111111111111111110000000000000000"; -- Output:00 0000 0000 0000 0001
		wait for 5 ns;
		input_vector <= "0101110101001100001111010100110000"; -- Output:01 1000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "0100010110111100000011110000110000"; -- Output:01 0010 0101 0100 0000
		wait for 5 ns;
		input_vector <= "0111110101001100001010101010101010"; -- Output:00 1011 0101 0111 1010
		wait for 5 ns;

----	Testing only corner cases
---- For NAND
		input_vector <= "1000000000000000000000000000000001"; -- Output:00 1111 1111 1111 1111
		wait for 5 ns;
		input_vector <= "1011111111111111111111111111111111"; -- Output:10 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "1000000000111111110000111111110000"; -- Output:00 1111 1111 0000 1111
		wait for 5 ns;
		input_vector <= "1001001010101010011101010101110100"; -- Output:00 1011 1111 1101 1111
		wait for 5 ns;
		input_vector <= "1000000000000001111111111111110101"; -- Output:00 1111 1111 1111 1010
		wait for 5 ns;

----	Testing only corner cases
---- For XOR
		input_vector <= "1101010101010101011110100011101010"; -- Output:00 1011 1011 0111 1111
		wait for 5 ns;
		input_vector <= "1111111111111111111111111111111111"; -- Output:10 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "1100101010010101000010101001010100"; -- Output:10 0000 0000 0000 0000
		wait for 5 ns;
		input_vector <= "1100000000111111110011001100110011"; -- Output:00 0011 0011 1100 1100
		wait for 5 ns;
		input_vector <= "1100001111000011110011001100110011"; -- Output:00 0011 1100 0011 1100
		wait for 5 ns;

	end process;
	dut_instance: DUT
				port map (
					-- order of inputs s1 s0 B A
					input_vector,
               -- order of outputs z c r
					output_vector);
end Behave;
