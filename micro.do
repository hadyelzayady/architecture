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
# ** Warning: Design size of 14283 statements or 91 leaf instances exceeds ModelSim PE Student Edition recommended capacity.
# Expect performance to be quite adversely affected.
# ** Warning: (vsim-8683) Uninitialized out port /microprocessor/fetchstageLabel/NextPC(15 downto 0) has no driver.
# 
# This port will contribute value (16'hXXXX) to the signal network.
# ** Warning: (vsim-8683) Uninitialized out port /microprocessor/fetchstageLabel/SPOutput(15 downto 0) has no driver.
# 
# This port will contribute value (16'hXXXX) to the signal network.
mem load -filltype value -filldata 0111100100000000 -fillradix binary /microprocessor/fetchstageLabel/inst_mem/ram(0)
add wave -position insertpoint  \
sim:/microprocessor/Clk \
sim:/microprocessor/Rst \
sim:/microprocessor/InPort \
sim:/microprocessor/OutPort \
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
sim:/microprocessor/InstCode \
sim:/microprocessor/InstCode2 \
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
sim:/microprocessor/Imm \
sim:/microprocessor/ImmD \
sim:/microprocessor/NewFlags \
sim:/microprocessor/Rjump \
sim:/microprocessor/Rcallorjump \
sim:/microprocessor/Rret \
sim:/microprocessor/Rint \
sim:/microprocessor/Rrst \
sim:/microprocessor/newsp \
sim:/microprocessor/callorjump \
sim:/microprocessor/jmpCNZ \
sim:/microprocessor/ret_mem_wb \
sim:/microprocessor/interrupt \
sim:/microprocessor/EA \
sim:/microprocessor/rsrc \
sim:/microprocessor/rdst \
sim:/microprocessor/Mem_inst \
sim:/microprocessor/NextPC \
sim:/microprocessor/SPOutput \
sim:/microprocessor/pcin \
sim:/microprocessor/spin \
sim:/microprocessor/IFID_rewrite \
sim:/microprocessor/IFID_reset \
sim:/microprocessor/pcout \
sim:/microprocessor/Inputportout \
sim:/microprocessor/spout \
sim:/microprocessor/ID_flush \
sim:/microprocessor/Ex_flush \
sim:/microprocessor/regwrite \
sim:/microprocessor/memtoreg \
sim:/microprocessor/memread \
sim:/microprocessor/memwrite \
sim:/microprocessor/call \
sim:/microprocessor/int \
sim:/microprocessor/outtoport \
sim:/microprocessor/pushpop \
sim:/microprocessor/ret \
sim:/microprocessor/getdatafrom \
sim:/microprocessor/jump \
sim:/microprocessor/Aluop \
sim:/microprocessor/pcinD \
sim:/microprocessor/spinD \
sim:/microprocessor/InputportinD \
sim:/microprocessor/ImminD \
sim:/microprocessor/EAinD \
sim:/microprocessor/rsrcinD \
sim:/microprocessor/rdstinD \
sim:/microprocessor/opcodeinD \
sim:/microprocessor/rsrcnoinD \
sim:/microprocessor/rdstnoinD \
sim:/microprocessor/jumpinD \
sim:/microprocessor/pushpopinD \
sim:/microprocessor/getdatafrominD \
sim:/microprocessor/retinD \
sim:/microprocessor/IDEX_rewriteD \
sim:/microprocessor/IDEX_resetD \
sim:/microprocessor/ClkD \
sim:/microprocessor/wbinD \
sim:/microprocessor/memtoreginD \
sim:/microprocessor/memreadinD \
sim:/microprocessor/memwriteinD \
sim:/microprocessor/callinD \
sim:/microprocessor/interruptinD \
sim:/microprocessor/outportinD \
sim:/microprocessor/pcoutD \
sim:/microprocessor/spoutD \
sim:/microprocessor/InputportoutD \
sim:/microprocessor/ImmoutD \
sim:/microprocessor/EAoutD \
sim:/microprocessor/rsrcoutD \
sim:/microprocessor/rdstoutD \
sim:/microprocessor/opcodeoutD \
sim:/microprocessor/rsrcnooutD \
sim:/microprocessor/rdstnooutD \
sim:/microprocessor/jumpoutD \
sim:/microprocessor/pushpopoutD \
sim:/microprocessor/getdatafromoutD \
sim:/microprocessor/retoutD \
sim:/microprocessor/wboutD \
sim:/microprocessor/memtoregoutD \
sim:/microprocessor/memreadoutD \
sim:/microprocessor/memwriteoutD \
sim:/microprocessor/calloutD \
sim:/microprocessor/interruptoutD \
sim:/microprocessor/outportoutD \
sim:/microprocessor/pcinE \
sim:/microprocessor/spinE \
sim:/microprocessor/aluresultinE \
sim:/microprocessor/InputportinE \
sim:/microprocessor/ImminE \
sim:/microprocessor/EAinE \
sim:/microprocessor/rsrcinE \
sim:/microprocessor/rdstinE \
sim:/microprocessor/opcodeinE \
sim:/microprocessor/flaginE \
sim:/microprocessor/rsrcnoinE \
sim:/microprocessor/rdstnoinE \
sim:/microprocessor/jumpinE \
sim:/microprocessor/pushpopinE \
sim:/microprocessor/getdatafrominE \
sim:/microprocessor/retinE \
sim:/microprocessor/IDEX_rewriteE \
sim:/microprocessor/IDEX_resetE \
sim:/microprocessor/ClkE \
sim:/microprocessor/wbinE \
sim:/microprocessor/memtoreginE \
sim:/microprocessor/memreadinE \
sim:/microprocessor/memwriteinE \
sim:/microprocessor/callinE \
sim:/microprocessor/interruptinE \
sim:/microprocessor/outportinE \
sim:/microprocessor/pcoutE \
sim:/microprocessor/spoutE \
sim:/microprocessor/aluresultoutE \
sim:/microprocessor/InputportoutE \
sim:/microprocessor/ImmoutE \
sim:/microprocessor/EAoutE \
sim:/microprocessor/rsrcoutE \
sim:/microprocessor/rdstoutE \
sim:/microprocessor/opcodeoutE \
sim:/microprocessor/flagoutE \
sim:/microprocessor/rsrcnooutE \
sim:/microprocessor/rdstnooutE \
sim:/microprocessor/jumpoutE \
sim:/microprocessor/pushpopoutE \
sim:/microprocessor/getdatafromoutE \
sim:/microprocessor/retoutE \
sim:/microprocessor/wboutE \
sim:/microprocessor/memtoregoutE \
sim:/microprocessor/memreadoutE \
sim:/microprocessor/memwriteoutE \
sim:/microprocessor/calloutE \
sim:/microprocessor/interruptoutE \
sim:/microprocessor/outportoutE \
sim:/microprocessor/SHL \
sim:/microprocessor/SHR \
sim:/microprocessor/ADD \
sim:/microprocessor/SUB \
sim:/microprocessor/RLC \
sim:/microprocessor/RRC \
sim:/microprocessor/myAND \
sim:/microprocessor/myOR \
sim:/microprocessor/INC \
sim:/microprocessor/DEC \
sim:/microprocessor/SETC \
sim:/microprocessor/CLC \
sim:/microprocessor/myNOT \
sim:/microprocessor/NEG \
sim:/microprocessor/STD \
sim:/microprocessor/MOV \
sim:/microprocessor/LDM \
sim:/microprocessor/LDD \
sim:/microprocessor/C
force -freeze sim:/microprocessor/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/microprocessor/Rst 0 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 1  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 1  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 2  Instance: /microprocessor/fetchstageLabel
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/EX
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/controlunit
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 0  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 1  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 1  Instance: /microprocessor/fetchstageLabel/inst_mem
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ns  Iteration: 2  Instance: /microprocessor/fetchstageLabel
force -freeze sim:/microprocessor/newPC 16'h0 0
run
noforce sim:/microprocessor/newPC
run
run
run
force -freeze sim:/microprocessor/newPC 16'h0 0
run
run
force -freeze sim:/microprocessor/IFID_rewrite 0 0
force -freeze sim:/microprocessor/IFID_reset 0 0
run
force -freeze sim:/microprocessor/Registers/R1/d 16'hFFFF 0