module pipeline(clock, reset);
	input clock, reset;
	wire branch, jump_0, jar, wrenable, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, loadext_0, jal_0, memwrite_1, mem2reg_1, regwrite_1, jump_1, loadext_1, jal_1, mem2reg_2, regwrite_2, jump_2, jal_2;
	wire [1:0] fpoint_0, dsize_0, fpoint_1, dsize_1, fpoint_2, fpoint_3;
	wire [3:0] aluctrl_0;
	wire [4:0] rw_0, rw_1, rw_2, rw_3;
	wire [31:0] instruction, branchtarget, delayslot, delayslot2_0, delayslot2_1, imm32_0, busA_0, busB_0, busW, aluout_0, busB_1, delayslot2_2, dmemout, aluout_1, delayslot2_3;
	reg stall;
	reg [1:0] fwdA, fwdB;	

	ifu IFU(branch, jump_0, clock, reset, jar, busA_0[31:2], branchtarget[31:2], instruction, delayslot, delayslot2_0);
	RegDecode decode(clock, instruction, delayslot, delayslot2_1, rw_3, busW, wrenable, fpoint_3, branchtarget, delayslot2_1, imm32_0, busA_0, busB_0, aluout_1, busW, fwdA, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, branch, jump_0, aluctrl_0, fpoint_0, rw_0, dsize_0, loadext_0, jal_0, jar);
	exec execstage(clock, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, jump_0, aluctrl_0, fpoint_0, dsize_0, loadext_0, jal_0, imm32_0, busA_0, busB_0, rw_0, delayslot2_1, fwdA, fwdB, aluout_1, busW, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, rw_1, jump_1, fpoint_1, loadext_1, jal_1, busB_1, delayslot2_2);
	mem_unit mem(clock, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, busB_1, loadext_1, jump_1, jal_1, fpoint_1, rw_1, delayslot2_2, mem2reg_2, regwrite_2, dmemout, aluout_1, jump_2, fpoint_2, jal_2, rw_2, delayslot2_3);
	Write rgwrite(clock, mem2reg_2, regwrite_2, rw_2, dmemout, aluout_1, fpoint_2, delayslot2_3, jal_2, rw_3, busW, wrenable, fpoint_3);
	
	initial begin
	stall = 0;
	fwdA = 2'b00;
	fwdB = 2'b00;
	end
	
	always @ (posedge clock)
	begin
		stall = 0;
		if (fwdA == 2'b00)
		begin
			if (decode.rs1 == rw_1)
			begin
				if (instruction[31:26] == 32 || instruction[31:26] == 36 || instruction[31:26] == 33 || instruction[31:26] == 15 || instruction[31:26] == 37 || instruction[31:26] == 35)
					stall = 1;
				else
					fwdA = 2'b01;
			end
			else if (decode.rs1 == rw_2)
				fwdA = 2'b10;
			else
				fwdA = 2'b00;
		end
		if (fwdB == 2'b00)
		begin
			if (decode.rs2 == rw_1)
			begin
				if (instruction[31:26] == 32 || instruction[31:26] == 36 || instruction[31:26] == 33 || instruction[31:26] == 15 || instruction[31:26] == 37 || instruction[31:26] == 35)
					stall = 1;
				else
					fwdB = 2'b01;
			end
			else if (decode.rs2 == rw_2)
				fwdB = 2'b10;
			else
				fwdB = 2'b00;
		end
	end
endmodule
