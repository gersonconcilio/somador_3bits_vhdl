library ieee;
use ieee.std_logic_1164.all;

entity mult_comb is 
	port(
		A,B : in std_logic_vector(2 downto 0);
		S_out	 : out std_logic_vector(5 downto 0)
	);
end mult_comb;

architecture main of mult_comb is 

	signal I,J,K	:  std_logic_vector(2 downto 0); -- TODAS AS ANDS
	signal S			:  std_logic_vector(5 downto 0); -- TODOS AS SOLUÇÕES DE HA E FU 
	signal C2,C3	:  std_logic_vector(1 downto 0); -- TODOS OS CARRYS DENTRO 
	signal C1,C4	:	std_logic;

	component half_adder is
		port(
			A,B 	: in std_logic;
			SUM 	: out std_logic;
			CARRY : out std_logic
		);
	end component half_adder;
	
	component full_adder is 
		port(
			A,B 		: in std_logic;
			CARRY_IN : in std_logic;
			SUM 		: out std_logic;
			CARRY 	: out std_logic
		);	
	end component full_adder;

begin

	I(0) <= A(0) and B(0);
	I(1) <= A(1) and B(0);
	I(2) <= A(2) and B(0);
	
	J(0) <= A(0) and B(1);
	J(1) <= A(1) and B(1);
	J(2) <= A(2) and B(1);
	
	K(0) <= A(0) and B(2);
	K(1) <= A(1) and B(2);
	K(2) <= A(2) and B(2);
	
	HA1 : half_adder port map(I(1),J(0),S(0),C1);
	FA2 : full_adder port map(I(2),J(1),C1,S(1),C2(0));
	HA3 : half_adder port map(J(2),C2(0),S(2),C3(0));
	
	HA4 : half_adder port map(S(1),K(0),S(3),C2(1));	
	FA5 : full_adder port map(S(2),K(1),C2(1),S(4),C3(1));
	FA6 : full_adder port map(C3(0),K(2),C3(1),S(5),C4);
	
	S_out(0) <= I(0);
	S_out(1) <= S(0);
	S_out(2) <= S(3);
	S_out(3) <= S(4);
	S_out(4) <= S(5);
	S_out(5) <= C4;

end main;