`timescale 1ns/1ns

module TM;

reg spi_en, aluop_st, macop_st;
reg [23:0] spi_wdata;
reg		clk, spi_clk , rst;

Sbapd sb( spi_en, spi_clk, spi_wdata, aluop_st, macop_st, rst, clk );

parameter   t   = 1;
parameter   th  = t*0.5;
parameter   th20 = th *20 ;
parameter   t20 = t *20 ;

always #th clk = ~clk;

always #th20 spi_clk = ~spi_clk; 

initial begin
    clk = 1;
    rst = 1;
    spi_clk=1;
    spi_en = 1;
    aluop_st = 0;
    macop_st = 0;
    #t20 rst = 0;
    #t20  spi_wdata = { 24'b000000010000000000001001 };

    spi_en = 0;
    # (25*t20)
    spi_en = 1;
     # t20

    spi_wdata = { 24'b000010011010101111111000 };
    spi_en = 0; 
    # (25*t20) 
    spi_en = 1;
    # t20

    spi_wdata = { 24'b000100001001010111111100 };
    spi_en = 0; 
    # (25*t20)
    spi_en = 1;
    # t20
    
    spi_wdata = { 24'b000110011010101011111000 };
    spi_en = 0; 
    # (25*t20) 
    spi_en = 1;
    # t20
    
    spi_wdata = { 24'b001001011010101111111000 };
    spi_en = 0; 
    # (25*t20) 
    spi_en = 1;
    # t20

    spi_wdata = { 24'b001011011110101111111000 };
    spi_en = 0; 
    # (25*t20) 
    spi_en = 1;
    # t20

    spi_wdata = { 24'b001100111110101111111000 };
    spi_en = 0; 
    # (25*t20)
    spi_en = 1;
    # t20

    spi_wdata = { 24'b001110011010001111111000 };
    spi_en = 0; 
    # (25*t20) 
    spi_en = 1;
    aluop_st = 1;
    macop_st =1;
    # (t20*2)

    $stop;


end



endmodule