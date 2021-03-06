module registers(clk, write, fpoint, rw, rs, rt, busW, busA, busB);
	input clk, write;
	input [1:0] fpoint;
	input [4:0] rw, rs, rt;
	input [31:0] busW;
	output [31:0] busA, busB;
		
	reg [31:0] intregs [31:0];
	reg [31:0] fpregs [31:0];
	
	assign busA = fpoint == 1 ? fpregs[rs] : intregs[rs];
	assign busB = fpoint == 1 ? fpregs[rt] : intregs[rt];

	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: intinitial
		initial begin
			intregs[i] <= 0;
		end
		end
		for (i = 0; i < 32; i = i + 1) begin: fpinitial
		initial begin
			fpregs[i] <= 0;
		end
		end	
	endgenerate

	always @(posedge clk)
	begin
	if (write)
		case (fpoint)
		0 : intregs[rw] <= busW;
		1 : fpregs[rw] <= intregs[rs];
		2 : intregs[rw] <= fpregs[rs];
		3 : fpregs[rw] <= busW;
		endcase
	end

endmodule
