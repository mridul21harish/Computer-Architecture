`include "zeroInf.v"
`include "wallaceTreeMultiplier.v"
`include "barrelShifter.v"

module IEEEmultiply (input [31:0] a, input [31:0] b, input clk, output [31:0] c);

    wire s1, s2, s3;
    wire [7:0] e1, e2, e3, e3F, e3D;
    wire [22:0] m1, m2, m3, m3F, m3D;
    wire [63:0] prod, prodD, prodB;
    wire [31:0] mm1, mm2;
    wire [47:0] mprod, mprodD;
    reg [7:0] ex;
    integer i;
    
    assign s1 = a[31];
    assign e1 = a[30:23];
    assign m1 = a[22:0];
    assign s2 = b[31];
    assign e2 = b[30:23];
    assign m2 = b[22:0];
  
    assign s3 = s1 ^ s2;

    assign mm1 = {|e1, m1};
    assign mm2 = {|e2, m2};
  
    wallaceTreeMultiplier wm_01 (mm1, mm2, clk, prod);
    nDFF #(64) ndff_prod (prod, clk, 1'b1, prodD); //d flip flop
   
    always @(*) begin
        /*
            Final exponent is the sum of e1, e2 and -127
            We take the product for from 47 to 0 (47 and 46 are the bits before the decimal point,
            for normalizing we need 1 bit before the decimal, we shift one left adding 1 to the exponent.)
            We also add the 1 we get from normalizing the product from step 3
        */
        ex = e1 + e2 - 7'b1111110;
        i = 0;
        /*
            Loop and increment the counter until we find a 1 in the product
        */
        while (prodD[47 - i] == 1'b0) begin
            i = i + 1;
        end
        /*
            Shift the product i steps left for normalizing
            Decrement the exponent by i amounts
        */
        ex = ex - i;
    end
    barrelLeft #(48, 6) br (prodD[47:0], i, mprod);
    nDFF #(48) blD (mprod, clk, 1'b1, mprodD);
    
    assign e3 = ex;
    assign m3 = mprodD[46:24];
    
    zeroInf zf_01 (e1, m1, e2, m2, e3, m3, e3F, m3F);
    nDFF #(23) m3DFF (m3F, clk, 1'b1, m3D); //mantissa
    nDFF #(8) e3DFF (e3F, clk, 1'b1, e3D); //exponent
   
    assign c = {s3, e3D, m3D};

endmodule
