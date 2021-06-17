//File name: corrector.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//corrects the error bit based on syndrome

module corrector(
	input logic [3:0] synd,
	input logic [7:0] dataIn,
	output logic [7:0] dataOut
);
	
	//the syndrome points to which bit is incorrect and then flips it
	always_comb
	begin
		case(synd)
		default:	begin
			dataOut = dataIn;
		end
		3: begin
			dataOut = {dataIn[7:1], ~dataIn[0]};
		end
		5: begin
			dataOut = {dataIn[7:2], ~dataIn[1], dataIn[0]};
		end
		6: begin
			dataOut = {dataIn[7:3], ~dataIn[2], dataIn[1:0]};
		end
		7: begin
			dataOut = {dataIn[7:4], ~dataIn[3], dataIn[2:0]};
		end
		9: begin
			dataOut = {dataIn[7:5], ~dataIn[4], dataIn[3:0]};
		end
		10: begin
			dataOut = {dataIn[7:6], ~dataIn[5], dataIn[4:0]};
		end
		11: begin
			dataOut = {dataIn[7], ~dataIn[6], dataIn[5:0]};
		end
		12: begin
			dataOut = {~dataIn[7], dataIn[6:0]};
		end
		endcase
	end
	
endmodule 