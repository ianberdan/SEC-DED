//File name: evenOddDec.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//seven segment display for even or odd parity specifically used for displaying either an E or an O

module evenOddDec(
	input logic in,
	output logic [6:0] HEX
);

always_comb
	case(in)
		0:	HEX=7'b000_0110;
		1:	HEX=7'b100_0000;
		default: HEX=7'b111_1111;
	endcase
	
endmodule
