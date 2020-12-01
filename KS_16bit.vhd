entity KS_16bit is
	port (a,b : in bit_vector(0 to 15);
			c_in : in bit;
			s : out bit_vector(0 to 15);
			c_out : out bit);
end entity KS_16bit;

architecture Struct of KS_16bit is
	signal c,s_temp,p_0,g_0,p_1,g_1,p_2,g_2,p_3,g_3,p_4,g_4: bit_vector(0 to 15);

	component preprocessing is
		port (a,b : in bit; 
				g,p : out bit);
	end component;
	
	component gpcell is
		port (gin_1,gin_2,pin_1,pin_2 : in bit; 
				gout,pout : out bit);
	end component;
	
	component postprocessing is
		port (g,p,p_i,c_prev,c_in : in bit; 
				s,c : out bit);
	end component;
	
begin
--	First the pre-processing part
	ug0: for i in 0 to 15 generate
				u0: preprocessing port map (a(i),b(i),g_0(i),p_0(i));
			end generate;
	
--	Now Tree structure
-- First layer
	p_1(0) <= p_0(0);
	g_1(0) <= g_0(0);
	
	ug1: for j in 1 to 15 generate
				u1: gpcell port map (g_0(j-1),g_0(j),p_0(j-1),p_0(j),g_1(j),p_1(j));
		  end generate;
	
--	Second Layer
	p_2(0) <= p_1(0);
	g_2(0) <= g_1(0);
	p_2(1) <= p_1(1);
	g_2(1) <= g_1(1);
	
	ug2: for k in 2 to 15 generate
				u2: gpcell port map (g_1(k-1),g_1(k),p_1(k-1),p_1(k),g_2(k),p_2(k));
			end generate;

--Third Layer
	ug3: for l in 0 to 4 generate
				p_3(l) <= p_2(l);
				g_3(l) <= g_2(l);
			end generate;
	ug4: for m in 5 to 15 generate
				u3: gpcell port map (g_2(m-1),g_2(m),p_2(m-1),p_2(m),g_3(m),p_3(m));
			end generate;
			
--	Fourth Layer
	ug5: for n in 0 to 7 generate
				p_4(n) <= p_3(n);
				g_4(n) <= g_3(n);
			end generate;
	ug6: for o in 8 to 15 generate
				u4: gpcell port map (g_3(o-1),g_3(o),p_3(o-1),p_3(o),g_4(o),p_4(o));
			end generate;
	
--	Now, For the post-processing part
	u5: postprocessing port map(g_2(0),p_2(0),p_0(0),c_in,c_in,s(0),c(0));
	ug7: for p in 1 to 15 generate
				u6: postprocessing port map(g_4(p),p_4(p),p_0(p),c(p-1),c_in,s(p),c(p));
			end generate;

	c_out <= c(3);
end Struct;





