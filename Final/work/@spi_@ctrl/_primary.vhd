library verilog;
use verilog.vl_types.all;
entity Spi_Ctrl is
    port(
        spi_en          : in     vl_logic;
        spi_clk         : in     vl_logic;
        spi_wdata       : in     vl_logic_vector(23 downto 0);
        aluop_st        : in     vl_logic;
        macop_st        : in     vl_logic;
        rst             : in     vl_logic;
        spi_out         : out    vl_logic_vector(23 downto 0);
        alu_en          : out    vl_logic;
        mac_en          : out    vl_logic;
        cap_en          : out    vl_logic
    );
end Spi_Ctrl;
