library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
       	Clk: in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
end entity ALU;

architecture ALU_arch of ALU is
Component AdderSub16Bit is  
port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
		Sel : in std_logic;
		Cout: out std_logic;
		F : out std_logic_vector(15 downto 0)
	);
END Component;
signal carry:std_logic;
signal sum:std_logic_vector(15 downto 0);
begin
	addersubLabel: AdderSub16Bit port map (A,B,Op(0),carry,sum);
    alu_process : process( clk )
    begin
    	case(Op) is
    			when "00001" => 
    				F <= to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B)));
    			when "00010" => 
    				F <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B)));
    			when "00011" => 
    				F <= sum;
    				Cout <=carry;
    			when others =>
    				null;
    		end case;	
    end process ; -- alu_process

end architecture ALU_arch;
