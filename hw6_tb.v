`timescale 1ns/1ns
module hw6_tb(
);

	reg clk;
	reg a;
	reg b;
	wire s1;
	wire t1;
	wire u1;
	wire s2;
	wire t2;
	wire u2;
	reg reset;
	
	recommended uut1(
		.clk(clk),
		.a(a),
		.b(b),
		.reset(reset),
		.s(s2),
		.t(t2),
		.u(u2)
	);
	
	minimized uut2(
		.clk(clk),
		.a(a),
		.b(b),
		.reset(reset),
		.s(s1),
		.t(t1),
		.u(u1)
	);
	
	always #2 clk = ~clk;
	
	initial begin
		clk = 0;
		reset = 0;
		a = 0;
		b = 0;
		#20 a = 1; b = 1;
		#20 a = 0; b = 0;
		#20 a = 1; b = 0;
		#20 $stop;        //5 clock cycles, should flicker
	end

endmodule
