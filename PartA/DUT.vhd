-- A DUT entity is used to wrap your design.
library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(33 downto 0);
       	output_vector: out std_logic_vector(17 downto 0));
end entity;

architecture DutWrap of DUT is
   component KS_16bit is
     port (a,b : in std_logic_vector(15 downto 0);
			c_in : in std_logic;
			s : out std_logic_vector(15 downto 0);
			c_out : out std_logic);
   end component;
	component PartA is
     port (a,b : in std_logic_vector(15 downto 0);
				s0,s1 :in std_logic;
				r : out std_logic_vector(15 downto 0);
				z,c : out std_logic);
   end component;
begin
		
	add_instance: PartA
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
		
--   add_instance: KS_16bit
--			port map (
--					-- order of inputs Cin B A
--					c_in => input_vector(32),
--					b   => input_vector(31 downto 16),
--					a   => input_vector(15 downto 0),
--               -- order of outputs c_out s
--					c_out => output_vector(16),
--					s => output_vector(15 downto 0));
					
--	add_instance: KS_4bit
--			port map (
--					-- order of inputs Cin B A
--					c_in => input_vector(8),
--					b   => input_vector(7 downto 4),
--					a   => input_vector(3 downto 0),
--               -- order of outputs c_out s
--					c_out => output_vector(4),
--					s => output_vector(3 downto 0));

end DutWrap;

