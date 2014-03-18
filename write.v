module WrRegister(clk, dregwr, drw, dbusW, dfpoint, ddelayslot2, djal, qregwr, qrw, qbusW, qfpoint, qdelayslot2, qjal);
	input clk, dregwr, djal;
	input [1:0] dfpoint;
	input [4:0] drw;
	input [31:0] dbusW, ddelayslot2;
	output qregwr, qjal;
	output [1:0] qfpoint;
	output [4:0] qrw;
	output [31:0] qbusW, qdelayslot2;
	reg qregwr, qjal;
	reg [1:0] qfpoint;
	reg [4:0] qrw;
	reg [31:0] qbusW, qdelayslot2;
	
	initial begin
		qregwr <= 0;
		qrw <= 0;
		qbusW <= 0;
		qfpoint <= 0;
		qdelayslot2 <= 0;
		qjal <= 0;
	end
	
	always @ (posedge clk)
	begin
		qregwr <= dregwr;
		qrw <= drw;
		qbusW <= dbusW;
		qfpoint <= dfpoint;
		qdelayslot2 <= ddelayslot2;
		qjal <= djal;
	end
	
endmodule

module Write(clk, regwritein, rwin, busWin, fpointin, delayslot2in, jalin, rw, busW, regwr, fpoint);
	input clk, regwritein, jalin;
	input [1:0] fpointin;
	input [4:0] rwin;
	input [31:0] busWin, delayslot2in;
	output regwr;
	output [1:0] fpoint;
	output [4:0] rw;
	output [31:0] busW;
	wire jalout;
	wire [31:0] busWout, delayslot2out, source;
	
	WrRegister writereg(clk, regwritein, rwin, busWin, fpointin, delayslot2in, jalin, regwr, rw, busWout, fpoint, delayslot2out, jalout);
	mux_2to1_n #(.n(32)) jalmux(busWout, delayslot2out, jalout, busW);
endmodule
