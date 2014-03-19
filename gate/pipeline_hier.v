
module WrRegister ( clk, dregwr, drw, dbusW, dfpoint, ddelayslot2, djal, 
        qregwr, qrw, qbusW, qfpoint, qdelayslot2, qjal );
  input [4:0] drw;
  input [31:0] dbusW;
  input [1:0] dfpoint;
  input [31:0] ddelayslot2;
  output [4:0] qrw;
  output [31:0] qbusW;
  output [1:0] qfpoint;
  output [31:0] qdelayslot2;
  input clk, dregwr, djal;
  output qregwr, qjal;

  tri   [31:0] qbusW;
  tri   [31:0] qdelayslot2;
  tri   qjal;

  DFF_X1 qregwr_reg ( .D(dregwr), .CK(clk), .Q(qregwr) );
  DFF_X1 \qrw_reg[4]  ( .D(drw[4]), .CK(clk), .Q(qrw[4]) );
  DFF_X1 \qrw_reg[3]  ( .D(drw[3]), .CK(clk), .Q(qrw[3]) );
  DFF_X1 \qrw_reg[2]  ( .D(drw[2]), .CK(clk), .Q(qrw[2]) );
  DFF_X1 \qrw_reg[1]  ( .D(drw[1]), .CK(clk), .Q(qrw[1]) );
  DFF_X1 \qrw_reg[0]  ( .D(drw[0]), .CK(clk), .Q(qrw[0]) );
  DFF_X1 \qbusW_reg[31]  ( .D(dbusW[31]), .CK(clk), .Q(qbusW[31]) );
  DFF_X1 \qbusW_reg[30]  ( .D(dbusW[30]), .CK(clk), .Q(qbusW[30]) );
  DFF_X1 \qbusW_reg[29]  ( .D(dbusW[29]), .CK(clk), .Q(qbusW[29]) );
  DFF_X1 \qbusW_reg[28]  ( .D(dbusW[28]), .CK(clk), .Q(qbusW[28]) );
  DFF_X1 \qbusW_reg[27]  ( .D(dbusW[27]), .CK(clk), .Q(qbusW[27]) );
  DFF_X1 \qbusW_reg[26]  ( .D(dbusW[26]), .CK(clk), .Q(qbusW[26]) );
  DFF_X1 \qbusW_reg[25]  ( .D(dbusW[25]), .CK(clk), .Q(qbusW[25]) );
  DFF_X1 \qbusW_reg[24]  ( .D(dbusW[24]), .CK(clk), .Q(qbusW[24]) );
  DFF_X1 \qbusW_reg[23]  ( .D(dbusW[23]), .CK(clk), .Q(qbusW[23]) );
  DFF_X1 \qbusW_reg[22]  ( .D(dbusW[22]), .CK(clk), .Q(qbusW[22]) );
  DFF_X1 \qbusW_reg[21]  ( .D(dbusW[21]), .CK(clk), .Q(qbusW[21]) );
  DFF_X1 \qbusW_reg[20]  ( .D(dbusW[20]), .CK(clk), .Q(qbusW[20]) );
  DFF_X1 \qbusW_reg[19]  ( .D(dbusW[19]), .CK(clk), .Q(qbusW[19]) );
  DFF_X1 \qbusW_reg[18]  ( .D(dbusW[18]), .CK(clk), .Q(qbusW[18]) );
  DFF_X1 \qbusW_reg[17]  ( .D(dbusW[17]), .CK(clk), .Q(qbusW[17]) );
  DFF_X1 \qbusW_reg[16]  ( .D(dbusW[16]), .CK(clk), .Q(qbusW[16]) );
  DFF_X1 \qbusW_reg[15]  ( .D(dbusW[15]), .CK(clk), .Q(qbusW[15]) );
  DFF_X1 \qbusW_reg[14]  ( .D(dbusW[14]), .CK(clk), .Q(qbusW[14]) );
  DFF_X1 \qbusW_reg[13]  ( .D(dbusW[13]), .CK(clk), .Q(qbusW[13]) );
  DFF_X1 \qbusW_reg[12]  ( .D(dbusW[12]), .CK(clk), .Q(qbusW[12]) );
  DFF_X1 \qbusW_reg[11]  ( .D(dbusW[11]), .CK(clk), .Q(qbusW[11]) );
  DFF_X1 \qbusW_reg[10]  ( .D(dbusW[10]), .CK(clk), .Q(qbusW[10]) );
  DFF_X1 \qbusW_reg[9]  ( .D(dbusW[9]), .CK(clk), .Q(qbusW[9]) );
  DFF_X1 \qbusW_reg[8]  ( .D(dbusW[8]), .CK(clk), .Q(qbusW[8]) );
  DFF_X1 \qbusW_reg[7]  ( .D(dbusW[7]), .CK(clk), .Q(qbusW[7]) );
  DFF_X1 \qbusW_reg[6]  ( .D(dbusW[6]), .CK(clk), .Q(qbusW[6]) );
  DFF_X1 \qbusW_reg[5]  ( .D(dbusW[5]), .CK(clk), .Q(qbusW[5]) );
  DFF_X1 \qbusW_reg[4]  ( .D(dbusW[4]), .CK(clk), .Q(qbusW[4]) );
  DFF_X1 \qbusW_reg[3]  ( .D(dbusW[3]), .CK(clk), .Q(qbusW[3]) );
  DFF_X1 \qbusW_reg[2]  ( .D(dbusW[2]), .CK(clk), .Q(qbusW[2]) );
  DFF_X1 \qbusW_reg[1]  ( .D(dbusW[1]), .CK(clk), .Q(qbusW[1]) );
  DFF_X1 \qbusW_reg[0]  ( .D(dbusW[0]), .CK(clk), .Q(qbusW[0]) );
  DFF_X1 \qfpoint_reg[1]  ( .D(dfpoint[1]), .CK(clk), .Q(qfpoint[1]) );
  DFF_X1 \qfpoint_reg[0]  ( .D(dfpoint[0]), .CK(clk), .Q(qfpoint[0]) );
  DFF_X1 \qdelayslot2_reg[31]  ( .D(ddelayslot2[31]), .CK(clk), .Q(
        qdelayslot2[31]) );
  DFF_X1 \qdelayslot2_reg[30]  ( .D(ddelayslot2[30]), .CK(clk), .Q(
        qdelayslot2[30]) );
  DFF_X1 \qdelayslot2_reg[29]  ( .D(ddelayslot2[29]), .CK(clk), .Q(
        qdelayslot2[29]) );
  DFF_X1 \qdelayslot2_reg[28]  ( .D(ddelayslot2[28]), .CK(clk), .Q(
        qdelayslot2[28]) );
  DFF_X1 \qdelayslot2_reg[27]  ( .D(ddelayslot2[27]), .CK(clk), .Q(
        qdelayslot2[27]) );
  DFF_X1 \qdelayslot2_reg[26]  ( .D(ddelayslot2[26]), .CK(clk), .Q(
        qdelayslot2[26]) );
  DFF_X1 \qdelayslot2_reg[25]  ( .D(ddelayslot2[25]), .CK(clk), .Q(
        qdelayslot2[25]) );
  DFF_X1 \qdelayslot2_reg[24]  ( .D(ddelayslot2[24]), .CK(clk), .Q(
        qdelayslot2[24]) );
  DFF_X1 \qdelayslot2_reg[23]  ( .D(ddelayslot2[23]), .CK(clk), .Q(
        qdelayslot2[23]) );
  DFF_X1 \qdelayslot2_reg[22]  ( .D(ddelayslot2[22]), .CK(clk), .Q(
        qdelayslot2[22]) );
  DFF_X1 \qdelayslot2_reg[21]  ( .D(ddelayslot2[21]), .CK(clk), .Q(
        qdelayslot2[21]) );
  DFF_X1 \qdelayslot2_reg[20]  ( .D(ddelayslot2[20]), .CK(clk), .Q(
        qdelayslot2[20]) );
  DFF_X1 \qdelayslot2_reg[19]  ( .D(ddelayslot2[19]), .CK(clk), .Q(
        qdelayslot2[19]) );
  DFF_X1 \qdelayslot2_reg[18]  ( .D(ddelayslot2[18]), .CK(clk), .Q(
        qdelayslot2[18]) );
  DFF_X1 \qdelayslot2_reg[17]  ( .D(ddelayslot2[17]), .CK(clk), .Q(
        qdelayslot2[17]) );
  DFF_X1 \qdelayslot2_reg[16]  ( .D(ddelayslot2[16]), .CK(clk), .Q(
        qdelayslot2[16]) );
  DFF_X1 \qdelayslot2_reg[15]  ( .D(ddelayslot2[15]), .CK(clk), .Q(
        qdelayslot2[15]) );
  DFF_X1 \qdelayslot2_reg[14]  ( .D(ddelayslot2[14]), .CK(clk), .Q(
        qdelayslot2[14]) );
  DFF_X1 \qdelayslot2_reg[13]  ( .D(ddelayslot2[13]), .CK(clk), .Q(
        qdelayslot2[13]) );
  DFF_X1 \qdelayslot2_reg[12]  ( .D(ddelayslot2[12]), .CK(clk), .Q(
        qdelayslot2[12]) );
  DFF_X1 \qdelayslot2_reg[11]  ( .D(ddelayslot2[11]), .CK(clk), .Q(
        qdelayslot2[11]) );
  DFF_X1 \qdelayslot2_reg[10]  ( .D(ddelayslot2[10]), .CK(clk), .Q(
        qdelayslot2[10]) );
  DFF_X1 \qdelayslot2_reg[9]  ( .D(ddelayslot2[9]), .CK(clk), .Q(
        qdelayslot2[9]) );
  DFF_X1 \qdelayslot2_reg[8]  ( .D(ddelayslot2[8]), .CK(clk), .Q(
        qdelayslot2[8]) );
  DFF_X1 \qdelayslot2_reg[7]  ( .D(ddelayslot2[7]), .CK(clk), .Q(
        qdelayslot2[7]) );
  DFF_X1 \qdelayslot2_reg[6]  ( .D(ddelayslot2[6]), .CK(clk), .Q(
        qdelayslot2[6]) );
  DFF_X1 \qdelayslot2_reg[5]  ( .D(ddelayslot2[5]), .CK(clk), .Q(
        qdelayslot2[5]) );
  DFF_X1 \qdelayslot2_reg[4]  ( .D(ddelayslot2[4]), .CK(clk), .Q(
        qdelayslot2[4]) );
  DFF_X1 \qdelayslot2_reg[3]  ( .D(ddelayslot2[3]), .CK(clk), .Q(
        qdelayslot2[3]) );
  DFF_X1 \qdelayslot2_reg[2]  ( .D(ddelayslot2[2]), .CK(clk), .Q(
        qdelayslot2[2]) );
  DFF_X1 \qdelayslot2_reg[1]  ( .D(ddelayslot2[1]), .CK(clk), .Q(
        qdelayslot2[1]) );
  DFF_X1 \qdelayslot2_reg[0]  ( .D(ddelayslot2[0]), .CK(clk), .Q(
        qdelayslot2[0]) );
  DFF_X1 qjal_reg ( .D(djal), .CK(clk), .Q(qjal) );
endmodule


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

  WrRegister writereg ( .clk(clk), .dregwr(regwritein), .drw(rwin), .dbusW(
        busWin), .dfpoint(fpointin), .ddelayslot2(delayslot2in), .djal(jalin), 
        .qregwr(regwr), .qrw(rw), .qbusW(busWout), .qfpoint(fpoint), 
        .qdelayslot2(delayslot2out), .qjal(jalout) );
  mux_2to1_n jalmux ( .p1(busWout), .p2(delayslot2out), .p3(jalout), .p4(busW)
         );
endmodule

