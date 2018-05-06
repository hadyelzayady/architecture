

Library ieee;
use ieee.std_logic_1164.all;
Entity DFF_Rising is
port(clk,rst, enable,d: in std_logic;
q : out std_logic);
end DFF_Rising;

Architecture arch of DFF_Rising is
begin
process(clk,rst)
begin
if(rst = '1') then
        q <= '0';
elsif rising_edge (Clk) then    
	if (enable = '1') then          
 	    q <= d;
  end if;
end if;
end process;
end arch;