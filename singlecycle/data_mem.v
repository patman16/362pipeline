module dmem(addr, rData, wData, writeEnable, dsize, clk);
    parameter SIZE=32768;

    input [0:31] addr, wData;
    input 	writeEnable, clk;
    input [0:1] dsize; // equivalent to bytes-1 ( 3=Word, 1=Halfword, 0=Byte)
    output [0:31] rData;
    reg [0:7] 	 mem[0:(SIZE-1)];

    // Write
    always @ (posedge clk) begin
        if (writeEnable) begin
            case (dsize)
              2'b11: begin
                 // word
                 {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]} <= wData[0:31];
              end
              2'b01: begin
                 // halfword
                 {mem[addr], mem[addr+1]} <= wData[16:31];
              end
              2'b00: begin
                 // byte
                 mem[addr] <= wData[26:31];
              end
              default: {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]} <= wData[0:31];
            endcase
        end
    end
    // Read
    assign rData = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};
endmodule // dmem
