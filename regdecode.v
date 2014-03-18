module IDRegister(clk, stall, dinst, ddelay, ddelay2, qinst, qdelay, qdelay2);
	input clk, stall;
	input [31:0] dinst, ddelay, ddelay2;
	output [31:0] qinst, qdelay, qdelay2;
	reg [31:0] qinst, qdelay, qdelay2;

	initial begin
		qinst <= 0;
		qdelay <= 0;
		qdelay2 <= 0;
	end
	
	always @ (posedge clk)
	begin
		if (~stall)
		begin
			qinst <= dinst;
			qdelay <= ddelay;
			qdelay2 <= ddelay2;
		end
	end
	
endmodule

module RegDecode(clk, stall, instructionin, delayin, delay2in, rw, busW, wrenable, fpoint, branchtarget, delay2out, instruction, imm32, busA, busB, priorALUresult, ALUwriteback, aluselectA, aluselectB, regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, aluctrl, fpointout, destreg, dsize, loadext, jal, jar);
	input clk, wrenable, stall;
	input [1:0] fpoint, aluselectA, aluselectB;
	input [31:0] instructionin, delayin, delay2in, busW, priorALUresult, ALUwriteback;
	input [4:0] rw;
	output regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, loadext, jal, jar;
	output [31:0] instruction, busA, busB, branchtarget, delay2out, imm32;
	output [4:0] destreg;
	output [3:0] aluctrl;
	output [1:0] fpointout, dsize;
	
	wire extop, open1, zero, branchwire, brancheq;
	wire [4:0] rs2, rs1, rd;
	wire [31:0] immediateval, busAwire, busBwire, delayout, fwdbusA, fwdbusB;
	
	adder_32 #(.N(32)) adder0_map ({immediateval[31:2], 2'b00}, delayout, 1'b0, branchtarget, open1);
	equal compare (fwdbusA, 32'd0, zero);
	and (branch, branchctrl, branchwire);
	mux_2to1_n #(.n(1)) branch_eq_ctrl (zero, ~zero, instruction[26], branchctrl); 
	IDRegister register (clk, stall, instructionin, delayin, delay2in, instruction, delayout, delay2out);
	control decoder (instruction, regdst, alusrc, mem2reg, regwrite, memwrite, branchwire, jump, aluctrl, extop, fpointout, rd, rs1, rs2, dsize, loadext, jal, jar);
	registers regfile (clk,  wrenable, fpoint, rw, rs1, rs2, busW, busAwire, busBwire);
	extender immed (instruction[15:0], extop, immediateval);
	mux_2to1_n #(.n(5)) destmux (rs2, rd, regdst, destreg);
	mux_4to1_n #(.n(32)) fwdAmux (busAwire, priorALUresult, ALUwriteback, 32'd0, aluselectA, fwdbusA);
	mux_4to1_n #(.n(32)) fwdBmuc (busBwire, priorALUresult, ALUwriteback, 32'd0, aluselectB, fwdbusB);
	
	assign imm32 = immediateval;
	assign busA = fwdbusA;
	assign busB = fwdbusB;
	
endmodule
