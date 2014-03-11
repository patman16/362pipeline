module MEMRegister(clk, dMemWr, dMemtoReg, dRegWr, dDsize, dExecResult, dBusB, dloadext, dJump, dJal, dFPoint, dRw, dDelayslot2, qMemWr, qMemtoReg, qRegWr, qDsize, qExecResult, qBusB, qloadext, qJump, qJal, qFPoint, qRw, qDelayslot2);
	input clk, dMemWr, dMemtoReg, dRegWr, dloadext, dJump, dJal;
	input [1:0] dDsize, dFPoint;
	input [4:0] dRw;
	input [31:0] dExecResult, dBusB, dDelayslot2;
	
	output qMemWr, qMemtoReg, qRegWr, qloadext, qJump, qJal;
	output [1:0] qDsize, qFPoint;
	output [4:0] qRw;
	output [31:0] qExecResult, qBusB, qDelayslot2;
	
	reg qMemWr, qMemtoReg, qRegWr, qloadext, qJump, qJal;
	reg [1:0] qDsize, qFPoint;
	reg [4:0] qRw;
	reg [31:0] qExecResult, qBusB, qDelayslot2;
	

	initial begin
		qMemWr <=0;
		qMemtoReg <= 0;
		qRegWr <= 0;
		qloadext <= 0;
		qJump <=0;
		qJal <= 0;
		qDsize <= 0;
		qFPoint <= 0;
		qRw <= 0;
		qExecResult <= 0;
		qBusB <= 0;
		qDelayslot2 <= 0;
			
	end

	always @ (posedge clk)
	begin
		qMemWr <= dMemWr;
		qMemtoReg <= dMemtoReg;
		qRegWr <= dRegWr;
		qloadext <= dloadext;
		qJump <=dJump;
		qJal <= dJal;
		qDsize <= dDsize;
		qFPoint <= dFPoint;
		qRw <= dRw;
		qExecResult <= dExecResult;
		qBusB <= dBusB;
		qDelayslot2 <= dDelayslot2;
	end
endmodule

module mem_unit(clk, dMemWr, dMemtoReg, dRegWr, dDsize, dExecResult, dBusB, dloadext, dJump, dJal, dFPoint, dRw, dDelayslot2, memtoreg_out, regWr_out, dmem_out, execResult_out, jump_out, fPoint_out, jal_out, rw_out, Delayslot2_out);

	input clk, dMemWr, dMemtoReg, dRegWr, dloadext, dJump, dJal;
	input [1:0] dDsize, dFPoint;
	input [4:0] dRw;
	input [31:0] dExecResult, dBusB, dDelayslot2;
	
	//Outputs that were just being passed through
	output memtoreg_out, regWr_out, jump_out, jal_out;
	output [31:0] execResult_out, Delayslot2_out;
	output [1:0] fPoint_out;
	output [4:0] rw_out;

	//New outputs created
	output[31:0] dmem_out;
	
	//Wires coming from Pipeline register
	wire Memwr, loadext; 
	wire [1:0] Dsize;
	wire [31:0] ExecResult, BusB;
	
	//New wires created
	wire [31:0] rData, datamem_muxin, datamem_muxout, mux2_in0, mux2_in1, mux3_in1, mux3_in0;

	//Pipeline Register
	MEMRegister mRegister(clk, dMemWr, dMemtoReg, dRegWr, dDsize, dExecResult, dBusB, dloadext, dJump, dJal, dFPoint, dRw, dDelayslot2, MemWr, memtoreg_out, regWr_out, Dsize, ExecResult, BusB, loadext, jump_out, jal_out, fPoint_out, rw_out, Delayslot2_out);

	//Actual Memory Stage
	dmem #(.SIZE(16384)) DMEM(ExecResult, rData, datamem_muxin, MemWr, Dsize, clk);
	extender #(.inN(16), .outN(32)) EXT1(rData[15:0],loadext,mux2_in1);
    	extender #(.inN(8), .outN(32)) EXT2(rData[7:0],loadext,mux2_in0); 
    	mux_4to1_n #(.n(32)) MUX2(mux2_in0, mux2_in1, 32'd0, rData, Dsize, datamem_muxout);

	extender #(.inN(16), .outN(32)) EXT3(busB[15:0],1'b0, mux3_in1);
   	extender #(.inN(8), .outN(32)) EXT4(busB [7:0],1'b0, mux3_in0); 
   	mux_4to1_n #(.n(32)) MUX3(mux3_in0, mux3_in1, 32'd0, BusB, Dsize, datamem_muxin);
	
	//Calculating 
	assign execResult_out = ExecResult;

endmodule

