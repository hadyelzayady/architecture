vsim -gui work.microprocessor
# vsim 
# Start time: 22:56:01 on May 04,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.microprocessor(microprocessor_arc)
# Loading work.fetch_stage(arch)
# Loading work.my_ndff(a_my_ndff)
# Loading work.syncram2(arch)
# Loading work.ifid_buffer(arch)
# Loading work.my_ndff3(arch)
# Loading work.registerfile(register_arch)
# Loading work.my_ndff_enable(a_my_ndff)
# Loading work.control(arch)
# Loading work.idex_buffer(arch)
# Loading work.my_dff3(arch)
# Loading work.alu(alu_arch)
# Loading work.addersub16bit(addersub16bit_arc)
# Loading work.adder16bit(adder16bit_arch)
# Loading work.halfadder(halfadder_arch)
# Loading work.fulladder(fulladder_arch)
# Loading work.exmem_buffer(arch)
mem load -filltype value -filldata 0000100100000000 -fillradix binary /microprocessor/fetchstageLabel/inst_mem/ram(0)
add wave -position insertpoint  \
sim:/microprocessor/Clk \
sim:/microprocessor/Rst \
sim:/microprocessor/FlagRegisterWe \
sim:/microprocessor/ExMemBuffWe \
sim:/microprocessor/Memout \
sim:/microprocessor/DXdata \
sim:/microprocessor/DXoutput \
sim:/microprocessor/ExMemBuffData \
sim:/microprocessor/XMdata \
sim:/microprocessor/Opcode \
sim:/microprocessor/Flags \
sim:/microprocessor/FlagsOutput \
sim:/microprocessor/F \
sim:/microprocessor/port1_data \
sim:/microprocessor/port2_data \
sim:/microprocessor/newPC \
sim:/microprocessor/RegPort2_data \
sim:/microprocessor/wb_enable \
sim:/microprocessor/wb_sel \
sim:/microprocessor/wb_data \
sim:/microprocessor/Rdstno \
sim:/microprocessor/rsrcno \
sim:/microprocessor/MWout \
sim:/microprocessor/MWdata \
sim:/microprocessor/RdstD \
sim:/microprocessor/OpcodeD \
sim:/microprocessor/port1_dataD \
sim:/microprocessor/port2_dataD \
sim:/microprocessor/port2_dataE \
sim:/microprocessor/OpcodeE \
sim:/microprocessor/OpcodeM \
sim:/microprocessor/AluOutputE \
sim:/microprocessor/AluOutputM \
sim:/microprocessor/RdstE \
sim:/microprocessor/RdstM \
sim:/microprocessor/Mem_we \
sim:/microprocessor/PC \
sim:/microprocessor/NewFlags \
sim:/microprocessor/Rrst \
sim:/microprocessor/ret_mem_wb \
sim:/microprocessor/rsrc \
sim:/microprocessor/rdst \
sim:/microprocessor/Mem_inst \
sim:/microprocessor/NextPC \
sim:/microprocessor/pcin \
sim:/microprocessor/IFID_rewrite \
sim:/microprocessor/IFID_reset \
sim:/microprocessor/pcout \
sim:/microprocessor/ID_flush \
sim:/microprocessor/Ex_flush \
sim:/microprocessor/regwrite \
sim:/microprocessor/memtoreg \
sim:/microprocessor/memread \
sim:/microprocessor/memwrite \
sim:/microprocessor/getdatafrom \
sim:/microprocessor/Aluop \
sim:/microprocessor/pcinD \
sim:/microprocessor/rsrcinD \
sim:/microprocessor/rdstinD \
sim:/microprocessor/opcodeinD \
sim:/microprocessor/rsrcnoinD \
sim:/microprocessor/rdstnoinD \
sim:/microprocessor/getdatafrominD \
sim:/microprocessor/IDEX_rewriteD \
sim:/microprocessor/IDEX_resetD \
sim:/microprocessor/wbinD \
sim:/microprocessor/memtoreginD \
sim:/microprocessor/memreadinD \
sim:/microprocessor/memwriteinD \
sim:/microprocessor/pcoutD \
sim:/microprocessor/rsrcoutD \
sim:/microprocessor/rdstoutD \
sim:/microprocessor/opcodeoutD \
sim:/microprocessor/rsrcnooutD \
sim:/microprocessor/rdstnooutD \
sim:/microprocessor/getdatafromoutD \
sim:/microprocessor/wboutD \
sim:/microprocessor/memtoregoutD \
sim:/microprocessor/memreadoutD \
sim:/microprocessor/memwriteoutD \
sim:/microprocessor/pcinE \
sim:/microprocessor/aluresultinE \
sim:/microprocessor/rsrcinE \
sim:/microprocessor/rdstinE \
sim:/microprocessor/opcodeinE \
sim:/microprocessor/flaginE \
sim:/microprocessor/rsrcnoinE \
sim:/microprocessor/rdstnoinE \
sim:/microprocessor/getdatafrominE \
sim:/microprocessor/IDEX_rewriteE \
sim:/microprocessor/IDEX_resetE \
sim:/microprocessor/wbinE \
sim:/microprocessor/memtoreginE \
sim:/microprocessor/memreadinE \
sim:/microprocessor/memwriteinE \
sim:/microprocessor/pcoutE \
sim:/microprocessor/aluresultoutE \
sim:/microprocessor/rsrcoutE \
sim:/microprocessor/rdstoutE \
sim:/microprocessor/opcodeoutE \
sim:/microprocessor/flagoutE \
sim:/microprocessor/rsrcnooutE \
sim:/microprocessor/rdstnooutE \
sim:/microprocessor/getdatafromoutE \
sim:/microprocessor/wboutE \
sim:/microprocessor/memtoregoutE \
sim:/microprocessor/memreadoutE \
sim:/microprocessor/memwriteoutE \
add wave -position insertpoint  \
sim:/microprocessor/Registers/R0/d \
sim:/microprocessor/Registers/R0/q
add wave -position insertpoint  \
sim:/microprocessor/Registers/R1/d \
sim:/microprocessor/Registers/R1/q
force -freeze sim:/microprocessor/Clk 1 0, 0 {100 ns} -r 200
force -freeze sim:/microprocessor/Rst 1 0
run

force -freeze sim:/microprocessor/newPC 16'h0 0
force -freeze sim:/microprocessor/Rst 16'h0 0
force -freeze sim:/microprocessor/Registers/R1/d 16'hFFFF 0
force -freeze sim:/microprocessor/Registers/R1/q 16'hFFFF 0
run
run
run
force -freeze sim:/microprocessor/newPC 16'h0 0
run
run
force -freeze sim:/microprocessor/IFID_rewrite 0 0
force -freeze sim:/microprocessor/IFID_reset 0 0
run
