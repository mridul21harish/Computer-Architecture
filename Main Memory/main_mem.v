module main_mem #(
    parameter block = 1048576, //size of the main memory block size
    parameter word_per_block = 16, //number of words per block 
    parameter word_size = 32 //size of the words
    )();

    integer  i, j;
    reg [word_per_block - 1:0][word_size - 1:0]mem[block - 1:0];
    task starting;    
        for(i = 0; i < block ; i = i + 1 ) 
        begin
            for (j = 0; j < word_per_block; j = j + 1) 
            begin
                mem[i][j] = $random; //returns a random 32 bit value
            end
        end
    endtask
    
endmodule
