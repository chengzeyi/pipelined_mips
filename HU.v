`include "ctrl_encode_def.v"

module HU(
    id_ex_dm_r, id_ex_instruction, if_id_instruction,
    id_ex_pc_src_sel, ex_alu_result, 
    pc_write, if_id_write, if_id_flush, id_ex_flush
);

input id_ex_dm_r;
input [31:0] id_ex_instruction;
input [31:0] if_id_instruction;
input [2:0] id_ex_pc_src_sel;
input [31:0] ex_alu_result;
output reg pc_write;
output reg if_id_write;
output reg if_id_flush;
output reg id_ex_flush;
wire [4:0] id_ex_rt_sel;
wire [4:0] if_id_rs_sel;
wire [4:0] if_id_rt_sel;

assign id_ex_rt_sel = id_ex_instruction[20:16];
assign if_id_rs_sel = if_id_instruction[25:21];
assign if_id_rt_sel = if_id_instruction[20:16];

always@(*)begin
    if((id_ex_dm_r == `DM_R_ON) && ((id_ex_rt_sel == if_id_rs_sel) || (id_ex_rt_sel == if_id_rt_sel)))begin
        pc_write <= `PC_WRITE_OFF;
        if_id_write <= `IF_ID_WRITE_OFF;
        if_id_flush <= `IF_ID_FLUSH_OFF;
        id_ex_flush <= `ID_EX_FLUSH_ON;
    end
    else if((id_ex_pc_src_sel == `PCSRC_JR) || (id_ex_pc_src_sel == `PCSRC_JT) || ((id_ex_pc_src_sel == `PCSRC_BT) && (ex_alu_result[0] == 1)))begin
        pc_write <= `PC_WRITE_ON;
        if_id_write <= `IF_ID_WRITE_OFF;
        if_id_flush <= `IF_ID_FLUSH_ON;
        id_ex_flush <= `ID_EX_FLUSH_ON;
    end
    else begin
        pc_write <= `PC_WRITE_ON;
        if_id_write <= `IF_ID_WRITE_ON;
        if_id_flush <= `IF_ID_FLUSH_OFF;
        id_ex_flush <= `ID_EX_FLUSH_OFF;
    end
end

endmodule