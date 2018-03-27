`include "ctrl_encode_def.v"

module GPR(clk, instruction, gpr_w_sel, gpr_w_data, reg_rs, reg_rt);

input clk;
input [31:0] instruction;
input [1:0] gpr_w_sel;
input [31:0] gpr_w_data;
output reg[31:0] reg_rs;
output reg[31:0] reg_rs;

reg [31:0] gpr[31:0];
wire [4:0] rs_sel;
wire [4:0] rt_sel;
wire [4:0] rd_sel;

assign rs_sel = instruction[25:21];
assign rt_sel = instruction[20:16];
assign rd_sel = instruction[15:11];

always@(posedge clk)begin
	if(gpr_w_sel == `GPR_RD)begin
		gpr[rd_sel] <= gpr_w_data;
        $display("R[%4X]=%8X", rd_sel, gpr[rd_sel]);
    end
    else if(gpr_w_sel == `GPR_RT)begin
		gpr[rt_sel] <= gpr_w_data;
        $display("R[%4X]=%8X", rt_sel, gpr[rt_sel]);
    end
    else if(gpr_w_sel == `GPR_RA)begin
        gpr[31] <= gpr_w_data;
        $display("R[%4X]=%8X", 31, gpr[31]);
    end
		$display("R[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", 0, gpr[1], gpr[2], gpr[3], gpr[4], gpr[5], gpr[6], gpr[7]);
		$display("R[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[8], gpr[9], gpr[10], gpr[11], gpr[12], gpr[13], gpr[14], gpr[15]);
		$display("R[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[16], gpr[17], gpr[18], gpr[19], gpr[20], gpr[21], gpr[22], gpr[23]);
		$display("R[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[24], gpr[25], gpr[26], gpr[27], gpr[28], gpr[29], gpr[30], gpr[31]);
end

assign reg_rs = (rs_sel == 0)? 0 : gpr[rs_sel];
assign reg_rt = (rt_sel == 0)? 0 : gpr[rt_sel];

endmodule