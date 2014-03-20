module mux_2to1_n #(parameter n = 1) (src0, src1, sel, z);
	input [(n-1):0] src0, src1;
	input sel;
	output [(n-1):0] z;
	
	assign z = (sel == 1'b0) ? src0 : src1;
endmodule

module mux_2to1_30 #(parameter n = 30) (src0, src1, sel, z);
	input [(n-1):0] src0, src1;
	input sel;
	output [(n-1):0] z;
	
	assign z = (sel == 1'b0) ? src0 : src1;
endmodule

module mux_2to1_5 #(parameter n = 5) (src0, src1, sel, z);
	input [(n-1):0] src0, src1;
	input sel;
	output [(n-1):0] z;
	
	assign z = (sel == 1'b0) ? src0 : src1;
endmodule

module mux_2to1_32 #(parameter n = 32) (src0, src1, sel, z);
	input [(n-1):0] src0, src1;
	input sel;
	output [(n-1):0] z;
	
	assign z = (sel == 1'b0) ? src0 : src1;
endmodule
