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
mem load -i {C:/Users/hadye/Google Drive/CUFE/term6/Arch/Project/temp.mem} /microprocessor/fetchstageLabel/inst_mem/ram
mem load -filltype value -filldata 1111000011110000 -fillradix binary /microprocessor/DataMemory/ram(0)
mem load -filltype value -filldata 0000000000001010 -fillradix binary /microprocessor/DataMemory/ram(1)
mem load -filltype value -filldata 20 -fillradix decimal /microprocessor/DataMemory/ram(3)
mem load -filltype value -filldata 50 -fillradix decimal /microprocessor/DataMemory/ram(1)
mem load -filltype value -filldata 30 -fillradix decimal /microprocessor/DataMemory/ram(4)
mem load -filltype value -filldata 1111000000000000 -fillradix binary /microprocessor/fetchstageLabel/inst_mem/ram(100)
add wave -position insertpoint  \
sim:/microprocessor/Clk \
sim:/microprocessor/Rst \
sim:/microprocessor/interrupt \
sim:/microprocessor/interruptf \
sim:/microprocessor/interruptoutD \
sim:/microprocessor/interruptoutE \
sim:/microprocessor/Memout \
sim:/microprocessor/Opcode \
sim:/microprocessor/opcodeoutD \
sim:/microprocessor/opcodeoutE \
sim:/microprocessor/opcodeoutM \
sim:/microprocessor/retoutM \
sim:/microprocessor/returnforpc \
sim:/microprocessor/Flags \
sim:/microprocessor/DataMemory/dataflag\
sim:/microprocessor/FlagsOutput \
sim:/microprocessor/port1_data \
sim:/microprocessor/port2_data \
sim:/microprocessor/NextPC \
sim:/microprocessor/PC_rewrite \
sim:/microprocessor/retoutE \
sim:/microprocessor/Rret \
sim:/microprocessor/Rret \
sim:/microprocessor/flagRTI \
sim:/microprocessor/flagoutM \
sim:/microprocessor/IFID_flush \
sim:/microprocessor/IDIE_flush \
sim:/microprocessor/IFID_jumpflush \
sim:/microprocessor/flush \
sim:/microprocessor/IFID_rewrite \
sim:/microprocessor/RegPort2_data \
sim:/microprocessor/wb_enable \
sim:/microprocessor/wb_sel \
sim:/microprocessor/wb_data \
sim:/microprocessor/Rdstno \
sim:/microprocessor/rsrcno \
sim:/microprocessor/RdstD \
sim:/microprocessor/port1_dataD \
sim:/microprocessor/port2_dataD \
sim:/microprocessor/port2_dataE \
sim:/microprocessor/AluOutputM \
sim:/microprocessor/RdstE \
sim:/microprocessor/RdstM \
sim:/microprocessor/Mem_we \
sim:/microprocessor/NewFlags \
sim:/microprocessor/Rrst \
sim:/microprocessor/ret_mem_wb \
sim:/microprocessor/rsrc \
sim:/microprocessor/rdst \
sim:/microprocessor/Mem_inst \
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
sim:/microprocessor/IDEX_rewriteD \
sim:/microprocessor/IDEX_resetD \
sim:/microprocessor/pcoutD \
sim:/microprocessor/Rjump \
sim:/microprocessor/destination \
sim:/microprocessor/Rcallorjump \
sim:/microprocessor/callorjump \
sim:/microprocessor/jmpCNZ \
sim:/microprocessor/jump \
sim:/microprocessor/jumpoutD \
sim:/microprocessor/rsrcoutD \
sim:/microprocessor/rdstoutD \
sim:/microprocessor/rsrcnooutD \
sim:/microprocessor/rdstnooutD \
sim:/microprocessor/wboutD \
sim:/microprocessor/wboutM \
sim:/microprocessor/memtoregoutD \
sim:/microprocessor/memreadoutD \
sim:/microprocessor/memwriteoutD \
sim:/microprocessor/aluresultinE \
sim:/microprocessor/aluresultoutE \
sim:/microprocessor/aluresultoutM \
sim:/microprocessor/IDEX_rewriteE \
sim:/microprocessor/IDEX_resetE \
sim:/microprocessor/pcoutE \
sim:/microprocessor/rsrcoutE \
sim:/microprocessor/rdstoutE \
sim:/microprocessor/flagoutE \
sim:/microprocessor/rsrcnooutE \
sim:/microprocessor/rdstnooutE \
sim:/microprocessor/wboutE \
sim:/microprocessor/memtoregoutE \
sim:/microprocessor/memreadoutE \
sim:/microprocessor/memwriteoutE \
sim:/microprocessor/memdataoutM \
sim:/microprocessor/wboutM \
sim:/microprocessor/port1_choice \
sim:/microprocessor/port2_choice \
sim:/microprocessor/Imm	\
sim:/microprocessor/ImmoutD	\
sim:/microprocessor/ImmoutE	\
sim:/microprocessor/ImmoutM	\
sim:/microprocessor/rdstnooutM	\
sim:/microprocessor/InPort \
sim:/microprocessor/outportoutM \
sim:/microprocessor/OutPort \
sim:/microprocessor/LDM \
sim:/microprocessor/InputportoutM
force -freeze sim:/microprocessor/interrupt 0 0
force -freeze sim:/microprocessor/Clk 1 0, 0 {100 ns} -r 200
force -freeze sim:/microprocessor/Rst 1 0
add wave -position insertpoint  \
sim:/microprocessor/Registers/R0/d \
sim:/microprocessor/Registers/R0/q \
sim:/microprocessor/Registers/R1/d \
sim:/microprocessor/Registers/R1/q
add wave -position insertpoint  \
sim:/microprocessor/Registers/R2/d \
sim:/microprocessor/Registers/R2/q
add wave -position insertpoint  \
sim:/microprocessor/Registers/R3/d \
sim:/microprocessor/Registers/R3/q
add wave -position insertpoint  \
sim:/microprocessor/Registers/R4/d \
sim:/microprocessor/Registers/R4/q

add wave -position insertpoint  \
sim:/microprocessor/spoutD
add wave -position insertpoint  \
sim:/microprocessor/spoutE
add wave -position insertpoint  \
sim:/microprocessor/spoutM
add wave -position insertpoint  \
sim:/microprocessor/sp_tomemwb
add wave -position insertpoint  \
sim:/microprocessor/spunit
add wave -position insertpoint  \
sim:/microprocessor/getdatafrom

add wave -position insertpoint  \
sim:/microprocessor/getdatafromoutD

add wave -position insertpoint  \
sim:/microprocessor/getdatafromoutE
add wave -position insertpoint  \
sim:/microprocessor/datato_MEMWB

add wave -position insertpoint  \
sim:/microprocessor/address_tomem	


add wave -position insertpoint  \
sim:/microprocessor/pushpopoutE	
add wave -position insertpoint  \
sim:/microprocessor/data_tomem	

force -freeze sim:/microprocessor/spoutM 03ff 0
force -freeze sim:/microprocessor/IFID_rewrite 0 0
force -freeze sim:/microprocessor/IDEX_rewriteE 0 0
force -freeze sim:/microprocessor/IDEX_rewriteD 0 0
force -freeze sim:/microprocessor/IDEX_rewriteM 0 0
force -freeze sim:/microprocessor/InPort 16'hf0f0 0
run
run
run
run
run
run
run

noforce sim:/microprocessor/wb_data
noforce sim:/microprocessor/Rst
force -freeze sim:/microprocessor/Rst 0 0
run 
run
run
noforce sim:/microprocessor/spoutM
run


