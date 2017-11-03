module minstate(
	input [1:0] nextstate,
	input reset,
	output reg [1:0] state,
	input clk
);
	initial begin
		state = 2'd0;
	end
	
	always @(posedge clk) begin
		if (reset)
			state <= 2'd0;
		else
			state <= nextstate;
	end

endmodule
