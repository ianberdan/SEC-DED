/*******************************************
* Author: Dr. Hansen
* Date: Feb. 8, 2017
* 
* Description: creates an N-bit register file
* 
********************************************/

// Adapted by Ian Berdan and Eric Olson
// Date: 10/25/20
// creates a register file N-bits wide

module regN(
	input logic [N-1:0] D,
	input logic CLKb, E,
	output logic [N-1:0] Q
);

	//variable width register
	parameter N = 8;
	
	//negedge register with synchronous active-high enable
	always_ff@(negedge CLKb)
	begin
		if(E)
			Q <= D;
		else
			Q <= Q;
	end

endmodule 
