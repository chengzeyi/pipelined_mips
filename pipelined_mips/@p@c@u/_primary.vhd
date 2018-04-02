library verilog;
use verilog.vl_types.all;
entity PCU is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        pc_src          : in     vl_logic_vector(31 downto 0);
        pc_write        : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0)
    );
end PCU;
