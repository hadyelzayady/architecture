Library ieee;
Use ieee.std_logic_1164.all;

entity Decoder is
	port (
		Clk : in std_logic;
		InstCode:in std_logic_vector(15 downto 0);
		port1_data:out std_logic_vector(15 downto 0);
		port2_data:out std_logic_vector(15 downto 0);
		Rst:in std_logic
	);
end Decoder;

architecture Decoder_arc of Decoder is
	component RegisterFile is
		port (
			w_en : in std_logic ;
	port1_sel:in std_logic_vector(2 downto 0);
	port2_sel:in std_logic_vector(2 downto 0);
	w_sel: in std_logic_vector(2 downto 0);
	clk: in std_logic;
	rst: in std_logic;
	port1_data:out std_logic_vector(15 downto 0);
	port2_data:out std_logic_vector(15 downto 0);
	write_value:in std_logic_vector(15 downto 0)
		);
	end component RegisterFile;
	CONSTANT  SHL  :  std_logic_vector(4 downto 0)  := "00000";
	CONSTANT  SHR  :  std_logic_vector(4 downto 0)  := "00001";
	CONSTANT  STD  :  std_logic_vector(4 downto 0)  := "01110";
	CONSTANT  LDM  :  std_logic_vector(4 downto 0)  := "10000";
	CONSTANT  LDD  :  std_logic_vector(4 downto 0)  := "10001";

	signal RegPort2_data:std_logic_vector(15 downto 0);
	signal OpCode: std_logic_vector(4 downto 0);
begin
	Registers: RegisterFile port map ('0',InstCode(10 downto 8),InstCode(7 downto 5),"000",Clk,Rst,port1_data,RegPort2_data,x"0000");
	OpCode <= InstCode(15 downto 11);
	with OpCode select
		port2_data <= InstCode( 7 downto 0)&x"00" when SHL | SHR | STD| LDM| LDD,
						x"0000" when others;

end Decoder_arc;