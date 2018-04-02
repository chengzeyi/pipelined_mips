library verilog;
use verilog.vl_types.all;
entity MIPS is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end MIPS;
