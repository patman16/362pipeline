module MEMRegister(clk, dExtOp, dALUSrc, dRegDst, dMemWr, dBranch, dMemtoReg, dRegWr, dDsize, dZero, dALUout, qExtOp, qALUSrc, qRegDst, qMemWr, qBranch, qMemtoReg, qRegWr, qDsize, qZero, qALUout);
	input clk, dExtOp, dALUSrc, dRegDst, dMemWr, dBranch, dMemtoReg, dRegWr, dZero;
	input [1:0] dDsize;
	input [31:0] dALUout;
	output qExtOp, qALUSrc, qRegDst, qMemWr, qBranch, qMemtoReg, qRegWr, qZero;
	output [1:0] qDsize;
	output [31:0] qALUout;
	reg [1:0] qDsize;
	reg [31:0] qALUout;
	reg qExtOp,qALUSrc,qRegDst, qMemWr, qBranch, qMemtoReg, qRegWr, qZero;

	initial begin
		qExtOp <= 0;
		qALUSrc <= 0;
		qRegDst <= 0;
		qMemWr <=0;
		qBranch <= 0;
		qMemtoReg <= 0;
		qRegWr <= 0;
		qDsize <= 0;
		qZero <= 0;
		qALUout <= 0;
		
	end

	always @ (posedge clk)
	begin
		qExtOp <= dExtOp;
		qALUSrc <= dALUSrc;
		qRegDst <= dRegDst;
		qMemWr <=dMemWr;
		qBranch <= dBranch;
		qMemtoReg <= dMemtoReg;
		qRegWr <= dRegWr;
		qDsize <= dDsize;
		qZero <= dZero;
		qALUout <= dALUout;

	end
endmodule

module mem_unit();

endmodule


/*  Need control signals for dmem
    dmem #(.SIZE(16384)) DMEM(alu_out, rData, datamem_muxin, memwrite, dsize, clock);

    extender #(.inN(16), .outN(32)) EXT1(rData[15:0],loadext,mux2_in1);
    extender #(.inN(8), .outN(32)) EXT2(rData[7:0],loadext,mux2_in0); 
    mux_4to1_n #(.n(32)) MUX2(mux2_in0, mux2_in1, 32'd0, rData, dsize, datamem_muxout);
     
//Before Data 
    extender #(.inN(16), .outN(32)) EXT3(busB[15:0],1'b0, mux3_in1);
    extender #(.inN(8), .outN(32)) EXT4(busB [7:0],1'b0, mux3_in0); 
    mux_4to1_n #(.n(32)) MUX3(mux3_in0, mux3_in1, 32'd0, busB, dsize, datamem_muxin);*/
