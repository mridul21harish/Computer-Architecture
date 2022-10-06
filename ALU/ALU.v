module alu #(parameter  data_width = 32, parameter addr_width = 5)(input [(data_width - 1):0] a, b, input [1:0] s, output reg [(data_width - 1):0] c);

    always @(a, b, s) begin
        case (s)
            // 0: Addition
            2'b00: c = a + b;

            // 1: Subtraction
            2'b01: c = a - b;

            // 2: Bitwise AND
            2'b10: c = a & b;

            // 3: Bitwise OR
            2'b11: c = a | b;
        endcase
    end

endmodule
