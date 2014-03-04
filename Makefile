IVERILOG = /vol/eecs362/iverilog/bin/iverilog

regdecode_test: ; ${IVERILOG} extender.v control.v registers.v regdecode.v tests/regdecode_test.v -o tests/regdecode_test
