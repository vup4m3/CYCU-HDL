library verilog;
use verilog.vl_types.all;
entity MAC is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        mac_en          : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0);
        out_addr        : out    vl_logic_vector(2 downto 0)
    );
end MAC;
