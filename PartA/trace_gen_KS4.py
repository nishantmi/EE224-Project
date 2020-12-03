'''architecture DutWrap of DUT is
   component KS_16bit is
     port (a,b : in std_logic_vector(15 downto 0);
			c_in : in std_logic;
			s : out std_logic_vector(15 downto 0);
			c_out : out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: KS_16bit
			port map (
					-- order of inputs Cin B A
					c_in => input_vector(32),
					b   => input_vector(31 downto 16),
					a   => input_vector(15 downto 0),
               -- order of outputs c_out s
					c_out => output_vector(16),
					s => output_vector(15 downto 0));

end DutWrap;'''

import random

f = open("TRACEFILE.txt","w")
for adder_in in range(255):  
	adder_b = adder_in>>4
	adder_a = adder_in - (adder_b<<4)
	adder_out = adder_a + adder_b
	c_in = "0"

	adder_in_str = "{:08b}".format(adder_in)
	adder_out_str = "{:05b}".format(adder_out)
	f.write(c_in + adder_in_str + " " + adder_out_str + " 11111\n")
f.close()

