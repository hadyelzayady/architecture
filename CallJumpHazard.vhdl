library ieee;
use ieee.std_logic_1164.all;
entity CallJumpHazard is
	port (
		currentRdst:in std_logic_vector(3 downto 0);
		prevRdst:in std_logic_vector(3 downto 0);
		currentRdstVal:in std_logic_vector(15 downto 0);
		prevRdstVal_alu:in std_logic_vector(15 downto 0);
		RdstVal: out std_logic_vector (15 downto 0)
	);
end CallJumpHazard;

architecture CallJumpHazard_arc of CallJumpHazard is
begin
	RdstVal <=  prevRdstVal_alu when currentRdst = prevRdst else
				currentRdstVal;		

end CallJumpHazard_arc;