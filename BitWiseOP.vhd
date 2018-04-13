qlibrary ieee;
use ieee.std_logic_1164.all;
entity BitWiseOP is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		F : out std_logic_vector(15 downto 0)
	);
end entity BitWiseOP;

architecture BitWiseOP_arc of BitWiseOP is


begin
	with Sel select
		F <=  A and B when "0100",
			  A or B when "0101",
			  A xor B when "0110",
			  Not A when "0111",
			"0000000000000000" when others;


end BitWiseOP_arc;
