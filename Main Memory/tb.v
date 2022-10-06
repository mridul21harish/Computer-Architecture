`include "main.v"

module testbench;

reg [31:0] address;
reg [31:0] data;
wire [31:0] out;

main tb(
	.addr(address),
	.input_data(data),
	.mode(mode),
	.clk(clk),
	.output_data(out)
	.flag(flag)
);

initial
begin
	clk = 1'b1;
	
	address = 20'd100;			// 0
	//data =    32'd100;			// 14528
	mode = 1'b0;
	
	#200
	address = 20'd100;			// 2816867292 % size = 3036
	data =    32'd25;
	mode = 1'b1;

	#100
	address = 20'd100;			// 2816867292 % size = 3036
	data =    32'd25;
	mode = 1'b0;
	$finish;
end

initial
$monitor("address = %d data = %d mode = %d out = %d", address, data, mode, out);

always #25 clk = ~clk;

endmodule 
