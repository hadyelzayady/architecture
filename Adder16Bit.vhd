
Library ieee;
Use ieee.std_logic_1164.all; 
ENTITY Adder16Bit is  
PORT    (a, b : in std_logic_vector(15 downto 0) ;
	F : out std_logic_vector(15 downto 0);
	cout : out std_logic;
	Overflow:out std_logic
	);
END Adder16Bit;

Architecture Adder16Bit_arch of Adder16Bit is

Component FullAdder is
port( a,b,cin : in std_logic;s,cout : out std_logic);
end component;

Component HalfAdder is
port( a,b : in std_logic;s,cout : out std_logic);
end component;

signal temp : std_logic_vector(15 downto 0);

begin
f0 : HalfAdder port map(a(0),b(0),F(0),temp(0));
loop1: for i in 1 to 15 generate
fx: FullAdder port map(a(i),b(i),temp(i-1),F(i),temp(i));
end generate;
Overflow <= temp(14) xor temp(15);
cout <= temp(15);
end Adder16Bit_arch;
