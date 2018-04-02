library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        ex_mem_instruction: in     vl_logic_vector(31 downto 0);
        ex_mem_pc_plus4 : in     vl_logic_vector(31 downto 0);
        ex_mem_gpr_w_sel: in     vl_logic_vector(1 downto 0);
        ex_mem_m2r_sel  : in     vl_logic_vector(1 downto 0);
        ex_mem_alu_result: in     vl_logic_vector(31 downto 0);
        dm_r_data       : in     vl_logic_vector(31 downto 0);
        mem_wb_instruction: out    vl_logic_vector(31 downto 0);
        mem_wb_pc_plus4 : out    vl_logic_vector(31 downto 0);
        mem_wb_gpr_w_sel: out    vl_logic_vector(1 downto 0);
        mem_wb_m2r_sel  : out    vl_logic_vector(1 downto 0);
        mem_wb_alu_result: out    vl_logic_vector(31 downto 0);
        mem_wb_dm_r_data: out    vl_logic_vector(31 downto 0)
    );
end MEM_WB;
