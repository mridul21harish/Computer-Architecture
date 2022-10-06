`include "processor_register_file.v"
module register_file_tb();

	// Length of Data - 32 bit
	parameter data_width = 32;
   	// Length of Address - 5  bit
	parameter addr_width = 5;
	reg wr_enable;
	reg [(addr_width - 1):0] wr_addr, rd_addr1, rd_addr2;
	output [(data_width - 1):0] wr_data;
    	output [(data_width - 1):0] rd_data1, rd_data2;
    	reg [1:0] s;
	reg clk;
	
	always 
    	begin 
        	#5 clk = ~clk; 
    	end

    	initial 
    	begin
        	clk = 1'b1;
        	$display ("Addition: ");
        	rd_addr1 = 5'd10;
        	rd_addr2 = 5'd5;
        	wr_addr = 5'd6;
        	s = 2'd0;
        	#5
        	$display ("Subtraction: ");
        	rd_addr1 = 5'd24;
        	rd_addr2 = 5'd12;
        	wr_addr = 5'd1;
        	s = 2'd1;
        	#5
        	$display ("Bitwise AND: ");
        	rd_addr1 = 5'd28;
        	rd_addr2 = 5'd19;
        	wr_addr = 5'd8;
        	s = 2'd2;
        	#5
        	$display ("Bitwise OR: ");
        	rd_addr1 = 5'd17;
        	rd_addr2 = 5'd29;
        	wr_addr = 5'd30;
        	s = 2'd3;
        	$finish;
    	end

    	initial 
    	begin
        	$monitor ("\nin1 (rd\t: %d)\t= %b (%2d)\nin2 (rd\t: %d)\t= %b (%2d)\nout (wr\t: %d)\t= %b (%2d)\n", rd_addr1, rd_data1, rd_data1, rd_addr2, rd_data2, rd_data2, wr_addr, wr_data, wr_data);
    	end

    	runner main(wr_addr, rd_addr1, rd_addr2, rd_data1, rd_data2, wr_data, clk, s);

endmodule
