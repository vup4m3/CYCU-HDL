module Spi_Ctrl(
  input spi_en,
  input spi_clk,
  input [23:0]spi_wdata,
  input aluop_st,
  input rst,
  output [23:0] spi_out,
  output reg alu_en,
  output reg cap_en
);

reg [23:0] shift_reg;
reg [4:0] cnt;


always@(posedge spi_clk) begin
  if (rst == 1)
    alu_en <= 0;
  else
    alu_en <= aluop_st;
end

always@ ( negedge spi_clk ) begin
  if ( ! spi_en && cnt < 24 ) begin
    shift_reg[ cnt ] <= spi_wdata[cnt];
    cnt <= cnt+1;
  end
  else if ( cnt == 24 )
    cap_en<=1;
end

always@( negedge spi_en )begin
  cnt<=0;
  shift_reg<=0;
  cap_en<=0;
end

always@( posedge cap_en)begin
  spi_out<=shift_reg;
end

always @( posedge ) begin
  alu_en<=aluop_st;
end

endmodule // Spi_Ctrl