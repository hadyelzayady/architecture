library ieee;
use ieee.std_logic_1164.all;
entity PartC is
	port (
		A : in std_logic_vector(15 downto  0);
		--B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		imm: in std_logic(15 downto 0)
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity PartC;

architecture ALUC_arc of PartC is

begin
		F(14 downto 0) <= A(15 downto 1) ;
						   
        Cout <= A(0);
		with Sel select
		F(15) <= '0' when "1000" ,--shift right	
				cin when "1010",--rotate right
				'0' when others;
end ALUC_arc;
