`include "ctrl_encode_def.v"

module MEM_WB(
    reset, clk, ex_mem_instruction, ex_mem_pc_plus4, ex_mem_gpr_w_sel, ex_mem_m2r_sel, ex_mem_alu_result, dm_r_data,
    mem_wb_instruction, mem_wb_pc_plus4, mem_wb_gpr_w_sel, mem_wb_m2r_sel, mem_wb_alu_result, mem_wb_dm_r_data
);

input reset;
input clk;
input [31:0] ex_mem_instruction;
input [31:0] ex_mem_pc_plus4;
input [1:0] ex_mem_gpr_w_sel;
input [1:0] ex_mem_m2r_sel;
input [31:0] ex_mem_alu_result;
input [31:0] dm_r_data;
output reg[31:0] mem_wb_instruction;
output reg[31:0] mem_wb_pc_plus4;
output reg[1:0] mem_wb_gpr_w_sel;
output reg[1:0] mem_wb_m2r_sel;
output reg[31:0] mem_wb_alu_result;
output reg[31:0] mem_wb_dm_r_data;

always@(posedge reset)begin
    mem_wb_instruction <= 0;
    mem_wb_gpr_w_sel <= `GPR_XP;
end

always@(posedge clk)begin
    mem_wb_instruction <= ex_mem_instruction;
    mem_wb_pc_plus4 <= ex_mem_pc_plus4;
    mem_wb_gpr_w_sel <= ex_mem_gpr_w_sel;
    mem_wb_m2r_sel <= ex_mem_m2r_sel;
    mem_wb_alu_result <= ex_mem_alu_result;
    mem_wb_dm_r_data <= dm_r_data;
end

endmodule