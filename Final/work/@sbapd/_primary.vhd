library verilog;
use verilog.vl_types.all;
entity Sbapd is
    port(
        SPI_en          : in     vl_logic;
        SPI_clk         : in     vl_logic;
        SPI_wdata       : in     vl_logic_vector(23 downto 0);
        aluop_st        : in     vl_logic;
        macop_st        : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end Sbapd;
