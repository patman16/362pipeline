module WrRegister(clk, dmem2reg, dregwr, drw, ddmem, dexecresult, qmem2reg, qregwr, qrw, qdmem, qexecresult);
	input clk, dmem2reg, dregwr;
	input [4:0] drw;
	input [31:0] ddmem, dexecresult;
	output qmem2reg, qregwr;
	output [4:0] qrw;
	output [31:0] qdmem, qexecresult;
	reg qmem2reg, qregwr;
	reg [4:0] qrw;
	reg [31:0] qdmem, qexecresult;
	
	initial begin
		qmem2reg <= 0;
		qregwr <= 0;
		qrw <= 0;
		qdmem <= 0;
		qexecresult <= 0;
	end
	
	always @ (posedge clk)
	begin
		qmem2reg <= dmem2reg;
		qregwr <= dregwr;
		qrw <= drw;
		qdmem <= ddmem;
		qexecresult <= dexecresult;
	end
	
endmodule

module Write(clk, mem2regin, regwritein, rwin, dmemin, execresultin, rw, busW, regwr);
	input clk, mem2regin, regwritein;
	input [4:0] rwin;
	input [31:0] dmemin, execresultin;
	output regwr;
	output [4:0] rw;
	output [31:0] busW;
	wire mem2regout;
	wire [31:0] dmemout, execresultout;
	
	WrRegister writereg(clk, mem2regin, regwritein, rwin, dmemin, execresultin, mem2regout, regwr, rw, dmemout, execresultout);
	mux_2to1_n #(.n(32)) sourcemux(execresultout, dmemout, mem2regout, busW);
endmodule