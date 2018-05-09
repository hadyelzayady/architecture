library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ShiftOperation is
	port (
		A: in std_logic_vector(15 downto  0);
		Imm: in std_logic_vector(15 downto 0);
		Sel: in std_logic;
		F : out std_logic_vector(15 downto 0)		
			);
end ShiftOperation;

architecture ShiftOperation_arc of ShiftOperation is

begin
	F <= to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(Imm)));
end ShiftOperation_arc;
