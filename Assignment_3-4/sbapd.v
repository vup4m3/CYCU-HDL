module Sbapd(
    input SPI_en,
    input SPI_clk,
    input [23:0]SPI_wdata,
    input aluop_st,
    input rst,
    input clk
);

wire source_cap_en, alu_en, alu_out_en;
wire [23:0] spi_out, src_out;
wire [7:0]a, b, alu_data_out;
wire [2:0] sel, addr;
wire [7:0] ans0;

assign a = src_out[15:8];
assign b = src_out[7:0];
assign sel = src_out[18:16];
assign addr = src_out[21:19];

Spi_Ctrl spi_ctrl(.spi_en(SPI_en), .spi_clk(SPI_clk), .spi_wdata(SPI_wdata), .aluop_st(aluop_st), .rst(rst), .spi_out(spi_out), .alu_en(alu_en), .cap_en(source_cap_en));
Source_Reg source_reg(.clk(clk), .wdata(spi_out), .cap_en(source_cap_en), .out_data(src_out) );
ALU alu(.clk(clk), .a(a), .b(b), .sel(sel), .alu_en(alu_en), .out(alu_data_out), .out_en(alu_out_en));
Destination_Reg dest_reg(.cap_en(alu_out_en), .wdata(alu_data_out), .addr(addr), .clk(clk), .reg_0(ans0), .reg_1(ans0), .reg_2(ans0), .reg_3(ans0) , .reg_4(ans0), .reg_5(ans0), .reg_6(ans0) , .reg_7(ans0));

endmodule // Sbapd