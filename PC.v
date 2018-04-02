`include "ctrl_encode_def.v"

module PCU(reset, clk, pc_src, pc_write, pc);
input reset;
input clk; //时钟信号
input [31:0] pc_src;
input pc_write;
output reg[31:0] pc; //程序计数器

always@(posedge reset)begin
	pc <= 0;
end

always@(posedge clk)begin
	if(pc_write == `PC_WRITE_ON)begin
		pc <= pc_src;
	end
end

endmodule