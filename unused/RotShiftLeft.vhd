
library ieee;
use ieee.std_logic_1164.all;
entity PartD is
	port (
		A : in std_logic_vector(15 downto  0);
		--B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity PartD;

architecture ALUD_arc of PartD is

begin
		F(15 downto 1) <= A(14 downto 0) ;
			Cout <=  A(15);			   
		
		with Sel select
		F(0) <=  '0' when "1100" ,
				A(15) when "1101",
				cin when "1110",
				'0' when others;
		
end ALUD_arc;

