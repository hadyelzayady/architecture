-- 001 mov
-- 010 add
-- 011 sub
-- 100 and
-- 101 or
library ieee;
use ieee.std_logic_1164.all;
entity Op2Reg is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic_vector(2 downto 0);
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity Op2Reg;

architecture ALUC_arc of Op2Reg is

Component AdderSub16Bit is  
port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END Component;
signal sum:std_logic_vector(15 downto 0);
signal carry: std_logic;
begin
	addersubLabel: AdderSub16Bit port map (A,B,Sel(0),carry,sum);
	
	F <= sum when Sel(2 downto 1) = "01" else
		 B when Sel(2 downto 1) ="00" else
		 A and B when Sel(0) ='0' else
		 A or B when Sel(0) ='1' else
		 "0000000000000000"; 
	with Sel(2 downto 1) select
		Cout <= carry when "01",
				'0' when others;
end ALUC_arc;
