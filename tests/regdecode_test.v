module testbench;
	reg clk, wrenable;
	reg [31:0] instruction, delay, delay2, busW;
	reg [4:0] rw;
	wire regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, loadext, jal, jar;
	wire [31:0] busA, busB, delayout, delay2out, imm16;
	wire [4:0] rd, rs2;
	wire [3:0] aluctrl;
	wire [1:0] fpoint, dsize;
	
	RegDecode decodereg (clk, instruction, delay, delay2, rw, busW, wrenable, delayout, delay2out, imm16, busA, busB, regdst, alusrc, mem2reg, regwrite, memwrite, branch, jump, aluctrl, fpoint, rd, rs2, dsize, loadext, jal, jar);
	
	always #1 clk = ~clk;
	
	initial begin
		clk = 1;
		delay = 1;
		delay2 = 2;

		//and instruction, write 1 to register 1
		instruction = 32'h00620820;
		rw = 1;
		busW = 1;
		delay = 1;
		delay2 = 2;
		wrenable = 1;
	end
	
	initial begin
	$monitor("instruction = %h delay = %h delay2 = %h Rw = %d Rd = %d Rs1 = %d Rs2 = %d busW = %d wrenable = %b busA = %d busB = %d imm16 = %h regwrite = %b aluctrl = %b", decodereg.instruction, delayout, delay2out, rw, rd, decodereg.rs1, rs2, busW, wrenable, busA, busB, imm16, regwrite, aluctrl);
	#2
	//addui, read register 1 on both buses
	#2 instruction = 32'h24210000; delay = 2; delay2 = 3; wrenable = 0;
	//bnez, write 2 to register 2
	#2 instruction = 32'h14410000; rw = 2; busW = 2; delay = 3; delay2 = 4; wrenable = 1;
	//lhi, write 5 to register 5
	#2 instruction = 32'h3C410013; rw = 5; busW = 5; delay = 4; delay2 = 5;
	//sgti, read register 2 on bus A, read register 5 on bus B
	#2 instruction = 32'h6C450022; delay = 5; delay2 = 6; wrenable = 0;
	$finish;
	end
endmodule
