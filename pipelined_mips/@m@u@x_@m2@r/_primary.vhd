library verilog;
use verilog.vl_types.all;
entity MUX_M2R is
    port(
        m2r_sel         : in     vl_logic_vector(1 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0);
        dm_out          : in     vl_logic_vector(31 downto 0);
        pc_plus4        : in     vl_logic_vector(31 downto 0);
        m2r_data        : out    vl_logic_vector(31 downto 0)
    );
end MUX_M2R;
