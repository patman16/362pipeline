module PCReg #(parameter width = 30, init = 0) (out, in, clk, rst, stall); 
   output [width-1:0] out;
   reg [width-1:0]    out;
   input [width-1:0]  in;
   input 	      clk, rst, stall;

   always @ (posedge clk or negedge rst)
     if (~rst)
       out <= init;
     else if (~stall)
       out <= in;
   
endmodule

module ifu(branch, jump, clock, start, jar, newPC, branchtarget, instruction, delayslot, delayslot2, stall);

    input branch, jump, clock, start, jar, stall;
    input [29:0] newPC, branchtarget;	
    output [31:0] delayslot, delayslot2, instruction;
    reg [29:0] one;
    wire mux0control, open1, open2, open3;
    wire [29:0] adder0, adder1, mux0, mux1, mux2, jumpmux, pcout;
    wire [31:0] extend, address, instructionwire;	

    adder_30 adder0_map (pcout, one, 1'b0, adder0, open1);
    adder_30 adder2_map (adder0, extend[31:2], 1'b0, jumpmux, open3);
    adder_30 adder3_map (adder0, 30'd1, 1'b0, delayslot2[31:2], open4);
    mux_2to1_30 mux0_map (adder0, branchtarget, branch, mux0);
    mux_2to1_30 mux1_map (mux0, jumpmux, jump, mux1);
    mux_2to1_30 mux2_map (mux1, newPC, jar, mux2); 
    PCReg PC (pcout, mux2, clock, start, stall);
    //imem #(.SIZE(1024)) IMEM (address, instructionwire);
    extender_26 EXT (instructionwire[25:0], 1'b1, extend);

    assign address[31:2] = pcout;
    assign address[1:0] = 2'b00;
    assign delayslot = {adder0, 2'b00};
    assign delayslot2[1:0] = 2'b00;
    assign instruction = instructionwire;

    initial begin
	one = 30'b000000000000000000000000000001;
    end

endmodule
