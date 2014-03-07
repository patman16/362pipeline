module testbench;
	reg clk, mem2reg, regwrin;
	reg [4:0] rwin;
	reg [31:0] execresult, dmem;
	wire regwr;
	wire [4:0] rw;
	wire [31:0] busW;
	
	Write writereg(clk, mem2reg, regwrin, rwin, dmem, execresult, rw, busW, regwr);
	
	always #1 clk = ~clk;
	
	initial begin
		clk = 1;
		//don't write to reg 0, select alu result
		regwrin = 0;
		rwin = 0;
		mem2reg = 0;
		execresult = 3;
		dmem = 7;
	end
	
	initial begin
	$monitor("Rw = %d busW = %d regwr = %b", rw, busW, regwr);
	#2
	//write to reg 1, select alu result
	#2 regwrin = 1; rwin = 1; 
	//write to reg 2, select dmem out
	#2 rwin = 2; mem2reg = 1;
	//don't write to reg 3, select dmem out
	#2 regwrin = 0; rwin = 3;
	$finish;
	end
endmodule