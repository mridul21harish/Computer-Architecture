`include "multiplier.v"
`include "carrySaveAdder.v"

module wallaceTreeMultiplier (A, B, clk, Cc);
    
input [31:0]A;
input [31:0]B;
input clk;
    
output [63:0]Cc;

wire [63:0] AB [31:0], temp1 [31:0];
wire [31:0] temp [31:0];
wire [63:0] s [30:0];
wire [63:0] c [30:0];
wire [63:0]K;

wire [63:0] S [30:0];
wire [63:0] C [30:0];
    
genvar i;
    
    	generate
        	for(i = 0; i < 32; i = i + 1)
        	begin : and_loop
        	    multiplier mul(A, B[i], temp[i]);
        	    assign temp1[i] = {{32{1'b0}}, temp[i]};
        	    assign AB[i] = temp1[i] << i;
        	end
    	endgenerate

    	carrySaveAdder ca01(AB[0], AB[1], AB[2], clk, s[0], c[0]);
    	carrySaveAdder ca02(AB[3], AB[4], AB[5], clk, s[1], c[1]);
    	carrySaveAdder ca03(AB[6], AB[7], AB[8], clk, s[2], c[2]);
    	carrySaveAdder ca04(AB[9], AB[10], AB[11], clk, s[3], c[3]);
    	carrySaveAdder ca05(AB[12], AB[13], AB[14], clk, s[4], c[4]);
    	carrySaveAdder ca06(AB[15], AB[16], AB[17], clk, s[5], c[5]);
    	carrySaveAdder ca07(AB[18], AB[19], AB[20], clk, s[6], c[6]);
    	carrySaveAdder ca08(AB[21], AB[22], AB[23], clk, s[7], c[7]);
    	carrySaveAdder ca09(AB[24], AB[25], AB[26], clk, s[8], c[8]);
    	carrySaveAdder ca10(AB[27], AB[28], AB[29], clk, s[9], c[9]);
    	
	generate
	for(i = 0; i < 10; i = i+1)
	begin : pipeline1
		RisingEdge_DFlipFlop_SyncReset ra(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset rb(c[i], clk, 1'b0, C[i]);
	end
	endgenerate

    	carrySaveAdder ca11(S[0], C[0], S[1], clk, s[10], c[10]);
    	carrySaveAdder ca12(C[1], S[2], C[2], clk, s[11], c[11]);
    	carrySaveAdder ca13(C[3], S[3], S[4], clk, s[12], c[12]);
    	carrySaveAdder ca14(C[4], S[5], C[5], clk, s[13], c[13]);
    	carrySaveAdder ca15(S[6], C[6], S[7], clk, s[14], c[14]);
    	carrySaveAdder ca16(C[7], C[8], S[8], clk, s[15], c[15]);
    	carrySaveAdder ca17(S[9], C[9], AB[30], clk, s[16], c[16]);
    	
    	generate
	for(i = 10; i < 17; i = i+1)
	begin : pipeline2
		RisingEdge_DFlipFlop_SyncReset r0(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r1(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca18(S[10], C[10], S[11], clk, s[17], c[17]);
    	carrySaveAdder ca19(C[11], S[12], C[12], clk, s[18], c[18]);
    	carrySaveAdder ca20(C[13], S[13], S[14], clk, s[19], c[19]);
    	carrySaveAdder ca21(C[14], C[15], S[15], clk, s[20], c[20]);
    	carrySaveAdder ca22(S[16], C[16], AB[31], clk, s[21], c[21]);
    	
    	generate
	for(i = 17; i < 22; i = i+1)
	begin : pipeline3
		RisingEdge_DFlipFlop_SyncReset r2(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r3(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca23(S[17], C[17], S[18], clk, s[22], c[22]);
    	carrySaveAdder ca24(C[18], S[19], C[19], clk, s[23], c[23]);
    	carrySaveAdder ca25(C[20], S[20], S[21], clk, s[24], c[24]);
    	
    	generate
	for(i = 22; i < 25; i = i+1)
	begin : pipeline4
		RisingEdge_DFlipFlop_SyncReset r4(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r5(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca26(S[22], C[22], S[23], clk, s[25], c[25]);
    	carrySaveAdder ca27(C[23], S[24], C[24], clk, s[26], c[26]);
    	
    	generate
	for(i = 25; i < 27; i = i+1)
	begin : pipeline5
		RisingEdge_DFlipFlop_SyncReset r6(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r7(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca28(C[25], S[25], S[26], clk, s[27], c[27]);
    	carrySaveAdder ca29(C[26], C[21], {64{1'b0}}, clk, s[28], c[28]);
    	
    	generate
	for(i = 27; i < 29; i = i+1)
	begin : pipeline6
		RisingEdge_DFlipFlop_SyncReset r8(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r9(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca30(S[27], C[27], S[28], clk, s[29], c[29]);
    	
    	generate
	for(i = 29; i < 30; i = i+1)
	begin : pipeline7
		RisingEdge_DFlipFlop_SyncReset r10(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r11(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
    	
    	carrySaveAdder ca31(C[28], S[29], C[29], clk, s[30], c[30]);
    	
    	generate
	for(i = 30; i < 31; i = i+1)
	begin : pipeline8
		RisingEdge_DFlipFlop_SyncReset r12(s[i], clk, 1'b0, S[i]);
		RisingEdge_DFlipFlop_SyncReset r13(c[i], clk, 1'b0, C[i]);
	end
	endgenerate
	
    	sixtyFourBitAdder SRA(S[30], C[30], 1'b0, Cc, K);

endmodule

module RisingEdge_DFlipFlop_SyncReset_1bit(D,clk,sync_reset,Q);
	input D; // Data input 
	input clk; // clock input 
	input sync_reset; // synchronous reset 
	output reg Q; // output Q 
	always @(posedge clk) 
	begin
 	if(sync_reset == 1'b1)
  		Q <= 1'b0; 
 	else 
  		Q <= D; 
	end 
endmodule 

module RisingEdge_DFlipFlop_SyncReset(D, clk, sync_reset, Q);
	input [63:0] D;
	input clk; // clock input 
	input sync_reset; // synchronous reset 
	output [63:0] Q; // output Q 
	
	genvar i;
	
	generate
	for(i = 0; i < 64; i = i+1) 
	begin : pipelining
		RisingEdge_DFlipFlop_SyncReset_1bit r10(D[i], clk, sync_reset, Q[i]);
	end
	endgenerate
endmodule 
