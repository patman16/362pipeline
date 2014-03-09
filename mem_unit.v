module MEMRegister(clk, dMemWr, dBranch, dMemtoReg, dRegWr, dDsize, dZero, dExecResult, dBusB, dloadext, dJump, dJal, dJar,dFPoint, dRw, dBranchTarget, qMemWr, qBranch, qMemtoReg, qRegWr, qDsize, qZero, qExecResult, qBusB, qloadext, qJump, qJal, qJar, qFPoint, qRw, qBranchTarget);
	input clk, dMemWr, dBranch, dMemtoReg, dRegWr, dZero, dloadext, dJump, dJal, dJar;
	input [1:0] dDsize, dFPoint;
	input [4:0] dRw;
	input [31:0] dExecResult, dBusB, dBranchTarget;
	output qMemWr, qBranch, qMemtoReg, qRegWr, qZero, qloadext, qJump, qJal, qJar;
	output [1:0] qDsize, qFPoint;
	output [4:0] qRw;
	output [31:0] qExecResult, qBusB, qBranchTarget;
	reg [1:0] qDsize, qFPoint;
	reg [4:0] qRw;
	reg [31:0] qExecResult;
	reg qMemWr, qBranch, qMemtoReg, qRegWr, qZero, qJump, qJal, qJar;

	initial begin
		qMemWr <=0;
		qBranch <= 0;
		qMemtoReg <= 0;
		qRegWr <= 0;
		qDsize <= 0;
		qZero <= 0;
		qExecResult <= 0;
		qBusB <= 0;
		qloadext <= 0;
		qJump <=0;
		qJal <= 0;
		qJar <= 0;
		qFPoint <= 0;
		qRw <= 0;	
	end

	always @ (posedge clk)
	begin
		qMemWr <=dMemWr;
		qBranch <= dBranch;
		qMemtoReg <= dMemtoReg;
		qRegWr <= dRegWr;
		qDsize <= dDsize;
		qZero <= dZero;
		qExecResult <= dExecResult;
		qBusB <= dBusB;
		qloadext <= dloadext;
		qJump <= dJump;
		qJal <= dJal;
		qJar <= dJar;
		qFPoint <= dFPoint;
		qRw <= dRw;
	end
endmodule

module mem_unit(clk, busB, loadext, memWr, dSize, execResult, branch, zero, branchTarget, memtoreg, regWr, jump, fPoint, jal, jar, rw, toIfetch, memtoreg_out, regWr_out, dmem_out, execResult_out, jump_out, fPoint_out, jal_out, jar_out, rw_out, PCSRC);

	input clk, loadext, memWr,branch, zero, regWr, jump, jal, jar;
	input [31:0] execResult, branchTarget, busB;
	input [4:0] rw;
	input [1:0] fPoint, dSize;
	output memtoreg_out, regWr_out, jump_out,jal_out, jar_out;
	output [31:0] dmem_out, execResult_out, PCSRC;
	output [1:0] fPoint_out;
	output [4:0] rw_out;
	
	wire [31:0] execResult_inside;
	
	
	MEMRegister mRegister(clck, memWr, branch, memtoreg, regwr, zero, execResult, busB, loadext, jump, jal, jar, fPoint, rw, branchTarget, 
	

endmodule
/*module MEMRegister(clk, dMemWr, dBranch, dMemtoReg, dRegWr, dDsize, dZero, dExecResult, dBusB, dloadext, dJump, dJal, dJar,dFPoint, dRw, dBranchTarget, qMemWr, qBranch, qMemtoReg, qRegWr, qDsize, qZero, qExecResult, qBusB, qloadext, qJump, qJal, qJar, qFPoint, qRw, qBranchTarget);*/

/*  Need control signals for dmem
    dmem #(.SIZE(16384)) DMEM(alu_out, rData, datamem_muxin, memwrite, dsize, clock);

    extender #(.inN(16), .outN(32)) EXT1(rData[15:0],loadext,mux2_in1);
    extender #(.inN(8), .outN(32)) EXT2(rData[7:0],loadext,mux2_in0); 
    mux_4to1_n #(.n(32)) MUX2(mux2_in0, mux2_in1, 32'd0, rData, dsize, datamem_muxout);
     
//Before Data 
    extender #(.inN(16), .outN(32)) EXT3(busB[15:0],1'b0, mux3_in1);
    extender #(.inN(8), .outN(32)) EXT4(busB [7:0],1'b0, mux3_in0); 
    mux_4to1_n #(.n(32)) MUX3(mux3_in0, mux3_in1, 32'd0, busB, dsize, datamem_muxin);*/
