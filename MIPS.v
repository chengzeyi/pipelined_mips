
module MIPS(reset, clk);

input reset;
input clk;

wire [31:0] mux_pc_src_pc_pc_src;
wire [31:0] pc_mux_pc_src_im_if_id_pc;
wire [31:0] im_if_id_instruction;
wire hu_pc_pc_write;
wire hu_if_id_if_id_write;
wire hu_if_id_if_id_flush;
wire hu_id_ex_id_ex_flush;
wire [31:0] if_id_hu_ctrl_gpr_ext_id_ex_instruction;
wire [31:0] if_id_id_ex_pc_plus4;
wire [1:0] ctrl_id_ex_gpr_w_sel;
wire [2:0] ctrl_id_ex_pc_src_sel;
wire [1:0] ctrl_id_ex_m2r_sel;
wire [1:0] ctrl_ext_ext_op;
wire ctrl_id_ex_dm_r;
wire ctrl_id_ex_dm_w;
wire ctrl_id_ex_alu_src_a_sel;
wire ctrl_id_ex_alu_src_b_sel;
wire [4:0] ctrl_id_ex_alu_op;
wire [31:0] gpr_id_ex_reg_rs;
wire [31:0] gpr_id_ex_reg_rt;
wire [31:0] ext_id_ex_ext_out;
wire [31:0] id_ex_hu_fu_ex_mem_instruction;
wire [31:0] id_ex_bctrl_ex_mem_pc_plus4;
wire [31:0] id_ex_fu_gpr_rs;
wire [31:0] id_ex_fu_gpr_rt;
wire [31:0] id_ex_fu_bctrl_ext_out;
wire [1:0] id_ex_ex_mem_gpr_w_sel;
wire [1:0] id_ex_ex_mem_m2r_sel;
wire id_ex_fu_alu_src_a_sel;
wire id_ex_fu_alu_src_b_sel;
wire [4:0] id_ex_alu_alu_op;
wire id_ex_hu_ex_mem_dm_r;
wire id_ex_ex_mem_dm_w;
wire [2:0] id_ex_hu_mux_pc_src_pc_src_sel;
wire [31:0] bctrl_mux_pc_src_bt;
wire [31:0] alu_hu_bctrl_ex_mem_alu_result;
wire [31:0] fu_alu_alu_src_a;
wire [31:0] fu_alu_alu_src_b;
wire [31:0] fu_ex_mem_dm_w_data;
wire [31:0] fu_mux_pc_src_jr_src;
wire [31:0] ex_mem_fu_mem_wb_instruction;
wire [31:0] ex_mem_mem_wb_pc_plus4;
wire [31:0] ex_mem_fu_dm_mem_wb_alu_result;
wire [31:0] ex_mem_dm_dm_w_data;
wire [1:0] ex_mem_fu_mem_wb_gpr_w_sel;
wire [1:0] ex_mem_mem_wb_m2r_sel;
wire ex_mem_dm_dm_r;
wire ex_mem_dm_dm_w;
wire [31:0] dm_mem_wb_data_out;
wire [31:0] mem_wb_fu_gpr_instruction;
wire [31:0] mem_wb_mux_m2r_pc_plus4;
wire [1:0] mem_wb_fu_gpr_gpr_w_sel;
wire [1:0] mem_wb_mux_m2r_m2r_sel;
wire [31:0] mem_wb_mux_m2r_alu_result;
wire [31:0] mem_wb_mux_m2r_dm_r_data;
wire [31:0] mux_m2r_gpr_fu_m2r_data;

wire [31:0] id_ex_mux_pc_src_jt;
assign id_ex_mux_pc_src_jt = {id_ex_bctrl_ex_mem_pc_plus4[31:28], id_ex_hu_fu_ex_mem_instruction[25:0], 2'b00};

PCU pc(.reset(reset), .clk(clk), .pc_src(mux_pc_src_pc_pc_src), .pc_write(hu_pc_pc_write), .pc(pc_mux_pc_src_im_if_id_pc));

MUX_PC_SRC mux_pc_src(.pc_src_sel(id_ex_hu_mux_pc_src_pc_src_sel), .xadr(0), .illop(0), .jr(fu_mux_pc_src_jr_src), .jt(id_ex_mux_pc_src_jt), .bt(bctrl_mux_pc_src_bt), .pc(pc_mux_pc_src_im_if_id_pc), .pc_src(mux_pc_src_pc_pc_src));

IM im(.ins_address(pc_mux_pc_src_im_if_id_pc), .instruction(im_if_id_instruction));

HU hu(.id_ex_dm_r(id_ex_hu_ex_mem_dm_r), .id_ex_instruction(id_ex_hu_fu_ex_mem_instruction), .if_id_instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction), .id_ex_pc_src_sel(id_ex_hu_mux_pc_src_pc_src_sel), .ex_alu_result(alu_hu_bctrl_ex_mem_alu_result), .pc_write(hu_pc_pc_write), .if_id_write(hu_if_id_if_id_write), .if_id_flush(hu_if_id_if_id_flush), .id_ex_flush(hu_id_ex_id_ex_flush));

