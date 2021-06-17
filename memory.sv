//File name: memory.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//creates the memory file for SEC-DED

module memory(
	input logic [7:0] dataIn, dataInToggle,
	input logic [4:0] checkIn, checkInToggle,
	input logic toggle, CLK,
	output logic [7:0] dataOut,
	output logic [4:0] checkOut
);
	
	logic [7:0] reg8;
	logic [4:0] reg5;
	
	// creates two registers, one 8-bits wide, and another 5-bits wide
	regN reg8Bits(.D(reg8), .CLKb(CLK), .E(1'b1), .Q(dataOut));
		defparam reg8Bits.N=8;
	
	regN reg5Bits(.D(reg5), .CLKb(CLK), .E(1'b1), .Q(checkOut));
		defparam reg5Bits.N=5;

	always_comb
		begin
			if(toggle == 1'b1)
			begin
				reg8 = dataIn;
				reg5 = checkIn;
			end
			else
			begin
				reg8 = dataInToggle;
				reg5 = checkInToggle;
			end
		end

endmodule 