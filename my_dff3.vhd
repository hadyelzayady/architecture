

Library ieee;
use ieee.std_logic_1164.all;
Entity my_DFF3 is
port(clk,rst, enable,d: in std_logic;
q : out std_logic);
end my_DFF3;

Architecture arch of my_DFF3 is
begin
process(clk,rst)
begin
if(rst = '1') then
        q <= '0';
elsif falling_edge (Clk) then    
	if (enable = '1') then          
 	    q <= d;
  end if;
end if;
end process;
end arch;