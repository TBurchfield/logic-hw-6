module minimized(
	input a,
	input b,
	input clk,
	input reset,
	output s,
	output t,
	output u
);

wire [1:0] state;
wire [1:0] nextstate;

minlogic mlg(
	.state (state),
	.nextstate (nextstate),
	.a (a),
	.b (b),
	.s (s),
	.t (t),
	.u (u)
);

minstate ms(
	.reset(reset),
	.state(state),
	.nextstate(nextstate),
	.clk(clk)
);

endmodule