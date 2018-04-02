library verilog;
use verilog.vl_types.all;
entity BCTRL is
    port(
        alu_result      : in     vl_logic_vector(31 downto 0);
        ext_out         : in     vl_logic_vector(31 downto 0);
        pc_plus4        : in     vl_logic_vector(31 downto 0);
        bt              : out    vl_logic_vector(31 downto 0)
    );
end BCTRL;
