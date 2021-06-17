//File name: compare.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//compare the current current check bits with the stored check bits

module compare(
	input logic [4:0] current, stored,
	output logic [3:0] addressFlip,
	output logic dosErrors
);
	
	logic parity;
	logic [3:0] synd;
	
	// test for syndrome
	assign synd = {current[4] ^ stored[4], current[3] ^ stored[3], current[2] ^ stored[2], current[1] ^ stored[1]};
	
	assign parity = current[0] ^ stored[0];
	
	always_comb
	begin
		case(parity)
			0: begin
				if(synd != 4'b0000)
				begin
					dosErrors = 1'b1;
					addressFlip = 4'b1111;
				end
				else
				begin
					dosErrors = 1'b0;
					addressFlip = 4'b1111;
					end
			end
			1: begin
				dosErrors = 1'b0;
				addressFlip = synd;
			end
			default:
			begin
				dosErrors = 1'b0;
				addressFlip = 4'b1111;
			end
		endcase
	end
	
endmodule
