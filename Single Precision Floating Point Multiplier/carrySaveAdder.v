`include "fullAdder.v"

module carrySaveAdder(X, Y, Z, S, C);
    
input [63:0]X; 
input [63:0]Y; 
input [63:0]Z;
    
output [63:0]S;
output [63:0]C;

    	assign C[0] = 1'b0;
    	fullAdder FA0(X[0], Y[0], Z[0], S[0], C[1]);
    	fullAdder FA1(X[1], Y[1], Z[1], S[1], C[2]);
    	fullAdder FA2(X[2], Y[2], Z[2], S[2], C[3]);
    	fullAdder FA3(X[3], Y[3], Z[3], S[3], C[4]);
    	fullAdder FA4(X[4], Y[4], Z[4], S[4], C[5]);
    	fullAdder FA5(X[5], Y[5], Z[5], S[5], C[6]);
    	fullAdder FA6(X[6], Y[6], Z[6], S[6], C[7]);
    	fullAdder FA7(X[7], Y[7], Z[7], S[7], C[8]);
    	fullAdder FA8(X[8], Y[8], Z[8], S[8], C[9]);
    	fullAdder FA9(X[9], Y[9], Z[9], S[9], C[10]);
    	fullAdder FA10(X[10], Y[10], Z[10], S[10], C[11]);
    	fullAdder FA11(X[11], Y[11], Z[11], S[11], C[12]);
    	fullAdder FA12(X[12], Y[12], Z[12], S[12], C[13]);
    	fullAdder FA13(X[13], Y[13], Z[13], S[13], C[14]);
    	fullAdder FA14(X[14], Y[14], Z[14], S[14], C[15]);
    	fullAdder FA15(X[15], Y[15], Z[15], S[15], C[16]);
    	fullAdder FA16(X[16], Y[16], Z[16], S[16], C[17]);
    	fullAdder FA17(X[17], Y[17], Z[17], S[17], C[18]);
    	fullAdder FA18(X[18], Y[18], Z[18], S[18], C[19]);
    	fullAdder FA19(X[19], Y[19], Z[19], S[19], C[20]);
    	fullAdder FA20(X[20], Y[20], Z[20], S[20], C[21]);
    	fullAdder FA21(X[21], Y[21], Z[21], S[21], C[22]);
    	fullAdder FA22(X[22], Y[22], Z[22], S[22], C[23]);
    	fullAdder FA23(X[23], Y[23], Z[23], S[23], C[24]);
    	fullAdder FA24(X[24], Y[24], Z[24], S[24], C[25]);
    	fullAdder FA25(X[25], Y[25], Z[25], S[25], C[26]);
    	fullAdder FA26(X[26], Y[26], Z[26], S[26], C[27]);
    	fullAdder FA27(X[27], Y[27], Z[27], S[27], C[28]);
    	fullAdder FA28(X[28], Y[28], Z[28], S[28], C[29]);
    	fullAdder FA29(X[29], Y[29], Z[29], S[29], C[30]);
    	fullAdder FA30(X[30], Y[30], Z[30], S[30], C[31]);
    	fullAdder FA31(X[31], Y[31], Z[31], S[31], C[32]);
    	fullAdder FA32(X[32], Y[32], Z[32], S[32], C[33]);
    	fullAdder FA33(X[33], Y[33], Z[33], S[33], C[34]);
    	fullAdder FA34(X[34], Y[34], Z[34], S[34], C[35]);
    	fullAdder FA35(X[35], Y[35], Z[35], S[35], C[36]);
    	fullAdder FA36(X[36], Y[36], Z[36], S[36], C[37]);
    	fullAdder FA37(X[37], Y[37], Z[37], S[37], C[38]);
    	fullAdder FA38(X[38], Y[38], Z[38], S[38], C[39]);
    	fullAdder FA39(X[39], Y[39], Z[39], S[39], C[40]);
    	fullAdder FA40(X[40], Y[40], Z[40], S[40], C[41]);
    	fullAdder FA41(X[41], Y[41], Z[41], S[41], C[42]);
    	fullAdder FA42(X[42], Y[42], Z[42], S[42], C[43]);
    	fullAdder FA43(X[43], Y[43], Z[43], S[43], C[44]);
    	fullAdder FA44(X[44], Y[44], Z[44], S[44], C[45]);
    	fullAdder FA45(X[45], Y[45], Z[45], S[45], C[46]);
    	fullAdder FA46(X[46], Y[46], Z[46], S[46], C[47]);
    	fullAdder FA47(X[47], Y[47], Z[47], S[47], C[48]);
    	fullAdder FA48(X[48], Y[48], Z[48], S[48], C[49]);
    	fullAdder FA49(X[49], Y[49], Z[49], S[49], C[50]);
    	fullAdder FA50(X[50], Y[50], Z[50], S[50], C[51]);
    	fullAdder FA51(X[51], Y[51], Z[51], S[51], C[52]);
    	fullAdder FA52(X[52], Y[52], Z[52], S[52], C[53]);
    	fullAdder FA53(X[53], Y[53], Z[53], S[53], C[54]);
    	fullAdder FA54(X[54], Y[54], Z[54], S[54], C[55]);
    	fullAdder FA55(X[55], Y[55], Z[55], S[55], C[56]);
    	fullAdder FA56(X[56], Y[56], Z[56], S[56], C[57]);
    	fullAdder FA57(X[57], Y[57], Z[57], S[57], C[58]);
    	fullAdder FA58(X[58], Y[58], Z[58], S[58], C[59]);
    	fullAdder FA59(X[59], Y[59], Z[59], S[59], C[60]);
    	fullAdder FA60(X[60], Y[60], Z[60], S[60], C[61]);
    	fullAdder FA61(X[61], Y[61], Z[61], S[61], C[62]);
    	fullAdder FA62(X[62], Y[62], Z[62], S[62], C[63]);
    	assign S[63] = 1'b0;

endmodule

module PGGen(p1, g1, a1, b1);

input a1;
input b1;
    
output p1;
output g1;

and GGen(g1, a1, b1);
xor PGen(p1, a1, b1);

endmodule

module nextcarry(cout, a2, b2, cin2);

input a2;
input b2;
input cin2;

wire p2;
wire g2;
wire w1;
    
output cout;
 
    	PGGen pg(p2, g2, a2, b2);

    	and and_1(w1, p2, cin2);
    	or or_1(cout, g2, w1);

endmodule

module sixtyFourBitAdder(a, b, cin, sum, carry);

input [63:0]a;
input [63:0]b;
input cin;

output [63:0]sum;
output [63:0] carry;

genvar i;

    	nextcarry c1(carry[0], a[0], a[0], cin);

    	generate
        	for(i=1; i<64; i = i + 1)
        	begin: carry_computation
        	    nextcarry nc(carry[i], a[i], b[i], carry[i-1]);
        	end
    	endgenerate

    	assign sum[0] = a[0] ^ b[0] ^ cin;

    	generate
        	for(i=1; i<64; i = i + 1)
        	begin: loop_1
        	    assign sum[i] = a[i] ^ b[i] ^ carry[i-1];
        end
    	endgenerate

endmodule
