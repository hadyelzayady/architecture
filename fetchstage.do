vsim -gui work.fetch_stage
# vsim 
# Start time: 12:27:51 on May 08,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_std(body)
# Loading work.fetch_stage(arch)
# Loading work.my_ndff(a_my_ndff)
# Loading work.syncram2(arch)
# ** Warning: Design size of 10097 statements or 4 leaf instances exceeds ModelSim PE Student Edition recommended capacity.
# Expect performance to be quite adversely affected.
add wave -position insertpoint  \
sim:/fetch_stage/Rjump \
sim:/fetch_stage/Rcallorjump \
sim:/fetch_stage/Rret \
sim:/fetch_stage/Rint \
sim:/fetch_stage/Rrst \
sim:/fetch_stage/newsp \
sim:/fetch_stage/Rst \
sim:/fetch_stage/clk \
sim:/fetch_stage/callorjump \
sim:/fetch_stage/jmpCNZ \
sim:/fetch_stage/ret \
sim:/fetch_stage/interrupt \
sim:/fetch_stage/Mem_inst \
sim:/fetch_stage/NextPC \
sim:/fetch_stage/SPOutput \
sim:/fetch_stage/regin \
sim:/fetch_stage/out1 \
sim:/fetch_stage/out2 \
sim:/fetch_stage/out3 \
sim:/fetch_stage/out4 \
sim:/fetch_stage/pc \
sim:/fetch_stage/sp \
sim:/fetch_stage/Memout \
sim:/fetch_stage/opcode \
sim:/fetch_stage/one \
sim:/fetch_stage/two \
sim:/fetch_stage/newPc 
mem load -i {C:/Users/hadye/Google Drive/CUFE/term6/Arch/Project/temp.mem} /fetch_stage/inst_mem/ram
force -freeze sim:/fetch_stage/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/fetch_stage/Rst 1 0
run
force -freeze sim:/fetch_stage/Rst 0 0

