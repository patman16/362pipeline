module extender #(parameter inN = 16, outN = 32) (a,sel, z);
    input [inN-1:0] a;
    input sel;
    output [outN-1:0] z;
    reg [outN-1:0] test;

    assign z = test;

    always @*
    begin
	if (sel == 1'b1)	
    	test[outN-1:0] <= { {inN{a[inN-1]}}, a[inN-1:0] };
	else
	test[outN-1:0] <= { 1'b0, a[inN-1:0] };
    end
endmodule

module extender_8 #(parameter inN = 8, outN = 32) (a,sel,z);
    input [inN-1:0] a;
    input sel;
    output [outN-1:0] z;
    reg [outN-1:0] test;

    assign z = test;

    always @*
    begin
	if (sel == 1'b1)	
    	test[outN-1:0] <= { {inN{a[inN-1]}}, a[inN-1:0] };
	else
	test[outN-1:0] <= { 1'b0, a[inN-1:0] };
    end
endmodule

module extender_26 #(parameter inN = 26, outN = 32) (a,sel,z);
    input [inN-1:0] a;
    input sel;
    output [outN-1:0] z;
    reg [outN-1:0] test;

    assign z = test;

    always @*
    begin
	if (sel == 1'b1)	
    	test[outN-1:0] <= { {inN{a[inN-1]}}, a[inN-1:0] };
	else
	test[outN-1:0] <= { 1'b0, a[inN-1:0] };
    end
endmodule

