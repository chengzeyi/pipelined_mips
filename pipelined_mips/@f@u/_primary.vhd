library verilog;
use verilog.vl_types.all;
entity FU is
    port(
        id_ex_alu_src_a_sel: in     vl_logic;
        id_ex_alu_src_b_sel: in     vl_logic;
        ex_mem_gpr_w_sel: in     vl_logic_vector(1 downto 0);
        mem_wb_gpr_w_sel: in     vl_logic_vector(1 downto 0);
        id_ex_rs        : in     vl_logic_vector(31 downto 0);
        id_ex_rt        : in     vl_logic_vector(31 downto 0);
        id_ex_instruction: in     vl_logic_vector(31 downto 0);
        ex_mem_instruction: in     vl_logic_vector(31 downto 0);
        mem_wb_instruction: in     vl_logic_vector(31 downto 0);
        id_ex_ext_out   : in     vl_logic_vector(31 downto 0);
        ex_mem_alu_result: in     vl_logic_vector(31 downto 0);
        wb_m2r_data     : in     vl_logic_vector(31 downto 0);
        alu_src_a       : out    vl_logic_vector(31 downto 0);
        alu_src_b       : out    vl_logic_vector(31 downto 0);
        dm_w_data       : out    vl_logic_vector(31 downto 0);
        jr_src          : out    vl_logic_vector(31 downto 0)
    );
end FU;
