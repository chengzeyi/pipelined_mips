`include "ctrl_encode_def.v"

module BCTRL(alu_result, ext_out, pc_plus4, bt);

input [31:0] alu_result;
input [31:0] ext_out;
input [31:0] pc_plus4;
output reg[31:0] bt;

always@(*)begin
    if(alu_result[0] == 1'b0)begin
        bt <= pc_plus4;
    end
    else begin
        bt <= pc_plus4 + {ext_out[29:0], 2'b00};
    end
end

endmodule