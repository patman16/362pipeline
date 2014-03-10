IVERILOG = /vol/eecs362/iverilog/bin/iverilog
ALUFILES = singlecycle/alu/*.v

regdecode_test: ; ${IVERILOG} singlecycle/extender.v singlecycle/control.v singlecycle/registers.v regdecode.v tests/regdecode_test.v -o tests/regdecode_test
write_test: ; ${IVERILOG} singlecycle/alu/2to1_mux_n.v write.v tests/write_test.v -o tests/write_test
exec_test: ;  ${IVERILOG} ${ALUFILES} singlecycle/alu.v  exec.v tests/exec_test.v -o tests/exec_test
mem_test: ;  ${IVERILOG} ${ALUFILES}  singlecycle/extender.v singlecycle/4to1_mux_n.v singlecycle/data_mem.v mem.v tests/mem_test.v -o tests/mem_test
