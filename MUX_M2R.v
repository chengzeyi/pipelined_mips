`include "ctrl_encode_def.v"

module MUX_M2R(m2r_sel, alu_result, dm_out, pc_plus4, m2r_data);

input [1:0] m2r_sel;
input [31:0] alu_result;
input [31:0] dm_out;
input [31:0] pc_plus4;

output reg[31:0] m2r_data;

always@(*)begin
    case(m2r_sel)
        `M2R_ALU:begin
            m2r_data <= alu_result;
        end
        `M2R_MEM:begin
            m2r_data <= dm_out;
        end
        `M2R_PCPLUS4:begin
            m2r_data <= pc_plus4;
        end
    endcase
end

endmodule