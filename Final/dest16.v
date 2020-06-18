module Destination_Reg16(
  input cap_en,
  input [15:0] wdata,
  input [2:0] addr,
  input clk,
  output reg [15:0] reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7
);

always @(posedge clk) begin
  if (cap_en == 0)
    ;
  else if (addr == 0)
    reg_0 = wdata;
  else if (addr == 1)
    reg_1 = wdata;
  else if (addr == 2)
    reg_2 = wdata;
  else if (addr == 3)
    reg_3 = wdata;
  else if (addr == 4)
    reg_4 = wdata;
  else if (addr == 5)
    reg_5 = wdata;
  else if (addr == 6)
    reg_6 = wdata;
  else if (addr == 7)
    reg_7 = wdata;
end

endmodule 