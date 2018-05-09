vsim -gui work.microprocessor
# vsim 
# Start time: 23:51:56 on Apr 19,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.syncram(syncrama)
# Loading work.my_ndff(a_my_ndff)
# Loading work.decoder(decoder_arc)
# Loading work.registerfile(register_arch)
# Loading work.my_ndff_enable(a_my_ndff)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# vsim 
# Start time: 23:14:04 on Apr 19,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.syncram(syncrama)
# Loading work.my_ndff(a_my_ndff)
# Loading work.decoder(decoder_arc)
# ** Warning: (vsim-3473) Component instance "Registers : RegisterFile" is not bound.
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/Decode File: C:/Users/hadye/Google Drive/CUFE/term6/Arch/Project/Decoder.vhd
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# ** Warning: (vsim-8684) No drivers exist on out port /microprocessor/Decode/port1_data, and its initial value is not used.
# 
# Therefore, simulation behavior may occur that is not in compliance with
# 
# the VHDL standard as the initial values come from the base signal /microprocessor/port1_data.
add wave -position end  sim:/microprocessor/Clk
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlftxeim23".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlftxeim23
# 
add wave -position end  sim:/microprocessor/PC
add wave -position end  sim:/microprocessor/Rst
add wave -position end  sim:/microprocessor/FlagRegisterWe
add wave -position end  sim:/microprocessor/ExMemBuffWe
add wave -position end  sim:/microprocessor/Memout
add wave -position end  sim:/microprocessor/ExMemBuffData
add wave -position end  sim:/microprocessor/Opcode
add wave -position end  sim:/microprocessor/A
add wave -position end  sim:/microprocessor/B
add wave -position end  sim:/microprocessor/Flags
add wave -position end  sim:/microprocessor/FlagsOutput
add wave -position end  sim:/microprocessor/F
add wave -position end  sim:/microprocessor/address
add wave -position end  sim:/microprocessor/InstCode
add wave -position end  sim:/microprocessor/InstCode2
add wave -position end  sim:/microprocessor/AluInput
add wave -position end  sim:/microprocessor/port1_data
add wave -position end  sim:/microprocessor/port2_data
add wave -position end  sim:/microprocessor/DXdata
add wave -position end  sim:/microprocessor/XMdata
add wave -position end  sim:/microprocessor/STD
add wave -position end  sim:/microprocessor/C
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: hadye  Hostname: DESKTOP-40T6NOR  ProcessID: 5500
# 
#           Attempting to use alternate WLF file "./wlftztwwwn".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlftztwwwn
# 
force -freeze sim:/microprocessor/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/microprocessor/PC 16'h0 0
force -freeze sim:/microprocessor/Rst 0 0
mem load -filltype value -filldata 0111100010000000 -fillradix binary /microprocessor/InstMemory/ram(0)
run

force -freeze sim:/microprocessor/Rst 1 0
run
run
force -freeze sim:/microprocessor/Rst 0 0
run