IF_ID if_id(.reset(reset), .clk(clk), .if_id_write(hu_if_id_if_id_write), .if_id_flush(hu_if_id_if_id_flush), .instruction(im_if_id_instruction), .pc(pc_mux_pc_src_im_if_id_pc), .if_id_pc_plus4(if_id_id_ex_pc_plus4), .if_id_instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction));

CTRL ctrl(.instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction), .gpr_w_sel(ctrl_id_ex_gpr_w_sel), .m2r_sel(ctrl_id_ex_m2r_sel), .ext_op(ctrl_ext_ext_op), .alu_src_a_sel(ctrl_id_ex_alu_src_a_sel), .alu_src_b_sel(ctrl_id_ex_alu_src_b_sel), .alu_op(ctrl_id_ex_alu_op), .dm_r(ctrl_id_ex_dm_r), .dm_w(ctrl_id_ex_dm_w), .pc_src_sel(ctrl_id_ex_pc_src_sel));

GPR gpr(.clk(clk), .if_id_instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction), .mem_wb_instruction(mem_wb_fu_gpr_instruction), .gpr_w_sel(mem_wb_fu_gpr_gpr_w_sel), .gpr_w_data(mux_m2r_gpr_fu_m2r_data), .reg_rs(gpr_id_ex_reg_rs), .reg_rt(gpr_id_ex_reg_rt));

EXT ext(.if_id_instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction), .ext_op(ctrl_ext_ext_op), .ext_out(ext_id_ex_ext_out));

ID_EX id_ex(.reset(reset), .clk(clk), .id_ex_flush(hu_id_ex_id_ex_flush), .if_id_instruction(if_id_hu_ctrl_gpr_ext_id_ex_instruction), .if_id_pc_plus4(if_id_id_ex_pc_plus4), .gpr_rs(gpr_id_ex_reg_rs), .gpr_rt(gpr_id_ex_reg_rt), .ext_out(ext_id_ex_ext_out), .gpr_w_sel(ctrl_id_ex_gpr_w_sel), .m2r_sel(ctrl_id_ex_m2r_sel), .alu_src_a_sel(ctrl_id_ex_alu_src_a_sel), .alu_src_b_sel(ctrl_id_ex_alu_src_b_sel), .alu_op(ctrl_id_ex_alu_op), .dm_r(ctrl_id_ex_dm_r), .dm_w(ctrl_id_ex_dm_w), .pc_src_sel(ctrl_id_ex_pc_src_sel), .id_ex_instruction(id_ex_hu_fu_ex_mem_instruction), .id_ex_pc_plus4(id_ex_bctrl_ex_mem_pc_plus4), .id_ex_gpr_rs(id_ex_fu_gpr_rs), .id_ex_gpr_rt(id_ex_fu_gpr_rt), .id_ex_ext_out(id_ex_fu_bctrl_ext_out), .id_ex_gpr_w_sel(id_ex_ex_mem_gpr_w_sel), .id_ex_m2r_sel(id_ex_ex_mem_m2r_sel), .id_ex_alu_src_a_sel(id_ex_fu_alu_src_a_sel), .id_ex_alu_src_b_sel(id_ex_fu_alu_src_b_sel), .id_ex_alu_op(id_ex_alu_alu_op), .id_ex_dm_r(id_ex_hu_ex_mem_dm_r), .id_ex_dm_w(id_ex_ex_mem_dm_w), .id_ex_pc_src_sel(id_ex_hu_mux_pc_src_pc_src_sel));

BCTRL bctrl(.alu_result(alu_hu_bctrl_ex_mem_alu_result), .ext_out(id_ex_fu_bctrl_ext_out), .pc_plus4(id_ex_bctrl_ex_mem_pc_plus4), .bt(bctrl_mux_pc_src_bt));

