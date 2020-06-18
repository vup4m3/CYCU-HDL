library verilog;
use verilog.vl_types.all;
entity Destination_Reg16 is
    port(
        cap_en          : in     vl_logic;
        wdata           : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reg_0           : out    vl_logic_vector(15 downto 0);
        reg_1           : out    vl_logic_vector(15 downto 0);
        reg_2           : out    vl_logic_vector(15 downto 0);
        reg_3           : out    vl_logic_vector(15 downto 0);
        reg_4           : out    vl_logic_vector(15 downto 0);
        reg_5           : out    vl_logic_vector(15 downto 0);
        reg_6           : out    vl_logic_vector(15 downto 0);
        reg_7           : out    vl_logic_vector(15 downto 0)
    );
end Destination_Reg16;
