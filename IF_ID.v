`include "ctrl_encode_def.v"

module IF_ID(reset, clk, if_id_write, if_id_flush, instruction, pc, if_id_pc_plus4, if_id_instruction);

input reset;
input clk;
input if_id_write;
input if_id_flush;
input [31:0] instruction;
input [31:0] pc;
output reg[31:0] if_id_instruction;
output reg[31:0] if_id_pc_plus4;

always@(posedge clk or posedge reset)begin
	if(reset)begin
		if_id_instruction <= 0;
		if_id_pc_plus4 <= 0;
	end
	else begin
		if(if_id_flush == `IF_ID_FLUSH_ON)begin
			if_id_instruction <= 0;
			if_id_pc_plus4 <= 0;
			$display("IF_ID_FLUSH_ON");
		end
		else if(if_id_write == `IF_ID_WRITE_ON)begin
			if_id_instruction <= instruction;
		end
		else begin
			$display("IF_ID_WRITE_OFF");
		end
		if_id_pc_plus4 <= pc + 4;
	end
end

endmodule