library ieee;
use ieee.std_logic_1164.all;
entity Op2Reg is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity Op2Reg;

architecture ALUC_arc of Op2Reg is

begin
	with Sel select
		F <= A
end ALUC_arc;
