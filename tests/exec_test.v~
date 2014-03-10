module EXEC_test;
	
	reg clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dJal, dJar, dLoadext;
	reg [4:0] dRd, dRt;
	reg [31:0] dBusA, dBusB, dNextAddress, dImm32;
	reg [3:0] dAluCtrl;
	reg [1:0] dFPoint, dDsize;

	wire MemWr, Branch, MemtoReg, RegWr, Zero, Jump, Loadext, Jal, Jar;
	wire [1:0] FPoint, Dsize;
	wire [31:0] BusB, BranchTarget, ALUout;	
	wire [4:0] Rw;
	
	exec EXEC(clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, dAluCtrl, dFPoint, dDsize, dLoadext, dJal, dJar, dImm32, dBusA, dBusB, dRd, dRt, dNextAddress, MemWr, Branch, MemtoReg, RegWr, Dsize, Zero, ALUout, Rw, Jump, FPoint, Loadext, Jal, BusB, BranchTarget);
	
	always #1 clk = ~clk;
	
	initial begin
		clk = 1;
		dRegDst = 0; 
		dALUSrc = 0; 
		dMemToReg = 0; 
		dRegWrite = 0; 
		dMemWr = 0;
		dBranch = 0;
		dJump = 0;
		dAluCtrl = 0;
		dFPoint = 0;
		dDsize = 0;				
		dLoadext = 0;
		dJal = 0;
		dJar = 0;
		dImm32 = 0;
		dBusA = 0;
		dBusB = 0;
		dRd = 0;
		dRt = 0;
		dNextAddress = 32'h00620820;
		
	end
	
	initial begin
	$monitor("clk = %b, dRegDst = %b, dALUSrc = %b, dMemToReg = %b, dRegWrite = %b, dMemWr = %b, dBranch = %b, dJump = %b, BranchTarget = %h, ALUout = %h, Rw = %d", clk, dRegDst, dALUSrc, dMemToReg, dRegWrite, dMemWr, dBranch, dJump, BranchTarget, ALUout, Rw);
	
	#2
	#2  dRegDst = 1; 
	    dALUSrc = 0; 
            dMemToReg = 1; 
	    dRegWrite = 0; 
	    dMemWr = 1;
	    dBranch = 1;
	    dJump = 0;
	    dBusB = 32'h00620820;
	    dNextAddress = 32'h00620824;
	#2 
	    dRegDst = 0; 
	    dALUSrc = 0; 
            dMemToReg = 0; 
	    dRegWrite = 0; 
	    dMemWr = 0;
	    dBranch = 0;
	    dJump = 0;
            dBusB = 32'h00620824;
  	    dNextAddress = 32'h00620828;
	
	$finish;
	end
endmodule
