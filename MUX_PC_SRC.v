`include "ctrl_encode_def.v"

module MUX_PC_SRC(pc_src_sel, xadr, illop, jr, jt, bt, pc, pc_src);
input [2:0] pc_src_sel;
input [31:0] xadr, illop, jr, jt, bt, pc_plus4;
output reg[31:0] pc_src;

initial begin
	pc_src = 0;
end
always@(*)begin
	case(pc_src_sel)
		`PCSRC_XADR:begin
			pc_src = xadr;
		end
		`PCSRC_ILLOP:begin
			pc_src = illop;
		end
		`PCSRC_JR:begin
			pc_src = jr;
		end
		`PCSRC_JT:begin
			pc_src = jt;
		end
		`PCSRC_BT:begin
			pc_src = bt;
		end
		`PCSRC_PLUS4:begin
			pc_src = pc + 4;
		end
	endcase
end
endmodule