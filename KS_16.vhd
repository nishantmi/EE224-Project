library ieee;
use ieee.std_logic_1164.all;

entity KS_16 is
	port(a,b: in bit_vector(0 to 15);
		c_in: in bit;
		s: out bit_vector (0 to 15);
		c_out: out bit);
end KS_16;

architecture struc of KS_16 is

	signal g_0,g_1,g_2,g_3,g_4,p_0,p_1,p_2,p_3,p_4,c: bit_vector (0 to 15);

	component pre-pro 
		port(a,b: in bit;
		g,p: out bit);
	end component;

	component comp
		port(g1,g2,p1,p2: in bit;
		go,po: out bit);
	end component;

	component post-pro
		port(g,p,p_i,c_i,c_0: in bit;
		s,c: out bit);
	end component;

begin

	u0: for i in 0 to 15 generate
		u0_0: pre-pro port map(a(i),b(i),g_0(i),p_0(i));
		end generate;
	
	u1: for i in 1 to 15 generate
		u1_0: comp port map(g_0(i-1),g_0(i),p_0(i-1),p_0(i),g_1(i),p_1(i));
		end generate;
		g_1(0) <= g_0(0);
		p_1(0) <= p_0(0);
	
	u2: for i in 2 to 15 generate
		u2_0: comp port map(g_1(i-2),g_1(i),p_1(i-2),p_1(i),g_2(i),p_2(i));
		end generate;
		u2_1: for i in 0 to 1 generate
		u2_1_0: g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
				end generate;
				
	u3: for i in 4 to 15 generate
		u3_0: comp port map(g_2(i-4),g_2(i),p_2(i-4),p_2(i),g_3(i),p_3(i));
		end generate;
		u3_1: for i in 0 to 3 generate
		u3_1_0: g_3(i) <= g_2(i);
				p_3(i) <= p_2(i);
				end generate;
			
	u4: for i in 8 to 15 generate
		u4_0: comp port map(g_3(i-8),g_3(i),p_3(i-8),p_3(i),g_4(i),p_4(i));
		end generate;
		u4_1: for i in 0 to 7 generate
		u4_1_0: g_4(i) <= g_3(i);
				p_4(i) <= p_3(i);
				end generate;
				
	u5: post-pro port map(g_4(0),p_4(0),p_0(0),c_in,c_in,s(0),c(0));

	u6: for i in 1 to 15 generate
				z: post-pro port map(g_4(i),p_4(i),p_0(i),c(i-1),c_in,s(i),c(i));
				end generate;

	c_out <= c(15);

end struc;
	