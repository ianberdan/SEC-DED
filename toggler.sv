//File name: toggler.sv
//Aurthors: Ian Berdan, Eric Olson
//Date: 10/25/2020
//Description:
		//creates error within given data

module toggler(
	input logic [3:0] error, 
	input logic [4:0] checkIn,
	input logic [7:0] dataIn,
	output logic [7:0] dataOut,
	output logic [4:0] checkOut
);

	// creates a decoder to change each bit with the given input
	always_comb
	begin
		case(error)
		default: begin
			dataOut = dataIn;
			checkOut = checkIn;
		end
		0: begin
			dataOut = dataIn;
			checkOut = {checkIn[4:1],~checkIn[0]};
		end
		1: begin
			dataOut = dataIn;
			checkOut = {checkIn[4:2], ~checkIn[1], checkIn[0]};
		end
		2: begin
			dataOut = dataIn;
			checkOut = {checkIn[4:3], ~checkIn[2], checkIn[1:0]};
		end
		3: begin
			dataOut = {dataIn[7:1], ~dataIn[0]};
			checkOut = checkIn;
		end
		4: begin
			dataOut = dataIn;
			checkOut = {checkIn[4], ~checkIn[3], checkIn[2:0]};
		end
		5: begin
			dataOut = {dataIn[7:2], ~dataIn[1], dataIn[0]};
			checkOut = checkIn;
		end
		6: begin
			dataOut = {dataIn[7:3], ~dataIn[2], dataIn[1:0]};
			checkOut = checkIn;
		end
		7: begin
			dataOut = {dataIn[7:4], ~dataIn[3], dataIn[2:0]};
			checkOut = checkIn;
		end
		8: begin
			dataOut = dataIn;
			checkOut = {~checkIn[4], checkIn[3:0]};
		end
		9: begin
			dataOut = {dataIn[7:5], ~dataIn[4], dataIn[3:0]};
			checkOut = checkIn;
		end
		10: begin
			dataOut = {dataIn[7:6], ~dataIn[5], dataIn[4:0]};
			checkOut = checkIn;
		end
		11: begin
			dataOut = {dataIn[7], ~dataIn[6], dataIn[5:0]};
			checkOut = checkIn;
		end
		12: begin
			dataOut = {~dataIn[7], dataIn[6:0]};
			checkOut = checkIn;
		end
		endcase
	end

endmodule 