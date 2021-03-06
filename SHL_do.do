vsim -gui work.microprocessor
# vsim 
# Start time: 10:59:54 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.my_ndff(a_my_ndff)
# Loading work.syncram(syncrama)
# Loading work.registerfile(register_arch)
# Loading work.my_ndff_enable(a_my_ndff)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# ** Warning: Design size of 11319 statements or 41 leaf instances exceeds ModelSim PE Student Edition recommended capacity.
# Expect performance to be quite adversely affected.
# vsim 
# Start time: 17:04:27 on Apr 20,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.syncram(syncrama)
# Loading work.my_ndff(a_my_ndff)
# Loading work.registerfile(register_arch)
# Loading work.my_ndff_enable(a_my_ndff)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# vsim 
# Start time: 17:01:56 on Apr 20,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.syncram(syncrama)
# Loading work.my_ndff(a_my_ndff)
# Loading work.registerfile(register_arch)
# Loading work.my_ndff_enable(a_my_ndff)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
add wave -position end  sim:/microprocessor/Clk
add wave -position end  sim:/microprocessor/PC
add wave -position end  sim:/microprocessor/Rst
add wave -position end  sim:/microprocessor/InPort
add wave -position end  sim:/microprocessor/OutPort
add wave -position end  sim:/microprocessor/FlagRegisterWe
add wave -position end  sim:/microprocessor/ExMemBuffWe
add wave -position end  sim:/microprocessor/Memout
add wave -position end  sim:/microprocessor/DXdata
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlftendkyz".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlftendkyz
# 
add wave -position end  sim:/microprocessor/DXoutput
add wave -position end  sim:/microprocessor/ExMemBuffData
add wave -position end  sim:/microprocessor/XMdata
add wave -position end  sim:/microprocessor/Opcode
add wave -position end  sim:/microprocessor/Flags
add wave -position end  sim:/microprocessor/FlagsOutput
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlfthbv52i".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlfthbv52i
# 
add wave -position end  sim:/microprocessor/F
add wave -position end  sim:/microprocessor/InstCode
add wave -position end  sim:/microprocessor/InstCode2
add wave -position end  sim:/microprocessor/port1_data
add wave -position end  sim:/microprocessor/port2_data
add wave -position end  sim:/microprocessor/myPC
# (vish-4014) No objects found matching '/microprocessor/myPC'.

add wave -position end  sim:/microprocessor/RegPort2_data
add wave -position end  sim:/microprocessor/wb_enable
add wave -position end  sim:/microprocessor/wb_sel
add wave -position end  sim:/microprocessor/wb_data
add wave -position end  sim:/microprocessor/Rdst
add wave -position end  sim:/microprocessor/MWout
add wave -position end  sim:/microprocessor/MWdata
add wave -position end  sim:/microprocessor/RdstD
add wave -position end  sim:/microprocessor/OpcodeD
add wave -position end  sim:/microprocessor/port1_dataD
add wave -position end  sim:/microprocessor/port2_dataD
add wave -position end  sim:/microprocessor/OpcodeE
add wave -position end  sim:/microprocessor/AluOutputE
add wave -position end  sim:/microprocessor/RdstE
add wave -position insertpoint  \
sim:/microprocessor/Imm \
sim:/microprocessor/ImmD
add wave -position insertpoint  \
sim:/microprocessor/port2_dataE
add wave -position insertpoint  \
sim:/microprocessor/Registers/R1/en
add wave -position insertpoint  \
sim:/microprocessor/Registers/R0/en
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlft8hr5r6".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlft8hr5r6
# 
mem load -filltype value -filldata 0100100000100000 -fillradix binary /microprocessor/InstMemory/ram(0)
force -freeze sim:/microprocessor/Clk 1 0, 0 {100 ns} -r 200
force -freeze sim:/microprocessor/Rst 1 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/InstMemory
force -freeze sim:/microprocessor/Rst 0 0
force -freeze sim:/microprocessor/PC 16'h0 0
run
add wave -position insertpoint  \
sim:/microprocessor/Registers/R0/q
add wave -position insertpoint  \
sim:/microprocessor/Registers/R1/q
force -freeze sim:/microprocessor/Registers/R0/q 16'h1 0
force -freeze sim:/microprocessor/Registers/R1/q 16'h2 0
noforce sim:/microprocessor/Registers/R0/q
noforce sim:/microprocessor/Registers/R1/q
mem load -filltype value -filldata 0000000000100000 -fillradix binary /microprocessor/InstMemory/ram(0)
mem load -filltype value -filldata 0000000000000010 -fillradix binary /microprocessor/InstMemory/ram(1)
run