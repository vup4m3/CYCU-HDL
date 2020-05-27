module Source_Reg(
  input w,
  input r,
  input clk,
  input [23:0] wdata,
  input aluop_st,
  input [2:0]addr,
  output reg [2:0]next_addr
  output cap_en
);
// [23]R, [22]C, [21:19]Addr, [18:16]Cmd, [15:8]a, [7:0]b
reg [23:0] reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_5, reg_6, reg_7;

always@(posedge clk) begin
  if (w = 1 && wdata[21:19] == 0)
    reg_0 = wdata;
  else if (w = 1 && wdata[21:19] == 1)
    reg_1 = wdata;
  else if (w = 1 && wdata[21:19] == 2)
    reg_2 = wdata;
  else if (w = 1 && wdata[21:19] == 3)
    reg_3 = wdata;
  else if (w = 1 && wdata[21:19] == 4)
    reg_4 = wdata;
  else if (w = 1 && wdata[21:19] == 5)
    reg_5 = wdata;
  else if (w = 1 && wdata[21:19] == 6)
    reg_6 = wdata;
  else if (w = 1 && wdata[21:19] == 7)
    reg_7 = wdata;
end

always@(posedge clk) begin
  if (aluop_st == 1)
    next_addr = 0;
  else if (addr == 0)
    next_addr = 1;
  else if (addr == 1)
    next_addr = 2;
  else if (addr == 2)
    next_addr = 3;
  else if (addr == 3)
    next_addr = 4;
  else if (addr == 4)
    next_addr = 5;
  else if (addr == 5)
    next_addr = 6;
  else if (addr == 6) begin
    next_addr = 7;
    capture_en = 0;
  end

end

always@(posedge clk) begin
    

end

endmodule