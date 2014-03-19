
module Write ( clk, regwritein, rwin, busWin, fpointin, delayslot2in, jalin, 
        rw, busW, regwr, fpoint );
  input [4:0] rwin;
  input [31:0] busWin;
  input [1:0] fpointin;
  input [31:0] delayslot2in;
  output [4:0] rw;
  output [31:0] busW;
  output [1:0] fpoint;
  input clk, regwritein, jalin;
  output regwr;

  tri   [31:0] busW;
  tri   [31:0] busWout;
  tri   [31:0] delayslot2out;
  tri   jalout;

  mux_2to1_n jalmux ( .p1(busWout), .p2(delayslot2out), .p3(jalout), .p4(busW)
         );
  DFF_X1 writereg_qjal_reg ( .D(jalin), .CK(clk), .Q(jalout) );
  DFF_X1 writereg_qdelayslot2_reg_0_ ( .D(delayslot2in[0]), .CK(clk), .Q(
        delayslot2out[0]) );
  DFF_X1 writereg_qdelayslot2_reg_1_ ( .D(delayslot2in[1]), .CK(clk), .Q(
        delayslot2out[1]) );
  DFF_X1 writereg_qdelayslot2_reg_2_ ( .D(delayslot2in[2]), .CK(clk), .Q(
        delayslot2out[2]) );
  DFF_X1 writereg_qdelayslot2_reg_3_ ( .D(delayslot2in[3]), .CK(clk), .Q(
        delayslot2out[3]) );
  DFF_X1 writereg_qdelayslot2_reg_4_ ( .D(delayslot2in[4]), .CK(clk), .Q(
        delayslot2out[4]) );
  DFF_X1 writereg_qdelayslot2_reg_5_ ( .D(delayslot2in[5]), .CK(clk), .Q(
        delayslot2out[5]) );
  DFF_X1 writereg_qdelayslot2_reg_6_ ( .D(delayslot2in[6]), .CK(clk), .Q(
        delayslot2out[6]) );
  DFF_X1 writereg_qdelayslot2_reg_7_ ( .D(delayslot2in[7]), .CK(clk), .Q(
        delayslot2out[7]) );
  DFF_X1 writereg_qdelayslot2_reg_8_ ( .D(delayslot2in[8]), .CK(clk), .Q(
        delayslot2out[8]) );
  DFF_X1 writereg_qdelayslot2_reg_9_ ( .D(delayslot2in[9]), .CK(clk), .Q(
        delayslot2out[9]) );
  DFF_X1 writereg_qdelayslot2_reg_10_ ( .D(delayslot2in[10]), .CK(clk), .Q(
        delayslot2out[10]) );
  DFF_X1 writereg_qdelayslot2_reg_11_ ( .D(delayslot2in[11]), .CK(clk), .Q(
        delayslot2out[11]) );
  DFF_X1 writereg_qdelayslot2_reg_12_ ( .D(delayslot2in[12]), .CK(clk), .Q(
        delayslot2out[12]) );
  DFF_X1 writereg_qdelayslot2_reg_13_ ( .D(delayslot2in[13]), .CK(clk), .Q(
        delayslot2out[13]) );
  DFF_X1 writereg_qdelayslot2_reg_14_ ( .D(delayslot2in[14]), .CK(clk), .Q(
        delayslot2out[14]) );
  DFF_X1 writereg_qdelayslot2_reg_15_ ( .D(delayslot2in[15]), .CK(clk), .Q(
        delayslot2out[15]) );
  DFF_X1 writereg_qdelayslot2_reg_16_ ( .D(delayslot2in[16]), .CK(clk), .Q(
        delayslot2out[16]) );
  DFF_X1 writereg_qdelayslot2_reg_17_ ( .D(delayslot2in[17]), .CK(clk), .Q(
        delayslot2out[17]) );
  DFF_X1 writereg_qdelayslot2_reg_18_ ( .D(delayslot2in[18]), .CK(clk), .Q(
        delayslot2out[18]) );
  DFF_X1 writereg_qdelayslot2_reg_19_ ( .D(delayslot2in[19]), .CK(clk), .Q(
        delayslot2out[19]) );
  DFF_X1 writereg_qdelayslot2_reg_20_ ( .D(delayslot2in[20]), .CK(clk), .Q(
        delayslot2out[20]) );
  DFF_X1 writereg_qdelayslot2_reg_21_ ( .D(delayslot2in[21]), .CK(clk), .Q(
        delayslot2out[21]) );
  DFF_X1 writereg_qdelayslot2_reg_22_ ( .D(delayslot2in[22]), .CK(clk), .Q(
        delayslot2out[22]) );
  DFF_X1 writereg_qdelayslot2_reg_23_ ( .D(delayslot2in[23]), .CK(clk), .Q(
        delayslot2out[23]) );
  DFF_X1 writereg_qdelayslot2_reg_24_ ( .D(delayslot2in[24]), .CK(clk), .Q(
        delayslot2out[24]) );
  DFF_X1 writereg_qdelayslot2_reg_25_ ( .D(delayslot2in[25]), .CK(clk), .Q(
        delayslot2out[25]) );
  DFF_X1 writereg_qdelayslot2_reg_26_ ( .D(delayslot2in[26]), .CK(clk), .Q(
        delayslot2out[26]) );
  DFF_X1 writereg_qdelayslot2_reg_27_ ( .D(delayslot2in[27]), .CK(clk), .Q(
        delayslot2out[27]) );
  DFF_X1 writereg_qdelayslot2_reg_28_ ( .D(delayslot2in[28]), .CK(clk), .Q(
        delayslot2out[28]) );
  DFF_X1 writereg_qdelayslot2_reg_29_ ( .D(delayslot2in[29]), .CK(clk), .Q(
        delayslot2out[29]) );
  DFF_X1 writereg_qdelayslot2_reg_30_ ( .D(delayslot2in[30]), .CK(clk), .Q(
        delayslot2out[30]) );
  DFF_X1 writereg_qdelayslot2_reg_31_ ( .D(delayslot2in[31]), .CK(clk), .Q(
        delayslot2out[31]) );
  DFF_X1 writereg_qfpoint_reg_0_ ( .D(fpointin[0]), .CK(clk), .Q(fpoint[0]) );
  DFF_X1 writereg_qfpoint_reg_1_ ( .D(fpointin[1]), .CK(clk), .Q(fpoint[1]) );
  DFF_X1 writereg_qbusW_reg_0_ ( .D(busWin[0]), .CK(clk), .Q(busWout[0]) );
  DFF_X1 writereg_qbusW_reg_1_ ( .D(busWin[1]), .CK(clk), .Q(busWout[1]) );
  DFF_X1 writereg_qbusW_reg_2_ ( .D(busWin[2]), .CK(clk), .Q(busWout[2]) );
  DFF_X1 writereg_qbusW_reg_3_ ( .D(busWin[3]), .CK(clk), .Q(busWout[3]) );
  DFF_X1 writereg_qbusW_reg_4_ ( .D(busWin[4]), .CK(clk), .Q(busWout[4]) );
  DFF_X1 writereg_qbusW_reg_5_ ( .D(busWin[5]), .CK(clk), .Q(busWout[5]) );
  DFF_X1 writereg_qbusW_reg_6_ ( .D(busWin[6]), .CK(clk), .Q(busWout[6]) );
  DFF_X1 writereg_qbusW_reg_7_ ( .D(busWin[7]), .CK(clk), .Q(busWout[7]) );
  DFF_X1 writereg_qbusW_reg_8_ ( .D(busWin[8]), .CK(clk), .Q(busWout[8]) );
  DFF_X1 writereg_qbusW_reg_9_ ( .D(busWin[9]), .CK(clk), .Q(busWout[9]) );
  DFF_X1 writereg_qbusW_reg_10_ ( .D(busWin[10]), .CK(clk), .Q(busWout[10]) );
  DFF_X1 writereg_qbusW_reg_11_ ( .D(busWin[11]), .CK(clk), .Q(busWout[11]) );
  DFF_X1 writereg_qbusW_reg_12_ ( .D(busWin[12]), .CK(clk), .Q(busWout[12]) );
  DFF_X1 writereg_qbusW_reg_13_ ( .D(busWin[13]), .CK(clk), .Q(busWout[13]) );
  DFF_X1 writereg_qbusW_reg_14_ ( .D(busWin[14]), .CK(clk), .Q(busWout[14]) );
  DFF_X1 writereg_qbusW_reg_15_ ( .D(busWin[15]), .CK(clk), .Q(busWout[15]) );
  DFF_X1 writereg_qbusW_reg_16_ ( .D(busWin[16]), .CK(clk), .Q(busWout[16]) );
  DFF_X1 writereg_qbusW_reg_17_ ( .D(busWin[17]), .CK(clk), .Q(busWout[17]) );
  DFF_X1 writereg_qbusW_reg_18_ ( .D(busWin[18]), .CK(clk), .Q(busWout[18]) );
  DFF_X1 writereg_qbusW_reg_19_ ( .D(busWin[19]), .CK(clk), .Q(busWout[19]) );
  DFF_X1 writereg_qbusW_reg_20_ ( .D(busWin[20]), .CK(clk), .Q(busWout[20]) );
  DFF_X1 writereg_qbusW_reg_21_ ( .D(busWin[21]), .CK(clk), .Q(busWout[21]) );
  DFF_X1 writereg_qbusW_reg_22_ ( .D(busWin[22]), .CK(clk), .Q(busWout[22]) );
  DFF_X1 writereg_qbusW_reg_23_ ( .D(busWin[23]), .CK(clk), .Q(busWout[23]) );
  DFF_X1 writereg_qbusW_reg_24_ ( .D(busWin[24]), .CK(clk), .Q(busWout[24]) );
  DFF_X1 writereg_qbusW_reg_25_ ( .D(busWin[25]), .CK(clk), .Q(busWout[25]) );
  DFF_X1 writereg_qbusW_reg_26_ ( .D(busWin[26]), .CK(clk), .Q(busWout[26]) );
  DFF_X1 writereg_qbusW_reg_27_ ( .D(busWin[27]), .CK(clk), .Q(busWout[27]) );
  DFF_X1 writereg_qbusW_reg_28_ ( .D(busWin[28]), .CK(clk), .Q(busWout[28]) );
  DFF_X1 writereg_qbusW_reg_29_ ( .D(busWin[29]), .CK(clk), .Q(busWout[29]) );
  DFF_X1 writereg_qbusW_reg_30_ ( .D(busWin[30]), .CK(clk), .Q(busWout[30]) );
  DFF_X1 writereg_qbusW_reg_31_ ( .D(busWin[31]), .CK(clk), .Q(busWout[31]) );
  DFF_X1 writereg_qrw_reg_0_ ( .D(rwin[0]), .CK(clk), .Q(rw[0]) );
  DFF_X1 writereg_qrw_reg_1_ ( .D(rwin[1]), .CK(clk), .Q(rw[1]) );
  DFF_X1 writereg_qrw_reg_2_ ( .D(rwin[2]), .CK(clk), .Q(rw[2]) );
  DFF_X1 writereg_qrw_reg_3_ ( .D(rwin[3]), .CK(clk), .Q(rw[3]) );
  DFF_X1 writereg_qrw_reg_4_ ( .D(rwin[4]), .CK(clk), .Q(rw[4]) );
  DFF_X1 writereg_qregwr_reg ( .D(regwritein), .CK(clk), .Q(regwr) );
endmodule

