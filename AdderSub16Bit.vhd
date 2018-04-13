library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity AdderSub16Bit is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(3 downto 0);
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity AdderSub16Bit;

architecture AdderSub16Bit_arc of AdderSub16Bit is
component Adder16Bit IS
PORT  (
	a, b : in std_logic_vector(15 downto 0) ;
	F : out std_logic_vector(15 downto 0);
	cout : out std_logic
	);
END component Adder16Bit;
signal tempB : std_logic_vector(15 downto 0);
signal tempCarry: std_logic;
signal tempSum:std_logic_vector(15 downto 0);
begin
	AddSubL:Adder16Bit port map(A,tempB,F,tempCarry);
	with Sel select 
		Cout <= tempCarry when "0000",
				not tempCarry when others;
	with Sel select
		tempB <=  B when "0000",
				  std_logic_vector(unsigned(not B) + 1) when others;--2's complement
				  
--overflow bit= ( (A[15] xor B[15]) and sumop) and (F[15] xnor A[15] )
end AdderSub16Bit_arc;
