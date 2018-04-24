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
	dataout : out std_logic_vector(31 downto 0) 
);
end entity syncram;

architecture syncrama of syncram is

type ram_type is array (0 to 1023) of std_logic_vector(15 downto 0);
signal ram : ram_type;

begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram(to_integer(unsigned(address))) <= datain;
			end if;
		end if;
	end process;
	dataout <= ram(to_integer(unsigned(address+1))) & ram(to_integer(unsigned(address)));
end architecture syncrama;



