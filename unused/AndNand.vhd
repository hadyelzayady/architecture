library ieee;
use ieee.std_logic_1164.all;
          -- for the ceiling and log constant calculation functions

entity AndNand is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		S0 : in std_logic;
		S1 : in std_logic;
		F : out std_logic_vector(15 downto 0)
		);
end entity AndNand ;

 architecture AndNand_arc of AndNand is
 
 begin
 	-- using when else (if two conditions are true choose the first one)
 	F <=	A and B  when (S1='0' and S0='0') else
 		A or B 	 when (S1='0' and  S0 ='1') else
 		A xor B when (S1='1' and S0 ='0') else
 		Not A;
 	-- using with select (must write all combinations ;no priority as we state the output for each condition)
 	--with std_logic_vector'(S1,S0) select
 	--F <= A and B when "00",
 		--- A or B when "01",
 		-- A xor B when "10",
 		-- Not A when others;
 end  AndNand_arc;