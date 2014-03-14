//  Testbench for the very top... the whole dang thing

module pipeline_tb;
reg clock;
reg reset;
reg [8*80-1:0] filename;
wire [0:31] PC;

pipeline top (.clock(clock),.reset(reset));

//assign PC = {top.IFU.PCReg.out,2'b00};

always begin
   #1 clock = ~clock;
end

integer i;
initial begin
  // Clear DMEM
   for (i = 0; i < top.DMEM.SIZE; i = i+1)
      top.DMEM.mem[i] = 8'h0;

  //Load IMEM from file
   if (!$value$plusargs("instrfile=%s", filename)) begin
      filename = "instr_unsignedsum.hex";
   end
   $readmemh(filename, top.IFU.IMEM.mem);
  // Load DMEM from file
  if (!$value$plusargs("datafile=%s", filename)) begin
      filename = "data_unsignedsum.hex";
  end
  $readmemh(filename, top.DMEM.mem);

  $monitor("Instruction = %h PC =  %h Target = %h", top.IFU.instruction, top.IFU.pcout, top.IFU.mux2);  

   #0 clock=1; reset=0;
   #2 reset=1;

   #50000
   $finish;
end

always @(top.instruction) begin
   //This checks for a trap 0x300 (signifying the end of the file)
   if (top.instruction == 32'h44000300)
   begin
   for (i = 8192; i < 8232; i = i + 4)
   $display("Mem[%d] = %d", i, {top.mem.DMEM.mem[i], top.mem.DMEM.mem[i+1], top.mem.DMEM.mem[i+2], top.mem.DMEM.mem[i+3]});
   $finish;
   end
end
endmodule
