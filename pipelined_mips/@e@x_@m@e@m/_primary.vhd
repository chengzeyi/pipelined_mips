library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        id_ex_instruction: in     vl_logic_vector(31 downto 0);
        id_ex_pc_plus4  : in     vl_logic_vector(31 downto 0);
        id_ex_gpr_w_sel : in     vl_logic_vector(1 downto 0);
        id_ex_m2r_sel   : in     vl_logic_vector(1 downto 0);
        id_ex_dm_r      : in     vl_logic;
        id_ex_dm_w      : in     vl_logic;
        alu_result      : in     vl_logic_vector(31 downto 0);
        dm_w_data       : in     vl_logic_vector(31 downto 0);
        ex_mem_instruction: out    vl_logic_vector(31 downto 0);
        ex_mem_pc_plus4 : out    vl_logic_vector(31 downto 0);
        ex_mem_alu_result: out    vl_logic_vector(31 downto 0);
        ex_mem_dm_w_data: out    vl_logic_vector(31 downto 0);
        ex_mem_gpr_w_sel: out    vl_logic_vector(1 downto 0);
        ex_mem_m2r_sel  : out    vl_logic_vector(1 downto 0);
        ex_mem_dm_r     : out    vl_logic;
        ex_mem_dm_w     : out    vl_logic
    );
end EX_MEM;
