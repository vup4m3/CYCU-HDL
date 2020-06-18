library verilog;
use verilog.vl_types.all;
entity Twenty_Bit_Reg is
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic_vector(19 downto 0);
        en              : in     vl_logic;
        dout            : out    vl_logic_vector(19 downto 0)
    );
end Twenty_Bit_Reg;
