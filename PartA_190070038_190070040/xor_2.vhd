library ieee;
use ieee.std_logic_1164.all;
--entity for xor
entity xor_2 is
	port (in1_xor,in2_xor : in std_logic; 
			O_xor : out std_logic);
end entity xor_2;

architecture flow of xor_2 is
	
	begin
		O_xor <= in1_xor xor in2_xor;
end flow;
