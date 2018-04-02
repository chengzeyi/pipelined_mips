module mips_tb();

reg		clk, reset;

MIPS	mips(.reset(reset), .clk(clk));

initial begin
	$monitor("PC = 0x%8X, IR = 0x%8X", mips.pc_mux_pc_src_im_if_id_pc, mips.im_if_id_instruction); 
	clk = 1;
	reset = 0;
	#5;
	reset = 1;
	#20;
	reset = 0;
end

always
	#(50) clk = ~clk;

endmodule
