module recommended(
	input a,
	input b,
	input reset,
	input clk,
	output reg s,
	output reg t,
	output reg u

);
	parameter S0 = 2'd0;
	parameter S1 = 2'd1;
	parameter S2 = 2'd2;
	reg [1:0] state, nextstate;
	initial state = S0;
	
	always @(posedge clk) begin
		if (reset)
			state <= S0;
		else
			state <= nextstate;
	end
	
	always @(*) begin
		s = 0;
		t = 0;
		u = 0;
		case (state)
			S0: begin
				s = 1;
				if (~a)
					nextstate = S0;
				else
					if (b)
						nextstate = S1;
					else
						nextstate = S2;
			end
			S1: begin
				t = 1;
				if (~b)
					nextstate = S2;
				else
					nextstate = S1;
			end
			S2: begin
				u = 1;
				nextstate = S0;
			end
		endcase
	end

endmodule