library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        clk             : in     vl_logic;
        data_address    : in     vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        dm_r            : in     vl_logic;
        dm_w            : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end DM;
