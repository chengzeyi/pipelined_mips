library verilog;
use verilog.vl_types.all;
entity GPR is
    port(
        clk             : in     vl_logic;
        if_id_instruction: in     vl_logic_vector(31 downto 0);
        mem_wb_instruction: in     vl_logic_vector(31 downto 0);
        gpr_w_sel       : in     vl_logic_vector(1 downto 0);
        gpr_w_data      : in     vl_logic_vector(31 downto 0);
        reg_rs          : out    vl_logic_vector(31 downto 0);
        reg_rt          : out    vl_logic_vector(31 downto 0)
    );
end GPR;
