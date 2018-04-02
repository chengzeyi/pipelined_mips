`include "ctrl_encode_def.v"
`include "instruction_def.v"

module CTRL(
	instruction, 
	gpr_w_sel, m2r_sel, ext_op,
	alu_src_a_sel, alu_src_b_sel, alu_op,
	dm_r, dm_w, pc_src_sel);

input [31:0] instruction;
output reg[1:0] gpr_w_sel;
output reg[2:0] pc_src_sel;
output reg[1:0] m2r_sel;
output reg[1:0] ext_op;
output reg dm_r;
output reg dm_w;
output reg alu_src_a_sel;
output reg alu_src_b_sel;
output reg[4:0] alu_op;

wire[5:0] opcode;
wire[5:0] funct;

assign opcode = instruction[31:26];
assign funct = instruction[5:0];

always@(opcode or funct)begin
	case(opcode)
		`INSTR_RTYPE_OP:begin
			if(funct == `INSTR_JR_FUNCT)begin
				gpr_w_sel <= `GPR_XP;
			end
			else if(funct == `INSTR_JALR_FUNCT)begin
				gpr_w_sel <= `GPR_RA;
			end
			else begin
				gpr_w_sel <= `GPR_RD;
			end

			if((funct == `INSTR_JR_FUNCT) || (funct == `INSTR_JALR_FUNCT))begin
				pc_src_sel <= `PCSRC_JR;
			end
			else begin
				pc_src_sel <= `PCSRC_PLUS4;
			end

			if(funct == `INSTR_JALR_FUNCT)begin
				m2r_sel <= `M2R_PCPLUS4;
			end
			else begin
				m2r_sel <= `M2R_ALU;
			end
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_b_sel <= `ALU_SRC_B_RT;
			case(funct)
				`INSTR_ADD_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_ADD;
				end
				`INSTR_ADDU_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_ADDU;
				end
				`INSTR_SUB_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SUB;
				end
				`INSTR_SUBU_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SUBU;
				end
				`INSTR_AND_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_AND;
				end
				`INSTR_OR_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_OR;
				end
				`INSTR_NOR_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_NOR;
				end
				`INSTR_XOR_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_XOR;
				end
				`INSTR_SLT_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SLT;
				end
				`INSTR_SLTU_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SLTU;
				end
				`INSTR_SLL_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_SHAMT;
					alu_op <= `ALU_SLL;
				end
				`INSTR_SRL_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_SHAMT;
					alu_op <= `ALU_SRL;
				end
				`INSTR_SRA_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_SHAMT;
					alu_op <= `ALU_SRA;
				end
				`INSTR_SLLV_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SLL;
				end
				`INSTR_SRAV_FUNCT:begin
					alu_src_a_sel <= `ALU_SRC_A_RS;
					alu_op <= `ALU_SRA;
				end
			endcase
		end
		`INSTR_LW_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_MEM;
			ext_op <= `EXT_SIGNED;
			dm_r <= `DM_R_ON;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_ADD;
		end
		`INSTR_SW_OP:begin
			gpr_w_sel <= `GPR_XP;
			pc_src_sel <= `PCSRC_PLUS4;
			ext_op <= `EXT_SIGNED;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_ON;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_ADD;
		end
		`INSTR_ADDI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_SIGNED;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_ADD;
		end
		`INSTR_ADDIU_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_ZERO;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_ADD;
		end
		`INSTR_ANDI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_ZERO;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_AND;
		end
		`INSTR_ORI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_ZERO;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_OR;
		end
		`INSTR_XORI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_ZERO;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_XOR;
		end
		`INSTR_LUI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_HIGHPOS;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_ADDU;
		end
		`INSTR_SLTI_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_SIGNED;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_SLT;
		end
		`INSTR_SLTIU_OP:begin
			gpr_w_sel <= `GPR_RT;
			pc_src_sel <= `PCSRC_PLUS4;
			m2r_sel <= `M2R_ALU;
			ext_op <= `EXT_ZERO;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_EXT;
			alu_op <= `ALU_SLTU;
		end
		`INSTR_BEQ_OP:begin
			gpr_w_sel <= `GPR_XP;
			pc_src_sel <= `PCSRC_BT;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_RT;
			alu_op <= `ALU_EQL;
		end
		`INSTR_BNE_OP:begin
			gpr_w_sel <= `GPR_XP;
			pc_src_sel <= `PCSRC_BT;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
			alu_src_a_sel <= `ALU_SRC_A_RS;
			alu_src_b_sel <= `ALU_SRC_B_RT;
			alu_op <= `ALU_BNE;
		end
		`INSTR_J_OP:begin
			gpr_w_sel <= `GPR_XP;
			pc_src_sel <= `PCSRC_JT;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
		end
		`INSTR_JAL_OP:begin
			gpr_w_sel <= `GPR_RA;
			pc_src_sel <= `PCSRC_JT;
			m2r_sel <= `M2R_PCPLUS4;
			dm_r <= `DM_R_OFF;
			dm_w <= `DM_W_OFF;
		end
	endcase
end

endmodule