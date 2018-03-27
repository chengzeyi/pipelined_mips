`include "ctrl_encode_def.v"

module IF_ID_REG(clk, if_id_write, if_id_flush, instruction_in, instruction_out);
input clk, if_id_write, if_id_flush;
input [31:0]instruction_in;
output reg[31:0]instruction_out;

initial begin
	instruction_out = 0;
end
always@(posedge clk)begin
	if(if_id_flush == `IF_ID_FLUSH_ON)begin
		instruction_out = 0;
	end
	else begin
		if(if_id_write == `IF_ID_WRITE_ON)begin
			instruction_out = instruction_in;
		end
	end
end
endmodule