`include "RecursiveDoubling.v"
`include "1s_complement.v"
`include "EightBitAdder.v"

module checknswap(input [31:0]operand1, input [31:0]operand2, output reg [31:0]new_operand1, output reg [31:0]new_operand2); 
	always @(operand1 | operand2)
	begin
        	if(operand2[30:0] > operand1[30:0])
        begin
            	new_operand2 = operand1;
            	new_operand1 = operand2;
        end
        else
        begin
            	new_operand1 = operand1;
            	new_operand2 = operand1;
        end
    end
endmodule

module IEEE754(input [31:0]operand, output sign, output [7:0]exponent, output [22:0]mantissa); 
    assign sign = operand[31];
    assign exponent = operand[30:23];
    assign mantissa = operand[22:0];
endmodule

module twos_complement_exponent(input [7:0]exponent, output [7:0]twos_complemented_exponent);
	assign twos_complemented_exponent = ~exponent + 1'b1;
endmodule

module modified_mantissa(input [7:0]exponent, input [22:0]mantissa, output [23:0]modified_mantissa);
	assign modified_mantissa = {|exponent, mantissa};
endmodule

module right_shifter(input [23:0]mantissa, input [7:0]D, output [23:0]shifted_mantissa);
    assign shifted_mantissa = mantissa>>D;
endmodule

module sign(input sign1, input sign2, output sign);
	assign sign = sign1^sign2;
endmodule

module ones_complement_mantissa(input [23:0]mantissa, input sign, output [23:0]ones_complemented_mantissa);
	assign ones_complemented_mantissa = {32{sign}}^mantissa;
endmodule

module SPFP_adder;

reg [31:0] operand1;
reg [31:0] operand2;

wire [31:0] new_operand1;
wire [31:0] new_operand2;

	checknswap cs1(operand1, operand2, new_operand1, new_operand2);

wire [31:0] sum;

wire [0:0] sign1, sign2;
wire [7:0] exponent1, exponent2;
wire [22:0] mantissa1, mantissa2;

reg [0:0] final_sign;
reg [7:0] final_exponent;
reg [22:0] final_mantissa, temporary;

wire [7:0] D; 

	IEEE754 i1(new_operand1, sign1, exponent1, mantissa1);
	IEEE754 i2(new_operand2, sign2, exponent2, mantissa2);

wire [7:0] twos_complemented_exponent2;
wire cout;
wire [22:0] shifted_mantissa;

	twos_complement_exponent t1(exponent2, twos_complemented_exponent2);

	eight_bit_adder e1(exponent1, twos_complemented_exponent2, 1'b0, D, cout);

wire [23:0] modified_mantissa1, modified_mantissa2, shifted_mantissa2, ones_complemented_mantissa2, twos_complemented_mantissa2;
wire [31:0] finalmantissa2;
	
	modified_mantissa m1(exponent1, mantissa1, modified_mantissa1);
	modified_mantissa m2(exponent2, mantissa2, modified_mantissa2);

	right_shifter rs(modified_mantissa2, D, shifted_mantissa2);

wire sign; 
	sign s1(sign1, sign2, sign);

	ones_complement_mantissa oc1(shifted_mantissa2, sign, finalmantissa2);

	RecursiveDoubling r0(finalmantissa2, sign, twos_complemented_mantissa2, cout);
	RecursiveDoubling r1(modified_mantissa1, twos_complemented_mantissa2, sum, cout);

integer i =0;  

reg [31:0]out;

always @(sum) 
begin
	if(sum[24] == 1) 
        begin
            final_mantissa = sum[23:1];
            final_exponent = exponent1 + 1'b1;
        end
        else if(sum[23] == 0)
        begin
            i = 1;
            while(sum[23 - i] == 1'b0)
            begin
                i = i+1;
            end 
            final_exponent = final_exponent - i;
            temporary = sum[22:0];
            final_mantissa = temporary<<i;
        end
        else
        begin
            final_mantissa = sum[22:0];
            final_exponent = exponent1;
            final_sign = sign1;
        end
    end
    
always @ (final_exponent or final_mantissa)
begin
	if(&exponent1 == 1'b1 && |mantissa1 == 1'b0)
            out = {sign1,{8{1'b1}},23'b0};
        else
            out = {sign1,{8{|sum}} & final_exponent,final_mantissa};
end

initial
    begin
        #0 operand1={1'b0,{8{1'b1}},23'b0}; operand2={1'b0,{7{1'b1}},24'b111011}; 
        #10 operand1={31'b0,1'b1}; operand2=32'b00111111110010100011110101110001;  
        #20 operand1=32'b01000001101000000000000000000000;operand2=32'b11000001001000000000000000000000; 
    end
    initial
    begin
        $monitor($time," Operand1=%b Operand2=%b\tOUTPUT=%b\t\n",operand1,operand2,out);
end

endmodule


