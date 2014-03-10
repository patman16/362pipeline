module MEM_test;
	
	reg clk, dMemWr, dBranch, dMemtoReg, dRegWr, dZero, dloadext, dJump, dJal, dJar;
	reg [1:0] dDsize, dFPoint;
	reg [4:0] dRw;
	reg [31:0] dExecResult, dBusB, dBranchTarget;
	
	wire memtoreg_out, regWr_out, jump_out, jal_out, jar_out, PCSrc_out;
	wire [31:0] execResult_out, BranchTarget_out, BusB_out;
	wire [1:0] fPoint_out;
	wire [4:0] rw_out;
	wire[31:0] dmem_out;
	
	mem_unit MEM(clk, dMemWr, dBranch, dMemtoReg, dRegWr, dDsize, dZero, dExecResult, dBusB, dloadext, dJump, dJal, dJar, dFPoint, dRw, dBranchTarget, memtoreg_out, regWr_out, dmem_out, execResult_out, jump_out, fPoint_out, jal_out, jar_out, rw_out, PCSrc_out, BranchTarget_out, BusB_out);

	always #1 clk = ~clk;
	
	initial begin
	    clk = 0;
	    dMemWr = 0;
	    dBranch = 0;
	    dMemtoReg = 0; 
	    dRegWr = 0;
	    dZero = 0;
	    dloadext = 0; 
	    dJump = 0; 
 	    dJal = 0; 
	    dJar = 0;
	    dDsize = 0;
	    dFPoint = 0;
	    dRw = 0;
	    dExecResult = 0;
	    dBusB = 0;
	    dBranchTarget = 0;
	end
	
	initial begin
	$monitor("clk = %b, dMemWr = %b, dBranch = %b, dMemtoReg = %b, execResult_out = %h, BranchTarget_out = %h, rw_out = %h", clk, dMemWr, dBranch, dMemtoReg, execResult_out, BranchTarget_out, rw_out);
	
	#2
	#2  dMemWr = 0;
	    dBranch = 0;
	    dMemtoReg = 0; 
	    dRegWr = 0;
	    dZero = 0;
	    dloadext = 0; 
	    dJump = 0; 
 	    dJal = 0; 
	    dJar = 0;
	    dDsize = 0;
	    dFPoint = 0;
	    dRw = 0;
	    dExecResult = 0;
	    dBusB = 0;
	    dBranchTarget = 0;
	#2 
	    dJump = 0; 
 	    dJal = 0; 
	    dJar = 0;
	    dDsize = 0;
	    dFPoint = 0;
	    dRw = 0;
	    dExecResult = 0;
	    dBusB = 0;
	    dBranchTarget = 0;
	
	$finish;
	end
endmodule
