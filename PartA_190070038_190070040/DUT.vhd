
library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(33 downto 0);
       	output_vector: out std_logic_vector(17 downto 0));
end entity;

architecture DutWrap of DUT is
   component ALU_16bits_BK is
     port (a,b : in std_logic_vector(15 downto 0);
				s0,s1 :in std_logic;
				r : out std_logic_vector(15 downto 0);
				z,c : out std_logic);
   end component;
	component ALU_16bits_KS is
     port (a,b : in std_logic_vector(15 downto 0);
				s0,s1 :in std_logic;
				r : out std_logic_vector(15 downto 0);
				z,c : out std_logic);
   end component;
begin
		
--	add_instance: ALU_16bits_KS
--			port map (
--					-- order of inputs s1 s0 B A
--					s1 => input_vector(33),
--					s0 => input_vector(32),
--					b   => input_vector(31 downto 16),
--					a   => input_vector(15 downto 0),
--               -- order of outputs z c r
--					z => output_vector(17),
--					c => output_vector(16),
--					r => output_vector(15 downto 0));
					
--			Uncomment following and comment above to switch adder implimentations 		
	add_instance: ALU_16bits_BK
			port map (
					-- order of inputs s1 s0 B A
					s1 => input_vector(33),
					s0 => input_vector(32),
					b   => input_vector(31 downto 16),
					a   => input_vector(15 downto 0),
               -- order of outputs z c r
					z => output_vector(17),
					c => output_vector(16),
					r => output_vector(15 downto 0));

end DutWrap;

