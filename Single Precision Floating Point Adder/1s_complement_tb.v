`include "test.v"

module top;

reg [31:0] i;
wire [31:0] j;

ones_complement c_0(i, j);

initial
begin
	i = 32'b10100111010101011011110001101101;
end 

initial
begin
	$monitor("\t complement = %b", j); 
end

endmodule
