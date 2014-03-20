module pipeline_tb;
reg clock;
reg reset;
reg [8*80-1:0] filename;
wire [0:31] PC;

pipeline top (.clock(clock),.reset(reset));

always begin
   #1 clock = ~clock;
end

integer i;
initial begin
  // Clear DMEM
   for (i = 0; i < top.mem.DMEM.SIZE; i = i+1)
      top.mem.DMEM.mem[i] = 8'h0;

  //Load IMEM from file
   if (!$value$plusargs("instrfile=%s", filename)) begin
      filename = "instr_fib.hex";
   end
   $readmemh(filename, top.IFU.IMEM.mem);
  // Load DMEM from file
  if (!$value$plusargs("datafile=%s", filename)) begin
      filename = "data_fib.hex";
  end
  $readmemh(filename, top.mem.DMEM.mem);

  $monitor("Instruction = %h Instruction2 = %h Instruction3 = %h PC = %h Target = %h rw_ex = %d rw_mem = %d ra = %d rb = %d Stall = %b fwdA = %b fwdB = %b Branch = %b busA = %d, busB = %d Rw = %d busW = %d regwr = %b ALU A = %d ALU B = %d ALU out = %d Dmem in = %d Dmem out = %d memwr = %b", top.IFU.instruction, top.instruction_1, top.instruction_2, top.IFU.pcout, top.IFU.mux2, top.rw_1, top.rw_2, top.instruction_1[25:21], top.instruction_1[20:16], top.stall, top.fwdA, top.fwdB, top.branch, top.decode.fwdbusA, top.decode.fwdbusB, top.rw_3, top.busW, top.wrenable, top.execstage.BusA, top.execstage.mux0_out, top.aluout_0, top.mem.datamem_muxin, top.mem.dmem_out, top.mem.MemWr);  

   #0 clock=1; reset=0;
   #2 reset=1;

   #50000
   $finish;
end

always @(top.instruction_0) begin
   //This checks for a trap 0x300 (signifying the end of the file)
   if (top.instruction_0 == 32'h44000300)
   begin
   #10
   for (i = 8192; i < 8376; i = i + 4)
   $display("Mem[%d] = %d", i, {top.mem.DMEM.mem[i], top.mem.DMEM.mem[i+1], top.mem.DMEM.mem[i+2], top.mem.DMEM.mem[i+3]});
   $finish;
   end
end
endmodule
