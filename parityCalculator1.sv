//File name: parityCalculator1.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//checks the parity for given input
		
module parityCalculator1(
	input logic [7:0] in,
	output logic [4:0] out
);

	//Check bits. This XOR's each data bit that is significnant to the corresponding check bit
	assign out[1] = (in[6] ^ in[4] ^ in[3] ^ in[1] ^ in[0]); //check bit 1 (xxx1)
	assign out[2] = (in[6] ^ in[5] ^ in[3] ^ in[2] ^ in[0]); //check bit 2 (xx1x)
	assign out[3] = (in[7] ^ in[3] ^ in[2] ^ in[1]); //check bit 3 (x1xx)
	assign out[4] = (in[7] ^ in[6] ^ in[5] ^ in[4]); //check bit 4 (1xxx)
	
	//checks for overall parity bit	
	assign out[0] = (in[7] ^ in[6] ^ in[5] ^ in[4] ^ out[4] ^ in[3] ^ in[2] ^ in[1] ^ out[3] ^ in[0] ^ out[2] ^ out[1]);

endmodule 