library verilog;
use verilog.vl_types.all;
entity HU is
    port(
        id_ex_dm_r      : in     vl_logic;
        id_ex_instruction: in     vl_logic_vector(31 downto 0);
        if_id_instruction: in     vl_logic_vector(31 downto 0);
        id_ex_pc_src_sel: in     vl_logic_vector(2 downto 0);
        ex_alu_result   : in     vl_logic_vector(31 downto 0);
        pc_write        : out    vl_logic;
        if_id_write     : out    vl_logic;
        if_id_flush     : out    vl_logic;
        id_ex_flush     : out    vl_logic
    );
end HU;
