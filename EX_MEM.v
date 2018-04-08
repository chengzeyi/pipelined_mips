`include "ctrl_encode_def.v"

module EX_MEM(
    reset, clk, id_ex_instruction, id_ex_pc_plus4, id_ex_gpr_w_sel, id_ex_m2r_sel, id_ex_dm_r, id_ex_dm_w, alu_result, dm_w_data,
    ex_mem_instruction, ex_mem_pc_plus4, ex_mem_alu_result, ex_mem_dm_w_data, ex_mem_gpr_w_sel, ex_mem_m2r_sel, ex_mem_dm_r, ex_mem_dm_w
);

input reset;
input clk;
input [31:0] id_ex_instruction;
input [31:0] id_ex_pc_plus4;
input [1:0] id_ex_gpr_w_sel;
input [1:0] id_ex_m2r_sel;
input id_ex_dm_r;
input id_ex_dm_w;
input [31:0] alu_result;
input [31:0] dm_w_data;
output reg[31:0] ex_mem_instruction;
output reg[31:0] ex_mem_pc_plus4;
output reg[31:0] ex_mem_alu_result;
output reg[31:0] ex_mem_dm_w_data;
output reg[1:0] ex_mem_gpr_w_sel;
output reg[1:0] ex_mem_m2r_sel;
output reg ex_mem_dm_r;
output reg ex_mem_dm_w;

always@(posedge clk or posedge reset)begin
	if(reset)begin
		ex_mem_instruction <= 0;
		ex_mem_pc_plus4 <= 0;
		ex_mem_gpr_w_sel <= `GPR_XP;
		ex_mem_dm_r <= `DM_R_OFF;
		ex_mem_dm_w <= `DM_W_OFF;
	end
	else begin
		ex_mem_instruction <= id_ex_instruction;
		ex_mem_pc_plus4 <= id_ex_pc_plus4;
		ex_mem_alu_result <= alu_result;
		ex_mem_dm_w_data <= dm_w_data;
		ex_mem_gpr_w_sel <= id_ex_gpr_w_sel;
		ex_mem_m2r_sel <= id_ex_m2r_sel;
		ex_mem_dm_r <= id_ex_dm_r;
		ex_mem_dm_w <= id_ex_dm_w;
	end
end

endmodule