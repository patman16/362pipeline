module pipeline(clock, reset, fake_out);
	input clock, reset;
	output fake_out;
	wire branch, jump_0, jar, wrenable, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, loadext_0, jal_0, memwrite_1, mem2reg_1, regwrite_1, jump_1, loadext_1, jal_1, regwrite_2, jump_2, jal_2;
	wire [1:0] fpoint_0, dsize_0, fpoint_1, dsize_1, fpoint_2, fpoint_3;
	wire [3:0] aluctrl_0;
	wire [4:0] rw_0, rw_1, rw_2, rw_3;
	wire [31:0] instruction_0, instruction_1, instruction_2, branchtarget, delayslot, delayslot2_0, delayslot2_1, imm32_0, busA_0, busB_0, busW, aluout_0, busB_1, delayslot2_2, delayslot2_3, source;
	reg stall, stallack;
	reg [1:0] fwdA, fwdB;	

	ifu IFU(branch, jump_0, clock, reset, jar, busA_0[31:2], branchtarget[31:2], instruction_0, delayslot, delayslot2_0, stall);
	RegDecode decode(clock, stall, branch, instruction_0, delayslot, delayslot2_1, rw_3, busW, wrenable, fpoint_3, branchtarget, delayslot2_1, instruction_1, imm32_0, busA_0, busB_0, aluout_0, source, fwdA, fwdB, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, branch, jump_0, aluctrl_0, fpoint_0, rw_0, dsize_0, loadext_0, jal_0, jar);
	exec execstage(clock, stall, instruction_1, regdst_0, alusrc_0, mem2reg_0, regwrite_0, memwrite_0, jump_0, aluctrl_0, fpoint_0, dsize_0, loadext_0, jal_0, imm32_0, busA_0, busB_0, rw_0, delayslot2_1, instruction_2, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, rw_1, jump_1, fpoint_1, loadext_1, jal_1, busB_1, delayslot2_2);
	mem_unit mem(clock, memwrite_1, mem2reg_1, regwrite_1, dsize_1, aluout_0, busB_1, loadext_1, jump_1, jal_1, fpoint_1, rw_1, delayslot2_2, regwrite_2, source, jump_2, fpoint_2, jal_2, rw_2, delayslot2_3);
	Write rgwrite(clock, regwrite_2, rw_2, source, fpoint_2, delayslot2_3, jal_2, rw_3, busW, wrenable, fpoint_3);
	
	initial begin
	stall = 0;
	stallack = 0;
	fwdA = 2'b00;
	fwdB = 2'b00;
	end
	
	//always @ (posedge clock)
	//begin
	//if (stall)
	//	stallack <= 1;
	//end
	
	always @*
	begin
		if (stall && clock)
		begin
		if (stall)
			stallack <= 1;
		end
		else if (stallack)
		begin
			stallack <= 0; stall <= 0;
		end
		begin
				if (regwrite_1 && instruction_1[25:21] == rw_1)
				begin
					if (~stallack && (instruction_2[31:26] == 32 || instruction_2[31:26] == 36 || instruction_2[31:26] == 33 || instruction_2[31:26] == 15 || instruction_2[31:26] == 37 || instruction_2[31:26] == 35))
						stall <= 1;
					else fwdA <= 2'b01;
				end
				else if (regwrite_2 && instruction_1[25:21] == rw_2)
					fwdA <= 2'b10;
				else
					fwdA <= 2'b00;
					if (regwrite_1 && instruction_1[20:16] == rw_1)
					begin
						if (~stallack && (instruction_2[31:26] == 32 || instruction_2[31:26] == 36 || instruction_2[31:26] == 33 || instruction_2[31:26] == 15 || instruction_2[31:26] == 37 || instruction_2[31:26] == 35))
							stall <= 1;
						else fwdB <= 2'b01;
					end
					else if (regwrite_2 && instruction_1[20:16] == rw_2)
						fwdB <= 2'b10;
					else
						fwdB <= 2'b00;
		end
	end	
endmodule
