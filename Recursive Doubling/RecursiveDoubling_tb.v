`include "RecursiveDoubling.v"

module top;

reg [31:0] a;
reg [31:0] b;
reg cin;
reg clk;

wire [31:0] sum;
wire cout;

RecursiveDoubling rd(a, b, clk, sum, cout);

always #5 clk = ~clk;

initial
begin
	clk = 1'b0;
	a = 32'b00100000010000110000000000000011;
	b = 32'b00001001000000011000000000001100;
	#10
	$finish;
end


initial
begin
	$monitor($time, "\t a = %b, b = %b, cout = %b, sum = %b",a,b,cout,sum);
end

endmodule
