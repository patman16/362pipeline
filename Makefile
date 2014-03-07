IVERILOG = /vol/eecs362/iverilog/bin/iverilog

regdecode_test: ; ${IVERILOG} singlecycle/extender.v singlecycle/control.v singlecycle/registers.v regdecode.v tests/regdecode_test.v -o tests/regdecode_test
write_test: ; ${IVERILOG} singlecycle/alu/2to1_mux_n.v write.v tests/write_test.v -o tests/write_test
