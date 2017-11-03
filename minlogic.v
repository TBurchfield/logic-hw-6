module minlogic(
	input [1:0]state,
	input a,
	input b,
	output reg s,
	output reg t,
	output reg u,
	output reg [1:0]nextstate
);
	
	always @(*) begin
		s = ~state[1] && ~state[0];
		t = ~state[1] && state[0];
		u = state[1] && ~state[0];
		nextstate[1] = (~state[1] && a && ~b) || (~state[1] && state[0] && ~b);
		nextstate[0] = (~state[1] && a && b) || (~state[1] && state[0] && b);
	end

endmodule