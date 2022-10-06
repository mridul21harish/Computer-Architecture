`include "wallaceTreeMultiplier.v"
`include "RecursiveDoubling.v"

module IEEE754(input [31:0]operand, output sign, output [7:0]exponent, output [22:0]mantissa); //splits the 32 bit number into sign, exponent, mantissa following the IEEE 754 format
    assign sign = operand[31];
    assign exponent = operand[30:23];
    assign mantissa = operand[22:0];
endmodule

module sign(input sign1, input sign2, output sign); //calculates the final sign i.e. xor of sign1 and sign2
	assign sign = sign1^sign2;
endmodule

module modified_mantissa(input [7:0]exponent, input [22:0]mantissa, output [23:0]modified_mantissa); //calculates the modified mantissa with the hidden 1
	assign modified_mantissa = {|exponent, mantissa};
endmodule

module SPFP_multiplier; //does the multiplication

reg [31:0] operand1;
reg [31:0] operand2;

wire [0:0] sign1, sign2;
wire [7:0] exponent1, exponent2;
wire [22:0] mantissa1, mantissa2;

	IEEE754 i1(operand1, sign1, exponent1, mantissa1);
	IEEE754 i2(operand2, sign2, exponent2, mantissa2);
	
reg [0:0] final_sign;
reg [7:0] final_exponent;
reg [22:0] final_mantissa, temporary;

wire sign; 
	
	sign s1(sign1, sign2, sign);

reg [31:0] out;

wire [23:0] modified_mantissa1, modified_mantissa2;

	modified_mantissa m1(exponent1, mantissa1, modified_mantissa1);
	modified_mantissa m2(exponent2, mantissa2, modified_mantissa2);
	
wire [47:0] multiplied_mantissa;
	
	wallaceTreeMultiplier w0(modified_mantissa1, modified_mantissa2, multiplied_mantissa); //M = M1*M2

wire [7:0] added_exponent1, added_exponent2;
wire cout;

	RecursiveDoubling r0(exponent1, exponent2, added_exponent1, cout); //TE1 = E1+E2
	RecursiveDoubling r1(added_exponent1, 8'b10000011, added_exponent2, cout); //TE2 = TE1 - bias(127)

integer i = 0;

always @(multiplied_mantissa) 
begin
	if(multiplied_mantissa[47] == 1) 
        begin
            final_mantissa = multiplied_mantissa[46:24];
            final_exponent = added_exponent2 + 1'b1; //FE = TE2 + 1
            final_sign = sign;
        end
        /*else if(multiplied_mantissa[47] == 0)
        begin
            i = 1;
            while(multiplied_mantissa[47 - i] == 1'b0)
            begin
                i = i+1;
            end 
            final_exponent = final_exponent - i;
            temporary = multiplied_mantissa[46:24];
            final_mantissa = temporary<<i;
            final_exponent = added_exponent2;
            final_sign = sign;
        end*/
        else
        begin
            final_mantissa = multiplied_mantissa[45:23];
            final_exponent = added_exponent2;
            final_sign = sign;
        end
end

always @ (*)
begin
	if((&exponent1 == 1'b1 && |mantissa1 == 1'b0) || (&exponent2 == 1'b1 && |mantissa1 == 1'b0)) //infinity
            	out = {sign,{8{1'b1}},23'b0};
        else if(|exponent1 == 1'b0 || |exponent2 == 1'b0) //zero
        	out = {sign,{8{1'b0}},23'b0};
        else if(&exponent1 == 1'b1 && |mantissa1 != 1'b0) //first number is NaN
        	out = {sign, {8{1'b1}}, mantissa1};
        else if(&exponent2 == 1'b1 && |mantissa2 != 1'b0) //second number is NaN
        	out = {sign, {8{1'b1}}, mantissa2};
        else
        	out = {final_sign, final_exponent, final_mantissa}; //normal number
end

initial
    begin
        #0 operand1={1'b0,{8{1'b1}},23'b0}; operand2={1'b0,{6{1'b1}},25'b011011}; //infinity*number = infinity
        #10 operand1={1'b0,{8{1'b1}},23'b0}; operand2={1'b1,{8{1'b1}},23'b0}; //infinity*-infinity = -infinity
        #10 operand1={32'b0}; operand2=32'b00111111110010100011110101110001;  //zero*number = zero
        #10 operand1={1'b0,{8{1'b1}},23'b01000000000000000000000}; operand2=32'b00111111110010100011110101110001; //NaN*number = NaN
        #10 operand1=32'b01000010111110100100000000000000; operand2=32'b01000001010000010000000000000000; //number*number = number
    end
    initial
    begin
        $monitor($time," Operand1 = %b\n\t\tOperand2 = %b\n\t\tOUTPUT = %b\t\n", operand1, operand2, out);
end

endmodule


