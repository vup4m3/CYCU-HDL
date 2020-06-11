library verilog;
use verilog.vl_types.all;
entity Source_Reg is
    port(
        clk             : in     vl_logic;
        wdata           : in     vl_logic_vector(23 downto 0);
        cap_en          : in     vl_logic;
        alu_en          : in     vl_logic;
        out_data        : out    vl_logic_vector(23 downto 0)
    );
end Source_Reg;
