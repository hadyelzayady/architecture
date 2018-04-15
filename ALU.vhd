library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU is
	port (
		A : in std_logic_vector(15 downto  0);
		B : in std_logic_vector(15 downto  0);
       	Op : in std_logic_vector(4 downto 0);
       	Clk: in std_logic;
		Cin: in std_logic;
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
--CONSTANT  constant_name  :  type_name  : = value
signal carry:std_logic;
signal AdderSecOperand :  std_logic_vector(15 downto  0);

signal sum:std_logic_vector(15 downto 0);
begin
	addersubLabel: AdderSub16Bit port map (A,AdderSecOperand,Op(0),carry,sum);
    with Op select 
        AdderSecOperand <=  x"0001"    when "01000",--inc (first bit must be 0 as in inc so operation is addition)
                            x"0001"    when "01001",--dec
                            B   when others;
    alu_process : process( clk )
    begin
    	case(Op) is
    			when "00000" =>--shift left 
    				F <= to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B)));
    			when "00001" => --shift right
    				F <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B)));
                when "00010" | "00011" | "01000" | "01001"  => --add or sub or inc or dec
                    F <= sum;
                    Cout <=carry;
                when "00100" => --rotate left
                    F(15 downto 1) <= A(14 downto 0) ;
                    Cout <=  A(15);
                    F(0) <= Cin; 
                when "00101" => --rotate right
                    F(14 downto 0) <= A(15 downto 1) ;
                    Cout <=  A(0);
                    F(15) <= Cin;
                when "00110" => --and
                    F <= A and B;
                when "00111" => --or
                    F <= A or B;

    			when others =>
    				null;
    		end case;	
    end process ; -- alu_process

end architecture ALU_arch;
