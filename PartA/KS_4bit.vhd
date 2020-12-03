library ieee;
use ieee.std_logic_1164.all;
entity KS_4bit is
	port (a,b : in std_logic_vector(3 downto 0);
			c_in : in std_logic;
			s : out std_logic_vector(3 downto 0);
			c_out : out std_logic);
end entity KS_4bit;

architecture Struct of KS_4bit is
	signal c,s_temp,p_0,g_0,p_1,g_1,p_2,g_2: std_logic_vector(3 downto 0);

	component preprocessing is
		port (a,b : in std_logic; 
				g,p : out std_logic);
	end component;
	
	component gpcell is
		port (gin_1,gin_2,pin_1,pin_2 : in std_logic; 
				gout,pout : out std_logic);
	end component;
	
	component postprocessing is
		port (g,p,p_i,c_prev,c_in : in std_logic; 
				s,c : out std_logic);
	end component;
	
begin
--	First the pre-processing part
	u0: preprocessing port map (a(0),b(0),g_0(0),p_0(0));
	u1: preprocessing port map (a(1),b(1),g_0(1),p_0(1));
	u2: preprocessing port map (a(2),b(2),g_0(2),p_0(2));
	u3: preprocessing port map (a(3),b(3),g_0(3),p_0(3));
	
--	Now Tree structure
-- First layer
	p_1(0) <= p_0(0);
	g_1(0) <= g_0(0);
	u4: gpcell port map (g_0(0),g_0(1),p_0(0),p_0(1),g_1(1),p_1(1));
	u5: gpcell port map (g_0(1),g_0(2),p_0(1),p_0(2),g_1(2),p_1(2));
	u6: gpcell port map (g_0(2),g_0(3),p_0(2),p_0(3),g_1(3),p_1(3));
	
--	Second Layer
	p_2(0) <= p_1(0);
	g_2(0) <= g_1(0);
	p_2(1) <= p_1(1);
	g_2(1) <= g_1(1);
	
	u7: gpcell port map (g_1(0),g_1(2),p_1(0),p_1(2),g_2(2),p_2(2));
	u8: gpcell port map (g_1(1),g_1(3),p_1(1),p_1(3),g_2(3),p_2(3));
	
--	Now, For the post-processing part
	u9: postprocessing port map(g_2(0),p_2(0),p_0(0),c_in,c_in,s(0),c(0));
	u10: for i in 1 to 3 generate
				u11: postprocessing port map(g_2(i),p_2(i),p_0(i),c(i-1),c_in,s(i),c(i));
			end generate;
--
--	 u9: postprocessing port map(g_2(0),p_2(0),p_0(0),c_in,c_in,s(0),c(0));
--	u10: postprocessing port map(g_2(1),p_2(1),p_0(1),c(0),c_in,s(1),c(1));
--	u11: postprocessing port map(g_2(2),p_2(2),p_0(2),c(1),c_in,s(2),c(2));
--	u12: postprocessing port map(g_2(3),p_2(3),p_0(3),c(2),c_in,s(3),c(3));
	c_out <= c(3);
end Struct;





