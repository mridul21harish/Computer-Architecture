`include "cache_div.v"
`include "main_mem.v"

module main #(
    parameter block = 1048576, //size of the main memory block
    parameter num_block = 1024, //size of the cache memory 
    parameter word_per_block = 16, //number of words in a block
    parameter word_size = 32, //size of a word
    parameter addr_bit = 32, //address_size
    parameter tag_bit = (addr_bit - offset_bit - index_bit), //tag size
    parameter index_bit = $clog2(num_block), //index size
    parameter offset_bit = $clog2(word_per_block) //offset size
)(
    input clk,
    // Mode 0 -> READ
    // Mode 1 -> WRITE
    input mode,
    input [addr_bit - 1 : 0] addr,
    input [word_size - 1 : 0] input_data,
    output reg [word_size - 1 : 0] output_data
);
    wire [tag_bit - 1 : 0] tag;
    wire [index_bit - 1 : 0] index;
    wire [offset_bit - 1 : 0] offset;
    
    cache_div #(addr_bit, tag_bit, index_bit, offset_bit) addr_div (addr, tag, index, offset);
    cache_mem #(num_block, word_per_block, word_size, addr_bit, tag_bit, index_bit, offset_bit) cache();
    main_mem #(block, word_per_block, word_size) main_mem();

    always @(posedge clk) 
    begin
        if (cache.flag[index] == 2'b11) 
        begin
            main_mem.mem[{tag, index}] = cache.c_mem[index];
            cache.flag[index] = 2'b10;
        end

        if (cache.tag[index] != tag) 
        begin
            cache.c_mem[index] = main_mem.mem[{tag, index}];
            cache.flag[index] = 2'b10;
            cache.tag[index] = tag;
        end

        if (mode == 1'b1) 
        begin
            cache.c_mem[index][offset] = input_data;
            cache.flag[index] = 2'b11;
        end

        else 
        begin
            output_data = cache.c_mem[index][offset];
        end

    end

endmodule



module cache_mem #(
    parameter num_block = 1024, //size of the cache memory 
    parameter word_per_block = 16, //number of words in a block
    parameter word_size = 32, //size of a word
    parameter addr_bit = 32, //address_size
    parameter tag_bit = addr_bit - offset_bit - index_bit, //tag size 
    parameter index_bit = $clog2(num_block), //index size
    parameter offset_bit = $clog2(word_per_block) //offset size
);

    reg [15:0][31:0]c_mem[1023:0];
    reg [tag_bit - 1 : 0] tag [num_block - 1 : 0];
    reg [1:0] flag [num_block-1 : 0];
    initial
    begin : start
        integer i;
        for (i = 0; i < num_block ; i = i + 1 ) 
        begin
            flag[i] = 2'b00;
        end
    end

endmodule
