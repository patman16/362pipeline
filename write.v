module WrRegister(clk, dmem2reg, dregwr, drw, ddmem, dexecresult, dfpoint, ddelayslot2, djal, qmem2reg, qregwr, qrw, qdmem, qexecresult, qfpoint, qdelayslot2, qjal);
	input clk, dmem2reg, dregwr, djal;
	input [1:0] dfpoint;
	input [4:0] drw;
	input [31:0] ddmem, dexecresult, ddelayslot2;
	output qmem2reg, qregwr, qjal;
	output [1:0] qfpoint;
	output [4:0] qrw;
	output [31:0] qdmem, qexecresult, qdelayslot2;
	reg qmem2reg, qregwr, qjal;
	reg [1:0] qfpoint;
	reg [4:0] qrw;
	reg [31:0] qdmem, qexecresult, qdelayslot2;
	
	initial begin
		qmem2reg <= 0;
		qregwr <= 0;
		qrw <= 0;
		qdmem <= 0;
		qexecresult <= 0;
		qfpoint <= 0;
		qdelayslot2 <= 0;
		qjal <= 0;
	end
	
	always @ (posedge clk)
	begin
		qmem2reg <= dmem2reg;
		qregwr <= dregwr;
		qrw <= drw;
		qdmem <= ddmem;
		qexecresult <= dexecresult;
		qfpoint <= dfpoint;
		qdelayslot2 <= ddelayslot2;
		qjal <= djal;
	end
	
endmodule

module Write(clk, mem2regin, regwritein, rwin, dmemin, execresultin, fpointin, delayslot2in, jalin, rw, busW, regwr, fpoint);
	input clk, mem2regin, regwritein, jalin;
	input [1:0] fpointin;
	input [4:0] rwin;
	input [31:0] dmemin, execresultin, delayslot2in;
	output regwr;
	output [1:0] fpoint;
	output [4:0] rw;
	output [31:0] busW;
	wire mem2regout, jalout;
	wire [31:0] dmemout, execresultout, delayslot2out, source;
	
	WrRegister writereg(clk, mem2regin, regwritein, rwin, dmemin, execresultin, fpointin, delayslot2in, jalin, mem2regout, regwr, rw, dmemout, execresultout, fpoint, delayslot2out, jalout);
	mux_2to1_n #(.n(32)) sourcemux(execresultout, dmemout, mem2regout, source);
	mux_2to1_n #(.n(32)) jalmux(source, delayslot2out, jalout, busW);
endmodule