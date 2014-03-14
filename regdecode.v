module IDRegister(clk, dinst, ddelay, ddelay2, qinst, qdelay, qdelay2);
	input clk;
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
		qinst <= dinst;
		qdelay <= ddelay;
		qdelay2 <= ddelay2;
	end
	
endmodule

module RegDecode(clk, instructionin, delayin, delay2in, rw, busW, wrenable, fpoint, branchtarget, delay2out, imm32, busA, busB, regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, aluctrl, fpointout, rd, rs2, dsize, loadext, jal, jar);
	input clk, wrenable;
	input [1:0] fpoint;
	input [31:0] instructionin, delayin, delay2in, busW;
	input [4:0] rw;
	output regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, loadext, jal, jar;
	output [31:0] busA, busB, branchtarget, delay2out, imm32;
	output [4:0] rd, rs2;
	output [3:0] aluctrl;
	output [1:0] fpointout, dsize;
	
	wire extop, open1, busesequal, branchwire, brancheq;
	wire [4:0] rs1;
	wire [31:0] instruction, immediateval, busAwire, busBwire, delayout;
	
	adder_32 #(.N(32)) adder0_map ({immediateval[31:2], 2'b00}, delayout, 1'b0, branchtarget, open1);
	equal compare (busAwire, busBwire, busesequal);
	and (branch, branchctrl, branchwire);
	mux_2to1_n #(.n(1)) branch_eq_ctrl (busesequal, ~busesequal, instruction[26], branchctrl); 
	IDRegister register (clk, instructionin, delayin, delay2in, instruction, delayout, delay2out);
	control decoder (instruction, regdst, alusrc, mem2reg, regwrite, memwrite, branchwire, jump, aluctrl, extop, fpointout, rd, rs1, rs2, dsize, loadext, jal, jar);
	registers regfile (clk, wrenable, fpoint, rw, rs1, rs2, busW, busAwire, busBwire);
	extender immed (instruction[15:0], extop, immediateval);
	
	assign imm32 = immediateval;
	assign busA = busAwire;
	assign busB = busBwire;
	
endmodule
