module pipeline(clock, reset);
	input clock, reset;
	wire branch, jump_0, jar, wrenable, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, loadext_0, jal_0, memwrite_1, mem2reg_1, regwrite_1, jump_1, loadext_1, jal_1, mem2reg_2, regwrite_2, jump_2, jal_2;
	wire [1:0] fpoint_0, dsize_0, fpoint_1, dsize_1, fpoint_2, fpoint_3;
	wire [3:0] aluctrl_0;
	wire [4:0] rw_0, rd_0, rs2_0, rw_1, rw_2;
	wire [31:0] instruction, branchtarget, delayslot, delayslot2_0, delayslot2_1, imm32_0, busA_0, busB_0, busW, aluout_0, busB_1, delayslot2_2, dmemout, aluout_1, delayslot2_3;
	
	ifu IFU(branch, jump_0, clock, reset, jar, busA_0[31:2], branchtarget[31:2], instruction, delayslot, delayslot2_0);
	RegDecode decode(clock, instruction, delayslot, delayslot2_1, rw_2, busW, wrenable, fpoint_3, branchtarget, delayslot2_1, imm32_0, busA_0, busB_0, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, branch, jump_0, aluctrl_0, fpoint_0, rd_0, rs2_0, dsize_0, loadext_0, jal_0, jar);
	exec execstage(clock, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, jump_0, aluctrl_0, fpoint_0, dsize_0, loadext_0, jal_0, imm32_0, busA_0, busB_0, rd_0, rs2_0, delayslot2_1, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, rw_0, jump_1, fpoint_1, loadext_1, jal_1, busB_1, delayslot2_2);
	mem_unit mem(clock, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, busB_1, loadext_1, jump_1, jal_1, fpoint_1, rw_0, delayslot2_2, mem2reg_2, regwrite_2, dmemout, aluout_1, jump_2, fpoint_2, jal_2, rw_1, delayslot2_3);
	Write rgwrite(clock, mem2reg_2, regwrite_2, rw_1, dmemout, aluout_1, fpoint_2, delayslot2_3, jal_2, rw_2, busW, wrenable, fpoint_3);
	
endmodule
