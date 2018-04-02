`include "ctrl_encode_def.v"

module ALU(alu_src_a, alu_src_b, alu_op, alu_result);

input [31:0] alu_src_a;
input [31:0] alu_src_b;
input [4:0] alu_op;

output reg[31:0] alu_result;

reg[31:0] temp;

initial begin
  temp <= 0;
end

always@(alu_src_a or alu_src_b or alu_op)begin
	case(alu_op)
		`ALU_NOP:begin
			alu_result <= 0;
		end
		`ALU_ADDU:begin
			alu_result <= $unsigned(alu_src_a) + $unsigned(alu_src_b);
		end
		`ALU_ADD:begin
			alu_result <= $signed(alu_src_a) + $signed(alu_src_b);
		end
		`ALU_SUBU:begin
			alu_result <= $unsigned(alu_src_a) - $unsigned(alu_src_b);
		end
		`ALU_SUB:begin
			alu_result <= $signed(alu_src_a) - $signed(alu_src_b);
		end
		`ALU_AND:begin
			alu_result <= alu_src_a & alu_src_b;
		end
		`ALU_OR:begin
			alu_result <= alu_src_a | alu_src_b;
		end
		`ALU_NOR:begin
			alu_result <= ~ (alu_src_a | alu_src_b);
		end
		`ALU_XOR:begin
			alu_result <= ((~ alu_src_a) & alu_src_b) | (alu_src_a * (~ alu_src_b));
		end
		`ALU_SLT:begin
			if($signed(alu_src_a) < $signed(alu_src_b))begin
				alu_result <= 1;
			end
            else begin
                alu_result <= 0;
            end
		end
		`ALU_SLTU:begin
			if($unsigned(alu_src_a) < $unsigned(alu_src_b))begin
				alu_result <= 1;
			end
            else begin
                alu_result <= 0;
            end
		end
		`ALU_EQL:begin
            if(alu_src_a == alu_src_b)begin
                alu_result <= 1;
            end
            else begin
                alu_result <= 0;
            end
		end
		`ALU_BNE:begin
            if(alu_src_a != alu_src_b)begin
                alu_result <= 1;
            end
            else begin
                alu_result <= 0;
            end
		end
		`ALU_SLL:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result << 1;
		  end
		end
		`ALU_SRL:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result >> 1;
		  end
		end
		`ALU_SRA:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result >> 1;
		    alu_result[31] = alu_result[30];
		  end
		end
	endcase
end

endmodule