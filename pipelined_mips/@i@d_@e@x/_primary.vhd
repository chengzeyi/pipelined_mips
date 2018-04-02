library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        id_ex_flush     : in     vl_logic;
        if_id_instruction: in     vl_logic_vector(31 downto 0);
        if_id_pc_plus4  : in     vl_logic_vector(31 downto 0);
        gpr_rs          : in     vl_logic_vector(31 downto 0);
        gpr_rt          : in     vl_logic_vector(31 downto 0);
        ext_out         : in     vl_logic_vector(31 downto 0);
        gpr_w_sel       : in     vl_logic_vector(1 downto 0);
        m2r_sel         : in     vl_logic_vector(1 downto 0);
        alu_src_a_sel   : in     vl_logic;
        alu_src_b_sel   : in     vl_logic;
        alu_op          : in     vl_logic_vector(4 downto 0);
        dm_r            : in     vl_logic;
        dm_w            : in     vl_logic;
        pc_src_sel      : in     vl_logic_vector(2 downto 0);
        id_ex_instruction: out    vl_logic_vector(31 downto 0);
        id_ex_pc_plus4  : out    vl_logic_vector(31 downto 0);
        id_ex_gpr_rs    : out    vl_logic_vector(31 downto 0);
        id_ex_gpr_rt    : out    vl_logic_vector(31 downto 0);
        id_ex_ext_out   : out    vl_logic_vector(31 downto 0);
        id_ex_gpr_w_sel : out    vl_logic_vector(1 downto 0);
        id_ex_m2r_sel   : out    vl_logic_vector(1 downto 0);
        id_ex_alu_src_a_sel: out    vl_logic;
        id_ex_alu_src_b_sel: out    vl_logic;
        id_ex_alu_op    : out    vl_logic_vector(4 downto 0);
        id_ex_dm_r      : out    vl_logic;
        id_ex_dm_w      : out    vl_logic;
        id_ex_pc_src_sel: out    vl_logic_vector(2 downto 0)
    );
end ID_EX;
