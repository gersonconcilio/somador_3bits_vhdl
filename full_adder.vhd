library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
	port(
		A,B 		: in std_logic;
		CARRY_IN : in std_logic;
		SUM 		: out std_logic;
		CARRY 	: out std_logic
	);	
end full_adder;

architecture rtl of full_adder is

	component half_adder is
		port(
			A,B 	: in std_logic;
			SUM 	: out std_logic;
			CARRY : out std_logic
		);	
	end component half_adder;
	
	signal x,y,z : std_logic;

begin

	CARRY <= z or y;
	
	ha1: half_adder
		port map(
			A 		=> A,
			B 		=> B,
			SUM 	=> x,
			CARRY => y
		);
		
	ha2: half_adder
		port map(x,CARRY_IN,SUM,Z);		

end rtl;