ALU alu(.alu_src_a(fu_alu_alu_src_a), .alu_src_b(fu_alu_alu_src_b), .alu_op(id_ex_alu_alu_op), .alu_result(alu_hu_bctrl_ex_mem_alu_result));

FU fu(.id_ex_alu_src_a_sel(id_ex_fu_alu_src_a_sel), .id_ex_alu_src_b_sel(id_ex_fu_alu_src_b_sel), .ex_mem_gpr_w_sel(ex_mem_fu_mem_wb_gpr_w_sel), .mem_wb_gpr_w_sel(mem_wb_fu_gpr_gpr_w_sel), .id_ex_rs(id_ex_fu_gpr_rs), .id_ex_rt(id_ex_fu_gpr_rt), .id_ex_instruction(id_ex_hu_fu_ex_mem_instruction), .ex_mem_instruction(ex_mem_fu_mem_wb_instruction), .mem_wb_instruction(mem_wb_fu_gpr_instruction), .id_ex_ext_out(id_ex_fu_bctrl_ext_out), .ex_mem_alu_result(ex_mem_fu_dm_mem_wb_alu_result), .wb_m2r_data(mux_m2r_gpr_fu_m2r_data), .alu_src_a(fu_alu_alu_src_a), .alu_src_b(fu_alu_alu_src_b), .dm_w_data(fu_ex_mem_dm_w_data), .jr_src(fu_mux_pc_src_jr_src));

EX_MEM ex_mem(.reset(reset), .clk(clk), .id_ex_instruction(id_ex_hu_fu_ex_mem_instruction), .id_ex_pc_plus4(id_ex_bctrl_ex_mem_pc_plus4), .id_ex_gpr_w_sel(id_ex_ex_mem_gpr_w_sel), .id_ex_m2r_sel(id_ex_ex_mem_m2r_sel), .id_ex_dm_r(id_ex_hu_ex_mem_dm_r), .id_ex_dm_w(id_ex_ex_mem_dm_w), .alu_result(alu_hu_bctrl_ex_mem_alu_result), .dm_w_data(fu_ex_mem_dm_w_data), .ex_mem_instruction(ex_mem_fu_mem_wb_instruction), .ex_mem_pc_plus4(ex_mem_mem_wb_pc_plus4), .ex_mem_alu_result(ex_mem_fu_dm_mem_wb_alu_result), .ex_mem_dm_w_data(ex_mem_dm_dm_w_data), .ex_mem_gpr_w_sel(ex_mem_fu_mem_wb_gpr_w_sel), .ex_mem_m2r_sel(ex_mem_mem_wb_m2r_sel), .ex_mem_dm_r(ex_mem_dm_dm_r), .ex_mem_dm_w(ex_mem_dm_dm_w));

DM dm(.clk(clk), .data_address(ex_mem_fu_dm_mem_wb_alu_result), .data_in(ex_mem_dm_dm_w_data), .dm_r(ex_mem_dm_dm_r), .dm_w(ex_mem_dm_dm_w), .data_out(dm_mem_wb_data_out));

MEM_WB mem_wb(.reset(reset), .clk(clk), .ex_mem_instruction(ex_mem_fu_mem_wb_instruction), .ex_mem_pc_plus4(ex_mem_mem_wb_pc_plus4), .ex_mem_gpr_w_sel(ex_mem_fu_mem_wb_gpr_w_sel), .ex_mem_m2r_sel(ex_mem_mem_wb_m2r_sel), .ex_mem_alu_result(ex_mem_fu_dm_mem_wb_alu_result), .dm_r_data(dm_mem_wb_data_out), .mem_wb_instruction(mem_wb_fu_gpr_instruction), .mem_wb_pc_plus4(mem_wb_mux_m2r_pc_plus4), .mem_wb_gpr_w_sel(mem_wb_fu_gpr_gpr_w_sel), .mem_wb_m2r_sel(mem_wb_mux_m2r_m2r_sel), .mem_wb_alu_result(mem_wb_mux_m2r_alu_result), .mem_wb_dm_r_data(mem_wb_mux_m2r_dm_r_data));

MUX_M2R mux_m2r(.m2r_sel(mem_wb_mux_m2r_m2r_sel), .alu_result(mem_wb_mux_m2r_alu_result), .dm_out(mem_wb_mux_m2r_dm_r_data), .pc_plus4(mem_wb_mux_m2r_pc_plus4), .m2r_data(mux_m2r_gpr_fu_m2r_data));

endmodule