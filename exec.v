module EXRegister(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dJar, dImm32, dBusA, dBusB, dRd, dRt, dNextAddress, qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qBranch, qJump, qAluCtrl, qFPoint, qDsize, qLoadext, qJal, qJar, qImm32, qBusA, qBusB, qRd, qRt, qNextAddress);

	input clk;
	input dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dLoadext, dJal, dJar;
	input [31:0] dBusA, dBusB, dNextAddress, dImm32;
	input [4:0] dRd, dRt;
	input [3:0] dAluCtrl;
	input [1:0] dFPoint, dDsize;

	output qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qBranch, qJump, qJal, qJar, qLoadext;
	output [31:0] qBusA, qBusB, qNextAddress, qImm32;
	output [4:0] qRd, qRt;
	output [3:0] qAluCtrl;
	output [1:0] qFPoint, qDsize;

	reg qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qBranch, qJump, qJal, qJar, qLoadext;
	reg [4:0] qRd, qRt;
	reg [31:0] qBusA, qBusB, qNextAddress, qImm32;
	reg [3:0] qAluCtrl;
	reg [1:0] qFPoint, qDsize;

	//Initial Outputs
	initial begin
		qRegDst <= 0; 
		qALUSrc <= 0; 
		qMemToReg <= 0; 
		qRegWrite <= 0; 
		qMemWr <= 0;
		qBranch <= 0;
		qJump <= 0;
		qAluCtrl <= 0;
		qFPoint <= 0;
		qDsize <= 0;				
		qLoadext <= 0;
		qJal <= 0;
		qJar <= 0;
		qImm32 <= 0;
		qBusA <= 0;
		qBusB <= 0;
		qRd <= 0;
		qRt <= 0;
		qNextAddress <= 0;
	end

	//Inputs = Outputs 
	always @ (posedge clk)
	begin
		qRegDst <= dRegDst; 
		qALUSrc <= dALUSrc; 
		qMemToReg <= dMemToReg; 
		qRegWrite <= dRegWrite; 
		qMemWr <= dMemWr;
		qBranch <= dBranch;
		qJump <= dJump;
		qAluCtrl <= dAluCtrl;
		qFPoint <= dFPoint;
		qDsize <= dDsize;				
		qLoadext <= dLoadext;
		qJal <= dJal;
		qJar <= dJar;
		qImm32 <= dImm32;
		qBusA <= dBusA;
		qBusB <= dBusB;
		qRd <= dRd;
		qRt <= dRt;
		qNextAddress <= dNextAddress;
	end


endmodule


module exec(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dJar, dImm32, dBusA, dBusB, dRd, dRt, dNextAddress, MemWr, Branch, MemtoReg, RegWr, Dsize, Zero, ALUout, Rw, Jump, FPoint, Loadext, Jal, BusB, BranchTarget);

	input clk;
	input dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dExtop, dJal, dJar, dLoadext;
	input [31:0] dBusA, dBusB, dImm32, dNextAddress;
	input [3:0] dAluCtrl;
	input [4:0] dRd, dRt;
	input [1:0] dFPoint, dDsize;
	output ALUSrc, MemWr, Branch, MemtoReg, RegWr, Zero, Jump, Loadext, Jal, Jar;
	output [1:0] FPoint, Dsize;
	output [31:0] BusB, BranchTarget, ALUout;
	output [4:0] Rw;

	wire [31:0] ext_out, mux0_out, temp; //Output of extender, output of mux, imm32 shifted	
	wire zero; //Zero output from ALU
	wire ALUSrc, RegDst;
	wire [4:0] Rd, Rt;
	wire [31:0] BusA, BusB_inside, Imm32, NextAddress;
	wire [3:0] AluCtrl;	
	wire open;
	

	//Pipeline Register
	EXRegister register (clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dJar, dImm32, dBusA, dBusB, dRd, dRt, dNextAddress, RegDst, ALUSrc, MemToReg, RegWrite, MemWr, Branch, Jump, AluCtrl, FPoint, Dsize, Loadext, Jal, Jar, Imm32, BusA, BusB_inside, Rd, Rt, NextAddress);	
	
	//Execution part of the single cycle
    	mux_2to1_n #(.n(32)) MUX0(BusB_inside, ext_out, ALUSrc, mux0_out);
	alu ALU(BusA, mux0_out, AluCtrl, ALUout, Zero_out);
	mux_2to1_n #(.n(5)) MUX1(Rt, Rd, RegDst, Rw);
	adder_32 #(.N(32)) adder0 (NextAddress, temp, 1'b0, BranchTarget, open);	

	assign temp = Imm32 << 2;
	assign BusB = BusB_inside;


endmodule
