module pipeline(clock, reset);
	input clock, reset;
	
	ifu IFU();
	RegDecoder decode();
	
endmodule