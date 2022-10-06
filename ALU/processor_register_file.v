`include "ALU.v"

module reg_file #(parameter  data_width = 32, parameter addr_width = 5)(input wr_enable, input [(addr_width - 1):0] wr_addr, rd_addr1, rd_addr2, input [(data_width - 1):0] wr_data, output [(data_width - 1):0] rd_data1, rd_data2, input clk);

    	// Instantiating a reg file 
	reg [(data_width - 1):0] reg_file [(data_width - 1):0];
    	integer i;
		assign rd_data1 = reg_file[rd_addr1];
		assign rd_data2 = reg_file[rd_addr2];

    	initial 
    	begin
        	for (i = 0; i < 32; i = i + 1) 
        	begin
        	    reg_file[i] = i * 2;
        	end
	end 

	always @(posedge clk) 
    	begin 
        	if (wr_enable) 
        	begin
        	    reg_file[wr_addr] = wr_data; 
        	end 
    	end
endmodule

module runner #(parameter  data_width = 32, parameter addr_width = 5)(input [(addr_width - 1):0] wr_addr, rd_addr1, rd_addr2, output [(data_width - 1):0] rd_data1, rd_data2, wr_data, input clk, input[1:0] s);

    	reg_file reg_file1 (1'b0, wr_addr, rd_addr1, rd_addr2, {data_width{1'bz}}, rd_data1, rd_data2, clk);
    	alu op (rd_data1, rd_data2, s, wr_data);
    	reg_file reg_file2 (1'b1, wr_addr, rd_addr1, rd_addr2, wr_data, rd_data1, rd_data2, clk);
endmodule
