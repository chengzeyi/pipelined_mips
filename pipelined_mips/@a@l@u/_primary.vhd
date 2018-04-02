library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        alu_src_a       : in     vl_logic_vector(31 downto 0);
        alu_src_b       : in     vl_logic_vector(31 downto 0);
        alu_op          : in     vl_logic_vector(4 downto 0);
        alu_result      : out    vl_logic_vector(31 downto 0)
    );
end ALU;
