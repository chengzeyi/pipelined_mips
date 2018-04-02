`include "ctrl_encode_def.v"

module FU(
    id_ex_alu_src_a_sel, id_ex_alu_src_b_sel, ex_mem_gpr_w_sel, mem_wb_gpr_w_sel, id_ex_rs, id_ex_rt, id_ex_instruction, ex_mem_instruction, mem_wb_instruction, id_ex_ext_out, ex_mem_alu_result, wb_m2r_data,
    alu_src_a, alu_src_b, dm_w_data, jr_src
);

input id_ex_alu_src_a_sel;
input id_ex_alu_src_b_sel;
input [1:0] ex_mem_gpr_w_sel;
input [1:0] mem_wb_gpr_w_sel;
input [31:0] id_ex_rs;
input [31:0] id_ex_rt;
input [31:0] id_ex_instruction;
input [31:0] ex_mem_instruction;
input [31:0] mem_wb_instruction;
input [31:0] id_ex_ext_out;
input [31:0] ex_mem_alu_result;
input [31:0] wb_m2r_data;
output reg[31:0] alu_src_a;
output reg[31:0] alu_src_b;
output reg[31:0] dm_w_data;
output reg[31:0] jr_src;

wire [4:0] id_ex_rs_sel;
wire [4:0] id_ex_rt_sel;
wire [4:0] ex_mem_rt_sel;
wire [4:0] ex_mem_rd_sel;
wire [4:0] mem_wb_rt_sel;
wire [4:0] mem_wb_rd_sel;
wire [31:0] shamt;
reg [31:0] tmp_rs;
reg [31:0] tmp_rt;

assign id_ex_rs_sel = id_ex_instruction[25:21];
assign id_ex_rt_sel = id_ex_instruction[20:16];
assign ex_mem_rt_sel = ex_mem_instruction[20:16];
assign ex_mem_rd_sel = ex_mem_instruction[15:11];
assign mem_wb_rt_sel = mem_wb_instruction[20:16];
assign mem_wb_rd_sel = mem_wb_instruction[15:11];
assign shamt = {{27{1'b0}}, id_ex_instruction[10:6]};

always@(*)begin
    if(((ex_mem_gpr_w_sel == `GPR_RT) && (ex_mem_rt_sel == id_ex_rs_sel)) ||
        ((ex_mem_gpr_w_sel == `GPR_RD) && (ex_mem_rd_sel == id_ex_rs_sel)) ||
        ((ex_mem_gpr_w_sel == `GPR_RA) && (id_ex_rs_sel == 31)))
        begin
        tmp_rs <= ex_mem_alu_result;
    end
    else if(((mem_wb_gpr_w_sel == `GPR_RT) && (mem_wb_rt_sel == id_ex_rs_sel)) ||
        ((mem_wb_gpr_w_sel == `GPR_RD) && (mem_wb_rd_sel == id_ex_rs_sel)) ||
        ((mem_wb_gpr_w_sel == `GPR_RA) && (id_ex_rs_sel == 31)))
        begin
        tmp_rs <= wb_m2r_data;
    end
    else begin
        tmp_rs <= id_ex_rs;
    end
    if(((ex_mem_gpr_w_sel == `GPR_RT) && (ex_mem_rt_sel == id_ex_rt_sel)) ||
        ((ex_mem_gpr_w_sel == `GPR_RD) && (ex_mem_rd_sel == id_ex_rt_sel)) ||
        ((ex_mem_gpr_w_sel == `GPR_RA) && (id_ex_rt_sel == 31)))
        begin
        tmp_rt <= ex_mem_alu_result;
    end
    else if(((mem_wb_gpr_w_sel == `GPR_RT) && (mem_wb_rt_sel == id_ex_rt_sel)) ||
        ((mem_wb_gpr_w_sel == `GPR_RD) && (mem_wb_rd_sel == id_ex_rt_sel)) ||
        ((mem_wb_gpr_w_sel == `GPR_RA) && (id_ex_rt_sel == 31)))
        begin
        tmp_rt <= wb_m2r_data;
    end
    else begin
        tmp_rt <= id_ex_rt;
    end
    case(id_ex_alu_src_a_sel)
        `ALU_SRC_A_RS:begin
            alu_src_a <= tmp_rs;
        end
        `ALU_SRC_A_SHAMT:begin
            alu_src_a <= shamt;
        end
    endcase
    case(id_ex_alu_src_b_sel)
        `ALU_SRC_B_RT:begin
            alu_src_b <= tmp_rt;
        end
        `ALU_SRC_B_EXT:begin
            alu_src_b <= id_ex_ext_out;
        end
    endcase
    dm_w_data = tmp_rt;
    jr_src = tmp_rs;
end

endmodule