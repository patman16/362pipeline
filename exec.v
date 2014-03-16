module EXRegister(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dImm32, dBusA, dBusB, dRw, dDelayslot2, qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qJump, qAluCtrl, qFPoint, qDsize, qLoadext, qJal, qImm32, qBusA, qBusB, qRw, qDelayslot2);

	input clk;
	input dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dJump, dLoadext, dJal;
	input [31:0] dBusA, dBusB, dDelayslot2, dImm32;
	input [4:0] dRw;
	input [3:0] dAluCtrl;
	input [1:0] dFPoint, dDsize;

	output qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qJump, qJal, qLoadext;
	output [31:0] qBusA, qBusB, qDelayslot2, qImm32;
	output [4:0] qRw;
	output [3:0] qAluCtrl;
	output [1:0] qFPoint, qDsize;

	reg qRegDst, qALUSrc, qMemToReg, qRegWrite, qMemWr, qJump, qJal, qLoadext;
	reg [4:0] qRw;
	reg [31:0] qBusA, qBusB, qDelayslot2, qImm32;
	reg [3:0] qAluCtrl;
	reg [1:0] qFPoint, qDsize;

	//Initial Outputs
	initial begin
		qRegDst <= 0; 
		qALUSrc <= 0; 
		qMemToReg <= 0; 
		qRegWrite <= 0; 
		qMemWr <= 0;
		qJump <= 0;
		qAluCtrl <= 0;
		qFPoint <= 0;
		qDsize <= 0;				
		qLoadext <= 0;
		qJal <= 0;
		qImm32 <= 0;
		qBusA <= 0;
		qBusB <= 0;
		qRw <= 0;
		qDelayslot2 <= 0;
	end

	//Inputs = Outputs 
	always @ (posedge clk)
	begin
		qRegDst <= dRegDst; 
		qALUSrc <= dALUSrc; 
		qMemToReg <= dMemToReg; 
		qRegWrite <= dRegWrite; 
		qMemWr <= dMemWr;
		qJump <= dJump;
		qAluCtrl <= dAluCtrl;
		qFPoint <= dFPoint;
		qDsize <= dDsize;				
		qLoadext <= dLoadext;
		qJal <= dJal;
		qImm32 <= dImm32;
		qBusA <= dBusA;
		qBusB <= dBusB;
		qRw <= dRw;
		qDelayslot2 <= dDelayslot2;
	end


endmodule


module exec(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dImm32, dBusA, dBusB, dRw, dDelayslot2, aluselectA, aluselectB, priorALUresult, ALUwriteback, MemWr, MemtoReg, RegWr, Dsize, ALUout, Rw, Jump, FPoint, Loadext, Jal, BusB, Delayslot2);

	input clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dJump, dJal, dJar, dLoadext, aluselectA, aluselectB;
	input [4:0] dRw;
	input [31:0] dBusA, dBusB, dDelayslot2, dImm32, priorALUresult, ALUwriteback;
	input [3:0] dAluCtrl;
	input [1:0] dFPoint, dDsize;

	output MemWr, MemtoReg, RegWr, Jump, Loadext, Jal, Jar;
	output [1:0] FPoint, Dsize;
	output [31:0] BusB, ALUout, Delayslot2;
	output [4:0] Rw;

	wire [31:0] mux0_out; //, output of mux	
	wire ALUSrc, RegDst;
	wire [4:0] Rd, Rt;
	wire [31:0] BusA, BusB_inside, Imm32, fwdBusA, fwdBusB;
	wire [3:0] AluCtrl;	
	wire open;
	

	//Pipeline Register
	EXRegister register (clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dImm32, dBusA, dBusB, dRw, dDelayslot2, RegDst, ALUSrc, MemToReg, RegWrite, MemWr, Jump, AluCtrl, FPoint, Dsize, Loadext, Jal, Imm32, BusA, BusB_inside, Rd, Rt, Delayslot2);	
	
	//Execution part of the single cycle
    mux_2to1_n #(.n(32)) MUX0(BusB_inside, Imm32, ALUSrc, mux0_out);
	alu ALU(fwdBusA, mux0_out, AluCtrl, ALUout, open);
	mux_4to1_n #(.n(32)) MUX1(BusA, priorALUresult, ALUwriteback, 32'd0, aluselectA, fwdBusA); 
	mux_4to1_n #(.n(32)) MUX2(mux0_out, priorALUresult, ALUwriteback, 32'd0, aluselectB, fwdBusB);
	
	assign BusB = BusB_inside;

endmodule
