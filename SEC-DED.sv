//File name: SEC-DED.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//creates the top level file for SEC-DED

module Project2(
	input logic [9:0] SW,
	input logic KEY0, CLK50, //KEY0 = clock cycle, CLK50 = 50MHz on-board clock
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic LED9, radix
);
	
	//creates all wires
	logic CLK;
	logic [3:0] synd;
	logic [4:0] parity1, parity2, savedCheck, toggleCheck;
	logic [7:0] savedWord, toggleData, corrected;
	logic [3:0] test0, test1, test2;
	
	//values for displays
	assign test0 = {savedCheck[3], savedWord[0], savedCheck[2:1]};
	assign test1 = {savedCheck[4], savedWord[3:1]};
	assign test2 = {savedWord[7:4]};
	
	//debounced clock signal
	debouncer debbie(.D(KEY0), .clk_50M(CLK50), .D_deb(CLK));
	
	//memory file
	memory daMem(.dataIn(SW[7:0]), .dataInToggle(toggleData), .checkIn(parity1), .checkInToggle(toggleCheck), .toggle(SW[9]), .CLK(CLK), .dataOut(savedWord), .checkOut(savedCheck));
	
	//parity calculators (f-blocks)
	parityCalculator1 parityDasUno(.in(SW[7:0]), .out(parity1));
	parityCalculator2 parityDasDos(.in(savedWord), .out(parity2), .checkBitIn(savedCheck[4:1]));
	
	toggler toggleMonster(.error(SW[3:0]), .checkIn(savedCheck), .dataIn(savedWord), .dataOut(toggleData), .checkOut(toggleCheck));
	
	compare daComp(.current(parity2), .stored(savedCheck), .addressFlip(synd), .dosErrors(LED9));
	
	corrector iBarelyKnowHer(.dataIn(savedWord), .synd(synd), .dataOut(corrected));
	
	//logic for HEX3
	assign evenOddBit = savedWord[7] ^ savedWord[6] ^ savedWord[5] ^ savedWord[4] ^ savedWord[3] ^ savedWord[2] ^ savedWord[1] ^ savedWord[0] ^ savedCheck[4] ^ savedCheck[3] ^ savedCheck[2] ^ savedCheck[1] ^ savedCheck[0];
	
	// all hex displays
	sevSegDec hex0(.in(test0), .HEX(HEX0));
	sevSegDec hex1(.in(test1), .HEX(HEX1));
	sevSegDec hex2(.in(test2), .HEX(HEX2));
	evenOddDec hex3(.in(evenOddBit), .HEX(HEX3));
	sevSegDec hex4(.in(corrected[3:0]), .HEX(HEX4));
	sevSegDec hex5(.in(corrected[7:4]), .HEX(HEX5));
	
	assign radix = ~savedCheck[0];
	
endmodule
