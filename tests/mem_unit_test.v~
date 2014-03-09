module testbench;
        reg clock, dEXTOP, dALUSRC, dREGDST, dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dZERO;
        reg [1:0] dDSIZE;
	reg [31:0] dALUOUT;
        wire qEXTOP, qALUSRC, qREGDST, qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qZERO;
	wire [1:0] qDSIZE;
	wire [31:0] qALUOUT;

       MEMRegister REGISTER (clock, dEXTOP, dALUSRC, dREGDST,dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dDSIZE, dZERO, dALUOUT, qEXTOP, qALUSRC, qREGDST, qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qDSIZE, qZERO, qALUOUT);

	always #1 clock = ~clock;

	initial begin
		clock = 1;
		dEXTOP = 0;
		dALUSRC = 1;
		dREGDST = 1;
		dMEMWR = 0;
		dBRANCH = 0;
		dMEMTOREG = 1;
		dREGWR = 0;
		dZERO = 1;
		dDSIZE = 1; 
		dALUOUT = 8;
		
	end

        initial begin
	$monitor("clock = %b dEXTOP = %b dALUSRC = %b dREGDST = %b dMEMWR = %b dBRANCH = %b dMEMTOREG = %b dREGWR = %b dZERO = %b dDSIZE = %b dALUOUT = %d qEXTOP = %b qALUSRC = %b qREGDST = %b qMEMWR = %b qBRANCH = %b qMEMTOREG = %b qREGWR = %b qZERO = %b qDSIZE = %b qALUOUT = %d", clock, dEXTOP, dALUSRC, dREGDST, dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dZERO, dDSIZE, dALUOUT,qEXTOP, qALUSRC, qREGDST, qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qZERO, qDSIZE, qALUOUT);
	
	#1 dEXTOP = 1; dALUSRC = 0 ; dREGDST = 0 ; dMEMWR = 1 ; dBRANCH = 1 ; dMEMTOREG = 0 ; dREGWR = 1 ; dZERO = 0 ; dDSIZE = 0 ; dALUOUT = 9;
	#1 dEXTOP = 0; dALUSRC = 1 ; dREGDST = 1 ; dMEMWR = 0 ; dBRANCH = 0 ; dMEMTOREG = 1 ; dREGWR = 0 ; dZERO = 1 ; dDSIZE = 1 ; dALUOUT = 8;
	$finish;
	end
endmodule
