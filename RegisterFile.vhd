
Library ieee;
Use ieee.std_logic_1164.all;
ENTITY RegisterFile IS
PORT    (
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
END RegisterFile;

Architecture register_arch of RegisterFile is
Component my_nDFF_enable is
Generic ( n : integer := 8);
port( Clk,Rst : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0);
en: in std_logic);
end component;

signal  reg0_output : std_logic_vector(15 downto 0);
signal  reg1_output : std_logic_vector(15 downto 0);
signal  reg2_output : std_logic_vector(15 downto 0);
signal  reg3_output : std_logic_vector(15 downto 0);
signal  reg4_output : std_logic_vector(15 downto 0);
signal  reg5_output : std_logic_vector(15 downto 0);

signal  en_reg0 : std_logic;
signal  en_reg1 : std_logic;
signal  en_reg2 : std_logic;
signal  en_reg3 : std_logic;
signal  en_reg4 : std_logic;
signal  en_reg5 : std_logic;
begin
	 R0:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg0_output,en=>en_reg0);	
	 R1:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg1_output,en=>en_reg1);	
	 R2:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg2_output,en=>en_reg2);	
	 R3:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg3_output,en=>en_reg3);	
	 R4:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg4_output,en=>en_reg4);	
	 R5:my_nDFF_enable generic map (n => 16)  port map(clk,rst,write_value,q=>reg5_output,en=>en_reg5);	
	 
	en_reg0 <='1' when w_sel="000" and w_en=  '1' else
				'0';
	en_reg1 <='1' when w_sel="001" and w_en=  '1' else
				'0';
	en_reg2 <='1' when w_sel="010" and w_en=  '1' else
				'0';
	en_reg3 <='1' when w_sel="011" and w_en=  '1' else
				'0';
	en_reg4 <='1' when w_sel="100" and w_en=  '1' else
				'0';
	en_reg5 <='1' when w_sel="101" and w_en=  '1' else
				'0';


	port1_data <= reg0_output when port1_sel="000" and w_en=  '0' else
				  reg1_output when port1_sel="001" and w_en=  '0' else
				  reg2_output when port1_sel="010" and w_en=  '0' else
				  reg3_output when port1_sel="011" and w_en=  '0' else
				  reg4_output when port1_sel="100" and w_en=  '0' else
				  reg5_output when port1_sel="101" and w_en=  '0' else
				  (others => 'U');	

	port2_data <= reg0_output when port2_sel="000" and w_en=  '0' else
				  reg1_output when port2_sel="001" and w_en=  '0' else
				  reg2_output when port2_sel="010" and w_en=  '0' else
				  reg3_output when port2_sel="011" and w_en=  '0' else
				  reg4_output when port2_sel="100" and w_en=  '0' else
				  reg5_output when port2_sel="101" and w_en=  '0' else
				  (others => 'U');					  
end register_arch;


