library verilog;
use verilog.vl_types.all;
entity MUX_PC_SRC is
    port(
        pc_src_sel      : in     vl_logic_vector(2 downto 0);
        xadr            : in     vl_logic_vector(31 downto 0);
        illop           : in     vl_logic_vector(31 downto 0);
        jr              : in     vl_logic_vector(31 downto 0);
        jt              : in     vl_logic_vector(31 downto 0);
        bt              : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        pc_src          : out    vl_logic_vector(31 downto 0)
    );
end MUX_PC_SRC;
