module cache_div #(
    	parameter address_bit = 20, //size of the addressess
    	parameter tag_bit = 6, //size of the tag
    	parameter index_bit = 10, //size of the index
    	parameter offset_bit = 4 //size of the offset
    	)(input [(tag_bit + index_bit + offset_bit - 1):0] address,
   	 output [(tag_bit - 1):0] tag,
    	output [(index_bit - 1):0] index,
    	output [(offset_bit - 1):0] offset
    	);

    	assign tag = address[(tag_bit + index_bit + offset_bit - 1):(index_bit + offset_bit)];
    	assign index = address[(index_bit + offset_bit - 1 ):offset_bit];
    	assign offset = address[(offset_bit - 1):0];

endmodule
