module minlogic(
	input [1:0]state,
	input a,
	input b,
	output reg s,
	output reg t,
	output reg u,
	output reg [1:0]nextstate
);
	parameter S0 = 2'd0;
	parameter S1 = 2'd1;
	parameter S2 = 2'd2;
	
	always @(*) begin
		s = ~state[1] && ~state[0];
		t = ~state[1] && state[0];
		u = state[1] && ~state[0];
		nextstate[1] = (~state[1] && a && ~b) || (~state[1] && state[0] && ~b);
		nextstate[0] = (~state[1] && ~state[0] && a && ~b) || (~state[1] && state[0] && b);
//		case (state)
//			S0: begin
//				
//			end
//			S1: begin
//			end
//			S2: begin
//			end
//		endcase
	end

endmodule