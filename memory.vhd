library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Entity syncram is
port 
( 
	clk : in std_logic;
	we : in std_logic;
	address : in std_logic_vector(9 downto 0);
	datain : in std_logic_vector(15 downto 0);
	flagreg : in std_logic_vector(3 downto 0);
	flag32write:in std_logic;
	returnflags:in std_logic_vector(1 downto 0);
	dataout : out std_logic_vector(15 downto 0);
	dataflag:out std_logic_vector( 3 downto 0)
);
end entity syncram;

architecture syncrama of syncram is

type ram_type is array (0 to 1023) of std_logic_vector(15 downto 0);
signal ram : ram_type;
signal temporary:std_logic_vector(15 downto 0);
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram(to_integer(unsigned(address))) <= datain;
				if(flag32write='1' ) then
					ram(to_integer(unsigned(address))-1) <= "000000000000"&flagreg;
				end if;					
			end if;
		end if;
	end process;
	dataout <= ram(to_integer(unsigned(address)));
	temporary<=ram(to_integer(unsigned(address))-1) when returnflags="11"  and address > "0000000000" else  (others => '0');
	dataflag<=  temporary(3 downto 0) when returnflags="11"  and address > "0000000000"  else flagreg;
end architecture syncrama;



