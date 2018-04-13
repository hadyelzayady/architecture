library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(3 downto 0);
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity ALU;

architecture ALU_arch of ALU is
Component AdderSub16Bit is  
port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END Component;

begin
	



end architecture ALU_arch;
