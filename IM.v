
module IM(ins_address, instruction);

input	[31:0]		ins_address; //指令地址

output	reg[31:0]	instruction; //指令代码

reg[31:0]	ins_mem[1023:0]; //指令内存

initial begin
	$readmemh("my_instructions.txt", ins_mem); //从文件中加载指令到内存
end

always@(ins_address)begin
		instruction <= ins_mem[ins_address[6:2]];
end

endmodule