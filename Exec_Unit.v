module EXRegister(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, Edxtop, dFPoint, dDsize, dLoadext, dJal, dJar, dLoadext, dImm16, dBusA, dBusB, qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qBranch, qJump, qAluCtrl, qExtop, qFPoint, qDsize, qLoadext, qJal, qJar, qLoadext, qImm16, qBusA, qBusB);

	input clk;
	input dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dExtop, dLoadext, dJal, dJar, dLoadext;
	input [15:0] dImm16;
	input [31:0] dBusA, dBusB;
	input [3:0] dAluCtrl;
	input [1:0] dFPoint, dDsize;

	output qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qBranch, qJump, qExtop, qLoadext, qJal, qJar, qLoadext;
	output [15:0] qImm16;
	output [31:0] qBusA, qBusB;
	output [3:0] qAluCtrl;
	output [1:0] qFPoint, qDsize;
	
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
		qExtop <= 0;
		qFPoint <= 0;
		qDsize <= 0;				
		qLoadext <= 0;
		qJal <= 0;
		qJar <= 0;
		qLoadext <= 0;
		qImm16 <= 0;
		qBusA <= 0;
		qBusB <= 0;
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
		qExtop <= dExtop;
		qFPoint <= dFPoint;
		qDsize <= dDsize;				
		qLoadext <= dLoadext;
		qJal <= dJal;
		qJar <= dJar;
		qLoadext <= dLoadext;
		qImm16 <= dImm16;
		qBusA <= dBusA;
		qBusB <= dBusB;
	end


endmodule


module EXEC(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, Edxtop, dFPoint, dDsize, dLoadext, dJal, dJar, dLoadext, dImm16, dBusA, dBusB, Extop_out, ALUSrc_out, RegDst_out, MemWr_out, Branch_out, MemtoReg_out, RegWr_out, Dsize_out, Zero_out0);



endmodule






//----------------------------------------------OLD STUFF-------------------------------------------------------//
module exec_unit(clock, reset, RegDst, ALUSrc, MemToReg, RegWrite, MemWr, Branch, Jump, AluCtrl, Extop, FPoint, Dsize, Loadext, Jal, Jar, Loadext, Imm16, BusA, BusB, Extop_out, ALUSrc_out, RegDst-out, MemWr_out, Branch_out, MemtoReg_out, RegWr_out, Dsize_out, Zero_out);
	
	input RegDst, ALUSrc, MemToReg, RegWrite, MemWr, Branch, Jump, Extop, Loadext, Jal, Jar, Loadext, clock, reset;
	input [15:0] Imm16;
	input [31:0] BusA, BusB;
	input [3:0] AluCtrl;
	input [1:0] FPoint, Dsize;
	output Extop_out, ALUSrc_out, RegDst_out, MemWr_out, Branch_out, MemtoReg_out, RegWr_out, Zero_out;
	output [1:0] Dsize_out;
	
	wire [31:0] ext_out, mux0_out; //Output of extender, output of mux 	
	wire [9:0] reg_in, reg_out; //Bits going into and out of register
	wire zero; //Zero output from ALU

	//Execution part of the single cycle
	extender EXT0 (Imm16,Extop, ext_out);
    	mux_2to1_n #(.n(32)) MUX0(BusB, ext_out, ALUSrc, mux0_out);
	alu ALU(BusA, mux0_out, ALUCtrl, alu_out, zero);
	
	//Register at the end	
	assign reg_in = {Extop, ALUSrc, RegDst, MemWr, Branch, MemtoReg, RegWr, Dsize, Zero}
	assign reg_out = {Extop_out, ALUSrc_out, RegDst_out, MemWr_out, Branch_out, MemtoReg_out, RegWr_out, Dsize_out, Zero_out};
	PCReg #(.width(10)) PC (reg_out, reg_in, clock, reset);


endmodule