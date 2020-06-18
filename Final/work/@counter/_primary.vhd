library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        up_st           : in     vl_logic;
        dout            : out    vl_logic_vector(4 downto 0)
    );
end Counter;
