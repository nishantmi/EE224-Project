	# add_instance: PartA
	# 		port map (
	# 				-- order of inputs s1 s0 B A
	# 				s1 => input_vector(33),
	# 				s0 => input_vector(32),
	# 				b   => input_vector(31 downto 16),
	# 				a   => input_vector(15 downto 0),
 #               -- order of outputs z c r
	# 				z => output_vector(17),
	# 				c => output_vector(16),
	# 				s => output_vector(15 downto 0));

import random

f = open("TRACEFILE.txt","w")

for num in range(10000):
	select = random.randrange(3)
	# select = 1
	lim = 2**15
	a = random.randrange(65536)
	b = random.randrange(65536)
	input_vector = (b<<16) + a
	if select == 0:
		output_vector = a + b
	elif select == 1:
		output_vector = a + (b^(2**16 - 1)) + 1
		# output_vector = output_vector%(2**16)
	elif select == 2:
		output_vector = (a&b)^(2**16 - 1)
	elif select == 3:
		output_vector = a^b

	if output_vector == 0:
		z = 1
	else:
		z = 0

	select_string = "{:02b}".format(select)
	in_str = "{:032b}".format(input_vector)
	z_str = "{:01b}".format(z)
	out_str = "{:017b}".format(output_vector)
	
	f.write(select_string + in_str + " " + z_str + out_str + " 111111111111111111\n")
f.close()

