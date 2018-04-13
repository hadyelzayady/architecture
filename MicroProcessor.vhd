entity MicroProcessor is
	port (
		clock : std_logic;
		Opcode: std_logic_vector(15 downto 0)
	);
end MicroProcessor;

architecture MicroProcessor_arc of MicroProcessor is
begin
	
processor : process (reset, clock)
begin
  if (reset = '1') then
    
  elsif (rising_edge(clock)) then

  end if;
end process processor;
end MicroProcessor_arc;
