library verilog;
use verilog.vl_types.all;
entity CTRL is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        gpr_w_sel       : out    vl_logic_vector(1 downto 0);
        m2r_sel         : out    vl_logic_vector(1 downto 0);
        ext_op          : out    vl_logic_vector(1 downto 0);
        alu_src_a_sel   : out    vl_logic;
        alu_src_b_sel   : out    vl_logic;
        alu_op          : out    vl_logic_vector(4 downto 0);
        dm_r            : out    vl_logic;
        dm_w            : out    vl_logic;
        pc_src_sel      : out    vl_logic_vector(2 downto 0)
    );
end CTRL;
