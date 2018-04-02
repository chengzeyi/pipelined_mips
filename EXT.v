`include "ctrl_encode_def.v"

module EXT(if_id_instruction, ext_op, ext_out);

input [31:0] if_id_instruction;
input [1:0] ext_op;

output reg[31:0] ext_out;

always@(if_id_instruction or ext_op)begin
    case(ext_op)
        `EXT_ZERO:begin
           ext_out <= {{16{1'b0}}, if_id_instruction[15:0]};
        end
        `EXT_SIGNED:begin
            ext_out <= {{16{if_id_instruction[15]}}, if_id_instruction[15:0]};
        end
        `EXT_HIGHPOS:begin
            ext_out <= {if_id_instruction[15:0], {16{1'b0}}};
        end
    endcase
end

endmodule