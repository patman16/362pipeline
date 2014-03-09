module testbench;
        reg clock, dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dZERO, dLOADEXT, dJUMP, dJAL, dJAR;
        reg [1:0] dDSIZE, dFPOINT;
	reg [4:0] dRW
	reg [31:0] dEXECRESULT, dBRANCHTARGET, dBUSB;
        wire qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qZERO, qLOADEXT, qJUMP, qJAL, qJAR;
	wire [1:0] qDSIZE, qFPOINT;
	wire [31:0] qEXECRESULT, qBUSB, qBRANCHTARGET;

       MEMRegister REGISTER (clock, dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dDSIZE, dFPOINT, dZERO, dEXECRESULT,dLOADEXT, dJUMP, dJAL, dJAR, dBRANCHTARGET, dBUSB, qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qDSIZE, qZERO, qFPOINT, qEXECRESULT, qBRANCHTARGET, qBUSB);

	always #1 clock = ~clock;

	initial begin
		clock = 1;
		dMEMWR = 0;
		dBRANCH = 0;
		dMEMTOREG = 1;
		dREGWR = 0;
		dZERO = 1;
		dDSIZE = 1; 
		dEXECRESULT = 8;
		
	end

        initial begin
	$monitor("clock = %b dMEMWR = %b dBRANCH = %b dMEMTOREG = %b dREGWR = %b dZERO = %b dDSIZE = %b ddEXECRESULT = %d qMEMWR = %b qBRANCH = %b qMEMTOREG = %b qREGWR = %b qZERO = %b qDSIZE = %b qALUOUT = %d", clock, dEXTOP, dALUSRC, dREGDST, dMEMWR, dBRANCH, dMEMTOREG, dREGWR, dZERO, dDSIZE, dALUOUT,qEXTOP, qALUSRC, qREGDST, qMEMWR, qBRANCH, qMEMTOREG, qREGWR, qZERO, qDSIZE, qALUOUT);
	
	#1 dEXTOP = 1; dALUSRC = 0 ; dREGDST = 0 ; dMEMWR = 1 ; dBRANCH = 1 ; dMEMTOREG = 0 ; dREGWR = 1 ; dZERO = 0 ; dDSIZE = 0 ; dALUOUT = 9;
	#1 dEXTOP = 0; dALUSRC = 1 ; dREGDST = 1 ; dMEMWR = 0 ; dBRANCH = 0 ; dMEMTOREG = 1 ; dREGWR = 0 ; dZERO = 1 ; dDSIZE = 1 ; dALUOUT = 8;
	$finish;
	end
endmodule