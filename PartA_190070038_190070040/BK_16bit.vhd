library ieee;
use ieee.std_logic_1164.all;

entity BK_16bit is
	port(a,b: in std_logic_vector(15 downto 0);
		c_in: in std_logic;
		s: out std_logic_vector(15 downto 0);
		c_out: out std_logic);
end BK_16bit;

architecture struc of BK_16bit is

	signal g_0,g_1,g_2,g_3,g_4,g_5,g_6,g_f,p_0,p_1,p_2,p_3,p_4,p_5,p_6,p_f,c: std_logic_vector (15 downto 0);

	component preprocessing 
		port (a,b : in std_logic; 
				g,p : out std_logic);
	end component;

	component gpcell
		port (gin_1,gin_2,pin_1,pin_2 : in std_logic; 
				gout,pout : out std_logic);
	end component;

	component postprocessing
		port (g,p,p_i,c_prev,c_in : in std_logic; 
				s,c : out std_logic);
	end component; 

		begin
--Preprocessing
			u1: for i in 0 to 15 generate
				u1_0: preprocessing port map(a(i),b(i),g_0(i),p_0(i));
			end generate;
--Tree
--First layer
			u2: for i in 0 to 7 generate
				u2_0: gpcell port map(g_0(2*i),g_0((2*i)+1),p_0(2*i),p_0((2*i)+1),g_1((2*i)+1),p_1((2*i)+1));
			end generate;
				
			m_1: for i in 0 to 7 generate
				g_1(2*i) <= g_0(2*i);
				p_1(2*i) <= p_0(2*i);
			end generate;
--	Second Layer
			u3: for i in 0 to 3 generate
				u3_0: gpcell port map(g_1((4*i)+1),g_1((4*i)+3),p_1((4*i)+1),p_1((4*i)+3),g_2((4*i)+3),p_2((4*i)+3));
			end generate;
				
		   u3_1: for i in 0 to 2 generate
				g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
			end generate;
				
			u3_2: for i in 4 to 6 generate
				g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
			end generate;
				
			u3_3: for i in 8 to 10 generate
				g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
			end generate;
				
			u3_4: for i in 12 to 14 generate
				g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
			end generate;
--Third layer
			u4: for i in 0 to 1 generate
				u4_0: gpcell port map(g_2((8*i)+3),g_2((8*i)+7),p_2((8*i)+3),p_2((8*i)+7),g_3((8*i)+7),p_3((8*i)+7));
			end generate;
			
			u4_1: for i in 0 to 6 generate
				g_3(i) <= g_2(i);
				p_3(i) <= p_2(i);
			end generate;
			
			u4_2: for i in 8 to 14 generate
				g_3(i) <= g_2(i);
				p_3(i) <= p_2(i);
			end generate;

--Fourth Layer
			u5: gpcell port map(g_3(7),g_3(15),p_3(7),p_3(15),g_4(15),p_4(15));
--Fifth Layer
			u5_0: for i in 0 to 14 generate
				g_4(i) <= g_3(i);
				p_4(i) <= p_3(i);
			end generate;
--	Sixth Layer
			u6: gpcell port map(g_4(7),g_4(11),p_4(7),p_4(11),g_5(11),p_5(11));

			u6_0: for i in 0 to 10 generate
				g_5(i) <= g_4(i);
				p_5(i) <= p_4(i);
			end generate;
			
			u6_1: for i in 12 to 15 generate
				g_5(i) <= g_4(i);
				p_5(i) <= p_4(i);
			end generate;
--Seventh Layer
			u7: for i in 1 to 3 generate
				x: gpcell port map(g_5((4*i)-1),g_5((4*i)+1),p_5((4*i)-1),p_5((4*i)+1),g_6((4*i)+1),p_6((4*i)+1));
			end generate;
			
			u7_0: for i in 0 to 4 generate
				g_6(i) <= g_5(i);
				p_6(i) <= p_5(i);
			end generate;
			
			u7_1: for i in 6 to 8 generate
				g_6(i) <= g_5(i);
				p_6(i) <= p_5(i);
			end generate;
			
			u7_2: for i in 10 to 12 generate
				g_6(i) <= g_5(i);
				p_6(i) <= p_5(i);
			end generate;
			
			u7_3: for i in 14 to 15 generate
				g_6(i) <= g_5(i);
				p_6(i) <= p_5(i);
			end generate;
--Eight layer
			u8: for i in 1 to 7 generate
				y: gpcell port map(g_6((2*i)-1),g_6(2*i),p_6((2*i)-1),p_6(2*i),g_f(2*i),p_f(2*i));
			end generate;
				
			u8_0: for i in 0 to 7 generate
				g_f((2*i)+1) <= g_6((2*i)+1);
				p_f((2*i)+1) <= p_6((2*i)+1);
			end generate;
				
				g_f(0) <= g_6(0);
				p_f(0) <= p_6(0);
--			Post processing	
			u9: postprocessing port map(g_f(0),p_f(0),p_0(0),c_in,c_in,s(0),c(0));

			u10: for i in 1 to 15 generate
				u11: postprocessing port map(g_f(i),p_f(i),p_0(i),c(i-1),c_in,s(i),c(i));
			end generate;

			c_out <= c(15);

end struc;