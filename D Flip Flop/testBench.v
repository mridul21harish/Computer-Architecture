/*
    Including the required modules
*/
`include "main.v"
/*
    A module that mutiplies two numbers represented in IEEE 754 format
*/
module top;

    /*
        Required registers and wires for the addition
    */
    reg [31:0] a, b;
    reg clk;
    wire [31:0] c;
    /*
        Module two multiply two numbers represented in IEEE 754 format
    */
    IEEEmultiply mul_01 (a, b, clk, c);

    always #1 clk = ~clk;

    initial begin
        clk = 1'b1;
        
        #0     a = 32'b01111111100000000000000000000000;   b = 32'b00000001100000010000000000000000; //Infinity * Normal number = Infinity
        
        #20    a = 32'b00000000000000000000000000000000;   b = 32'b01111111100000000000000000000000; //Zero * Infinity = NaN
   
        #25    a = 32'b01111111100000000000100001000000;   b = 32'b0000000000000000001011010001000; //NaN * Normal Number
       
        #50    a = 32'b01000000000000000000000000000000;   b = 32'b01000100011110100000000000000000; // +ve Num * +ve Num
        
        #50    a = 32'b01000001001000000000000000000000;   b = 32'b11000010110001100000000000000000;  // -ve Num * +ve Num
     
        #100 $finish;
    end

    initial begin
        $monitor($time, "\ta = %b\tb = %b\tprod = %b\t\n", a, b, c);
    end

endmodule
