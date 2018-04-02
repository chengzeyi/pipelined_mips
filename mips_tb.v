module mips_tb();

reg		clk, reset;

MIPS	mips(.reset(reset), .clk(clk));

initial begin
	$monitor("PC = 0x%8X, IR = 0x%8X\nIF/ID_PC+4 = 0x%8X, IF/ID_IR = 0x%8X\nID/EX_PC+4 = 0x%8X, ID/EX_IR = 0x%8X\nEX/MEM_PC+4 = 0x%8X, EX/MEM_IR = 0x%8X\nMEM/WB_PC+4 = 0x%8X, MWM/WB_IR = 0x%8X", mips.pc.pc, mips.im.instruction, mips.if_id.if_id_pc_plus4, mips.if_id.if_id_instruction, mips.id_ex.id_ex_pc_plus4, mips.id_ex.id_ex_instruction, mips.ex_mem.ex_mem_pc_plus4, mips.ex_mem.ex_mem_instruction, mips.mem_wb.mem_wb_pc_plus4, mips.mem_wb.mem_wb_instruction);
	clk = 1;
	reset = 0;
	#5;
	reset = 1;
	#20;
	reset = 0;
end

always begin
	#(50) clk <= ~clk;
end

endmodule
