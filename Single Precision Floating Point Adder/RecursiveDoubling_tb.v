`include "RecursiveDoubling.v"

module top;

reg [31:0] a;
reg [31:0] b;
reg cin;

wire [31:0] sum;
wire cout;

RecursiveDoubling rd(a, b, sum, cout);

initial
begin
	a = 32'b11010101010101010100010101010100;
	b = 32'b10101010101010101010101010101010;
	
	#5;
	a = 32'b01010101010101010101010101010101;
	b = 32'b10101010101010101010101010101010;
end


initial
begin
	$monitor($time, "\t a = %b, b = %b, cout = %b, sum = %b",a,b,cout,sum);
end

endmodule
