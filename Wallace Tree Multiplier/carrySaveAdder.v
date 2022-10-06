`include "fullAdder.v"

module carrySaveAdder(X, Y, Z, clk, S, C);
    
input [63:0]X; 
input [63:0]Y; 
input [63:0]Z;
input clk;
    
output [63:0]S;
output [63:0]C;

wire [63:0]s;
wire [63:0]c;

    	assign C[0] = 1'b0;
    	genvar i;
    generate
        for(i = 0; i < 63; i = i + 1) begin: full_adder
      		fullAdder fa(X[i], Y[i], Z[i], S[i], C[i + 1]);
        end
    endgenerate
    	/*fullAdder FA0(X[0], Y[0], Z[0], s[0], c[1]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r0(s[0], clk, 1'b0, S[0]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r1(c[1], clk, 1'b0, C[1]);
    	fullAdder FA1(X[1], Y[1], Z[1], s[1], c[2]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r2(s[1], clk, 1'b0, S[1]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r3(c[2], clk, 1'b0, C[2]);
    	fullAdder FA2(X[2], Y[2], Z[2], s[2], c[3]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r4(s[2], clk, 1'b0, S[2]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r5(c[3], clk, 1'b0, C[3]);
    	fullAdder FA3(X[3], Y[3], Z[3], s[3], c[4]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r6(s[3], clk, 1'b0, S[3]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r7(c[4], clk, 1'b0, C[4]);
    	fullAdder FA4(X[4], Y[4], Z[4], s[4], c[5]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r8(s[4], clk, 1'b0, S[4]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r9(c[5], clk, 1'b0, C[5]);
    	fullAdder FA5(X[5], Y[5], Z[5], s[5], c[6]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r10(s[5], clk, 1'b0, S[5]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r11(c[6], clk, 1'b0, C[6]);
    	fullAdder FA6(X[6], Y[6], Z[6], s[6], c[7]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r12(s[6], clk, 1'b0, S[6]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r13(c[7], clk, 1'b0, C[7]);
    	fullAdder FA7(X[7], Y[7], Z[7], s[7], c[8]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r14(s[7], clk, 1'b0, S[7]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r15(c[8], clk, 1'b0, C[8]);
    	fullAdder FA8(X[8], Y[8], Z[8], s[8], c[9]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r16(s[8], clk, 1'b0, S[8]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r17(c[9], clk, 1'b0, C[9]);
    	fullAdder FA9(X[9], Y[9], Z[9], s[9], c[10]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r18(s[9], clk, 1'b0, S[9]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r19(c[10], clk, 1'b0, C[10]);
    	fullAdder FA10(X[10], Y[10], Z[10], s[10], c[11]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r20(s[10], clk, 1'b0, S[10]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r21(c[11], clk, 1'b0, C[11]);
    	fullAdder FA11(X[11], Y[11], Z[11], s[11], c[12]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r22(s[11], clk, 1'b0, S[11]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r23(c[12], clk, 1'b0, C[12]);
    	fullAdder FA12(X[12], Y[12], Z[12], s[12], c[13]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r24(s[12], clk, 1'b0, S[12]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r25(c[13], clk, 1'b0, C[13]);
    	fullAdder FA13(X[13], Y[13], Z[13], s[13], c[14]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r26(s[13], clk, 1'b0, S[13]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r27(c[14], clk, 1'b0, C[14]);
    	fullAdder FA14(X[14], Y[14], Z[14], s[14], c[15]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r28(s[14], clk, 1'b0, S[14]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r29(c[15], clk, 1'b0, C[15]);
    	fullAdder FA15(X[15], Y[15], Z[15], s[15], c[16]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r30(s[15], clk, 1'b0, S[15]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r31(c[16], clk, 1'b0, C[16]);
    	fullAdder FA16(X[16], Y[16], Z[16], s[16], c[17]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r32(s[16], clk, 1'b0, S[16]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r33(c[17], clk, 1'b0, C[17]);
    	fullAdder FA17(X[17], Y[17], Z[17], s[17], c[18]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r3a(s[17], clk, 1'b0, S[17]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r34(c[18], clk, 1'b0, C[18]);
    	fullAdder FA18(X[18], Y[18], Z[18], s[18], c[19]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r35(s[18], clk, 1'b0, S[18]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r36(c[19], clk, 1'b0, C[19]);
    	fullAdder FA19(X[19], Y[19], Z[19], s[19], c[20]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r37(s[19], clk, 1'b0, S[19]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r38(c[20], clk, 1'b0, C[20]);
    	fullAdder FA20(X[20], Y[20], Z[20], s[20], c[21]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r39(s[20], clk, 1'b0, S[20]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r40(c[21], clk, 1'b0, C[21]);
    	fullAdder FA21(X[21], Y[21], Z[21], s[21], c[22]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r41(s[21], clk, 1'b0, S[21]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r42(c[22], clk, 1'b0, C[22]);
    	fullAdder FA22(X[22], Y[22], Z[22], s[22], c[23]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r43(s[22], clk, 1'b0, S[22]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r44(c[23], clk, 1'b0, C[23]);
    	fullAdder FA23(X[23], Y[23], Z[23], s[23], c[24]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r45(s[23], clk, 1'b0, S[23]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r46(c[24], clk, 1'b0, C[24]);
    	fullAdder FA24(X[24], Y[24], Z[24], s[24], c[25]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r47(s[24], clk, 1'b0, S[24]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r48(c[25], clk, 1'b0, C[25]);
    	fullAdder FA25(X[25], Y[25], Z[25], s[25], c[26]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r49(s[25], clk, 1'b0, S[25]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r50(c[26], clk, 1'b0, C[26]);
    	fullAdder FA26(X[26], Y[26], Z[26], s[26], c[27]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r51(s[26], clk, 1'b0, S[26]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r52(c[27], clk, 1'b0, C[27]);
    	fullAdder FA27(X[27], Y[27], Z[27], s[27], c[28]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r53(s[27], clk, 1'b0, S[27]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r54(c[28], clk, 1'b0, C[28]);
    	fullAdder FA28(X[28], Y[28], Z[28], s[28], c[29]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r55(s[28], clk, 1'b0, S[28]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r56(c[29], clk, 1'b0, C[29]);
    	fullAdder FA29(X[29], Y[29], Z[29], s[29], c[30]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r57(s[29], clk, 1'b0, S[29]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r58(c[30], clk, 1'b0, C[30]);
    	fullAdder FA30(X[30], Y[30], Z[30], s[30], c[31]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r59(s[30], clk, 1'b0, S[30]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r60(c[31], clk, 1'b0, C[31]);
    	fullAdder FA31(X[31], Y[31], Z[31], s[31], c[32]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r61(s[31], clk, 1'b0, S[31]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r62(c[32], clk, 1'b0, C[32]);
    	fullAdder FA32(X[32], Y[32], Z[32], s[32], c[33]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r63(s[32], clk, 1'b0, S[32]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r64(c[33], clk, 1'b0, C[33]);
    	fullAdder FA33(X[33], Y[33], Z[33], s[33], c[34]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r65(s[33], clk, 1'b0, S[33]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r66(c[34], clk, 1'b0, C[34]);
    	fullAdder FA34(X[34], Y[34], Z[34], s[34], c[35]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r67(s[34], clk, 1'b0, S[34]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r68(c[35], clk, 1'b0, C[35]);
    	fullAdder FA35(X[35], Y[35], Z[35], s[35], c[36]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r69(s[35], clk, 1'b0, S[35]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r70(c[36], clk, 1'b0, C[36]);
    	fullAdder FA36(X[36], Y[36], Z[36], s[36], c[37]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r71(s[36], clk, 1'b0, S[36]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r72(c[37], clk, 1'b0, C[37]);
    	fullAdder FA37(X[37], Y[37], Z[37], s[37], c[38]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r73(s[37], clk, 1'b0, S[37]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r74(c[38], clk, 1'b0, C[38]);
    	fullAdder FA38(X[38], Y[38], Z[38], s[38], c[39]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r75(s[38], clk, 1'b0, S[38]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r76(c[39], clk, 1'b0, C[39]);
    	fullAdder FA39(X[39], Y[39], Z[39], s[39], s[40]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r77(s[39], clk, 1'b0, S[39]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r78(c[40], clk, 1'b0, C[40]);
    	fullAdder FA40(X[40], Y[40], Z[40], s[40], c[41]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r79(s[40], clk, 1'b0, S[40]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r80(c[41], clk, 1'b0, C[41]);
    	fullAdder FA41(X[41], Y[41], Z[41], s[41], c[42]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r81(s[41], clk, 1'b0, S[41]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r82(c[42], clk, 1'b0, C[42]);
    	fullAdder FA42(X[42], Y[42], Z[42], s[42], c[43]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r83(s[42], clk, 1'b0, S[42]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r84(c[43], clk, 1'b0, C[43]);
    	fullAdder FA43(X[43], Y[43], Z[43], s[43], c[44]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r85(s[43], clk, 1'b0, S[43]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r86(c[44], clk, 1'b0, C[44]);
    	fullAdder FA44(X[44], Y[44], Z[44], s[44], c[45]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r87(s[44], clk, 1'b0, S[44]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r88(c[45], clk, 1'b0, C[45]);
    	fullAdder FA45(X[45], Y[45], Z[45], s[45], c[46]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r89(s[45], clk, 1'b0, S[45]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r90(c[46], clk, 1'b0, C[46]);
    	fullAdder FA46(X[46], Y[46], Z[46], s[46], c[47]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r91(s[46], clk, 1'b0, S[46]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r92(c[47], clk, 1'b0, C[47]);
    	fullAdder FA47(X[47], Y[47], Z[47], s[47], c[48]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r93(s[47], clk, 1'b0, S[47]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r94(c[48], clk, 1'b0, C[48]);
    	fullAdder FA48(X[48], Y[48], Z[48], s[48], c[49]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r95(s[48], clk, 1'b0, S[48]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r96(c[49], clk, 1'b0, C[49]);
    	fullAdder FA49(X[49], Y[49], Z[49], s[49], c[50]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r97(s[49], clk, 1'b0, S[49]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r98(c[50], clk, 1'b0, C[50]);
    	fullAdder FA50(X[50], Y[50], Z[50], s[50], c[51]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r99(s[50], clk, 1'b0, S[50]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r100(c[51], clk, 1'b0, C[51]);
    	fullAdder FA51(X[51], Y[51], Z[51], s[51], c[52]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r101(s[51], clk, 1'b0, S[51]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r102(c[52], clk, 1'b0, C[52]);
    	fullAdder FA52(X[52], Y[52], Z[52], s[52], c[53]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r103(s[52], clk, 1'b0, S[52]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r104(c[53], clk, 1'b0, C[53]);
    	fullAdder FA53(X[53], Y[53], Z[53], s[53], c[54]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r105(s[53], clk, 1'b0, S[53]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r106(c[54], clk, 1'b0, C[54]);
    	fullAdder FA54(X[54], Y[54], Z[54], s[54], c[55]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r107(s[54], clk, 1'b0, S[54]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r108(c[55], clk, 1'b0, C[55]);
    	fullAdder FA55(X[55], Y[55], Z[55], s[55], c[56]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r109(s[55], clk, 1'b0, S[55]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r110(c[56], clk, 1'b0, C[56]);
    	fullAdder FA56(X[56], Y[56], Z[56], s[56], c[57]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r111(s[56], clk, 1'b0, S[56]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r112(c[57], clk, 1'b0, C[57]);
    	fullAdder FA57(X[57], Y[57], Z[57], s[57], c[58]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r113(s[57], clk, 1'b0, S[57]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r114(c[58], clk, 1'b0, C[58]);
    	fullAdder FA58(X[58], Y[58], Z[58], s[58], c[59]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r115(s[58], clk, 1'b0, S[58]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r116(c[59], clk, 1'b0, C[59]);
    	fullAdder FA59(X[59], Y[59], Z[59], s[59], c[60]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r117(s[59], clk, 1'b0, S[59]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r118(c[60], clk, 1'b0, C[60]);
    	fullAdder FA60(X[60], Y[60], Z[60], s[60], c[61]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r119(s[60], clk, 1'b0, S[60]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r120(c[61], clk, 1'b0, C[61]);
    	fullAdder FA61(X[61], Y[61], Z[61], s[61], c[62]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r121(s[61], clk, 1'b0, S[61]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r122(c[62], clk, 1'b0, C[62]);
    	fullAdder FA62(X[62], Y[62], Z[62], s[62], c[63]);
    		RisingEdge_DFlipFlop_SyncReset_1bit r123(s[62], clk, 1'b0, S[62]);
      		RisingEdge_DFlipFlop_SyncReset_1bit r124(c[63], clk, 1'b0, C[63]);*/
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



