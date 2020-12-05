library ieee;
use ieee.std_logic_1164.all;
entity ALU_16bits_BK is
	port (a,b : in std_logic_vector(15 downto 0);
			s0,s1 :in std_logic;
			r : out std_logic_vector(15 downto 0);
			z,c : out std_logic);
end entity ALU_16bits_BK;

architecture Struct of ALU_16bits_BK is
	signal xor16b, nand16b,s0_mux, sum_sub,b_adder_input,r_temp : std_logic_vector(15 downto 0);
	signal s1_not,c_sum : std_logic;

	component BK_16bit is
		port (a,b : in std_logic_vector(15 downto 0);
			c_in : in std_logic;
			s : out std_logic_vector(15 downto 0);
			c_out : out std_logic);
	end component;
	
	component or_2 is
		port (in1_or,in2_or : in std_logic; 
				O_or : out std_logic);
	end component;
	
	component and_2 is
		port (in1_and,in2_and : in std_logic; 
				O_and : out std_logic);
	end component;
	
	component not_2 is
		port (in_not : in std_logic;
            O_not: out std_logic);
	end component;
	
	component xor_2 is
		port (in1_xor,in2_xor : in std_logic; 
				O_xor : out std_logic);
	end component;
	
	component xor_16bit is
		port (a,b : in std_logic_vector(15 downto 0);
			s : out std_logic_vector(15 downto 0));
	end component;
	
	component nand_16bit is
		port (a,b : in std_logic_vector(15 downto 0);
			s : out std_logic_vector(15 downto 0));
	end component;
	
	component Multiplexer is
		port (I0,I1 : in std_logic_vector(15 downto 0);
				Cntrl : in std_logic;
				F : out std_logic_vector(15 downto 0));
	end component;
	
	component zero_check is
		port (r : in std_logic_vector(15 downto 0);
				z : out std_logic);
	end component;
	
begin
--Performing inversion of b is S0 = 1, for subtractor(performing a - b)
	ug0: for i in 0 to 15 generate
			u0: xor_2 port map (b(i),s0,b_adder_input(i));
		end generate;	
	u1: BK_16bit port map (a,b_adder_input,s0,sum_sub,c_sum);
	u2: xor_16bit port map (a,b,xor16b);
	u3: nand_16bit port map (a,b,nand16b);
	
--	Choosing correct output
	u4: Multiplexer port map (nand16b,xor16b,s0,s0_mux);
	u5: Multiplexer port map (sum_sub,s0_mux,s1,r_temp);

	u6: zero_check port map (r_temp,z);
	r <= r_temp;
	
--	Setting carry to 0 for S1 = 1
	u7: not_2 port map (s1,s1_not);
	u8: and_2 port map (s1_not,c_sum,c);
	
end Struct;
