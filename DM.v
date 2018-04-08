`include "ctrl_encode_def.v"

module DM(clk, data_address, data_in, dm_r, dm_w, data_out);

input clk;
input [31:0] data_address;
input [31:0] data_in;
input dm_r;
input dm_w;
output reg[31:0] data_out;

reg	[31:0]		data_mem[1023:0];

always@(clk)begin
    if(clk && dm_w == `DM_W_ON)begin
        data_mem[data_address[6:2]] <= data_in;
        $display("DM_WRITE: DM[%8X]=%8X", data_address, data_in);
    end
    if((!clk) && dm_r == `DM_R_ON)begin
        data_out <= data_mem[data_address[6:2]];
    end
end

endmodule