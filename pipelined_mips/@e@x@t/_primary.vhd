library verilog;
use verilog.vl_types.all;
entity EXT is
    port(
        if_id_instruction: in     vl_logic_vector(31 downto 0);
        ext_op          : in     vl_logic_vector(1 downto 0);
        ext_out         : out    vl_logic_vector(31 downto 0)
    );
end EXT;
