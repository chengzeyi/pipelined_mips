`include "ctrl_encode_def.v"

module ID_EX(
    reset, clk, id_ex_flush, if_id_instruction, if_id_pc_plus4, gpr_rs, gpr_rt, ext_out,
    gpr_w_sel, m2r_sel, alu_src_a_sel, alu_src_b_sel, alu_op, dm_r, dm_w, pc_src_sel,
    id_ex_instruction, id_ex_pc_plus4, id_ex_gpr_rs, id_ex_gpr_rt, id_ex_ext_out, id_ex_gpr_w_sel, id_ex_m2r_sel, id_ex_alu_src_a_sel, id_ex_alu_src_b_sel, id_ex_alu_op, id_ex_dm_r, id_ex_dm_w, id_ex_pc_src_sel
    );

input reset;
input clk;
input id_ex_flush;
input [31:0] if_id_instruction;
input [31:0] if_id_pc_plus4;
input [31:0] gpr_rs;
input [31:0] gpr_rt;
input [31:0] ext_out;
input [1:0] gpr_w_sel;
input [1:0] m2r_sel;
input alu_src_a_sel;
input alu_src_b_sel;
input [4:0] alu_op;
input dm_r;
input dm_w;
input [2:0] pc_src_sel;
output reg[31:0] id_ex_instruction;
output reg[31:0] id_ex_pc_plus4;
output reg[31:0] id_ex_gpr_rs;
output reg[31:0] id_ex_gpr_rt;
output reg[31:0] id_ex_ext_out;
output reg[1:0] id_ex_gpr_w_sel;
output reg[1:0] id_ex_m2r_sel;
output reg id_ex_alu_src_a_sel;
output reg id_ex_alu_src_b_sel;
output reg[4:0] id_ex_alu_op;
output reg id_ex_dm_r;
output reg id_ex_dm_w;
output reg[2:0] id_ex_pc_src_sel;

always@(posedge reset)begin
    id_ex_instruction <= 0;
    id_ex_gpr_w_sel <= `GPR_XP;
    id_ex_alu_op <= `ALU_NOP;
    id_ex_dm_r <= `DM_R_OFF;
    id_ex_dm_w <= `DM_W_OFF;
    id_ex_pc_src_sel <= `PCSRC_PLUS4;
end

always@(posedge clk)begin
    if(id_ex_flush == `ID_EX_FLUSH_ON)begin
        id_ex_gpr_w_sel <= `GPR_XP;
        id_ex_alu_op <= `ALU_NOP;
        id_ex_dm_r <= `DM_R_OFF;
        id_ex_dm_w <= `DM_W_OFF;
        id_ex_pc_src_sel <= `PCSRC_PLUS4;
        $display("ID_EX_FLUSH_ON");
    end
    else begin
        id_ex_instruction <= if_id_instruction;
        id_ex_pc_plus4 <= if_id_pc_plus4;
        id_ex_gpr_rs <= gpr_rs;
        id_ex_gpr_rt <= gpr_rt;
        id_ex_ext_out <= ext_out;
        id_ex_gpr_w_sel <= gpr_w_sel;
        id_ex_m2r_sel <= m2r_sel;
        id_ex_alu_src_a_sel <= alu_src_a_sel;
        id_ex_alu_src_b_sel <= alu_src_b_sel;
        id_ex_alu_op <= alu_op;
        id_ex_dm_r <= dm_r;
        id_ex_dm_w <= dm_w;
        id_ex_pc_src_sel <= pc_src_sel;
    end
end

endmodule