library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        if_id_write     : in     vl_logic;
        if_id_flush     : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        if_id_pc_plus4  : out    vl_logic_vector(31 downto 0);
        if_id_instruction: out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
