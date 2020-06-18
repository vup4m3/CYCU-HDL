module ALU(
  input clk,
  input [2:0] addr,
  input [7:0]a,
  input [7:0]b,
  input [2:0]sel,
  input alu_en,
  output reg [7:0] out,
  output reg [2:0] out_addr

);

reg [11:0] tmp;
reg [11:0] u_shift_a, shift_a, u_shift_b, shift_b, shift_a6;


always @(posedge clk) begin
  if (sel == 0) begin
    tmp = {a[7], a} + {b[7], b};
    out = tmp[8:1];
  end
  else if (sel == 1) begin
    tmp = {a[7], a} + ~({b[7], b}) + 1;
    out = tmp[8:1];
    end
  else if (sel == 2)
    out = a & b;
  else if (sel == 3)
    out = a | b;
  else if (sel == 4)
    out = a ^ b;
  else if (sel == 5) begin
    u_shift_a = a >> 1;
    shift_a = {{4{a[7]}}, u_shift_a[6:0]} ;
    u_shift_b = b << 2;
    shift_b = { b[7], u_shift_b[9:0] };
    tmp = shift_a + shift_b;
    out = tmp[10:3];
  end
  else if (sel == 6) begin
    shift_a6 = {{3{a[7]}}, a} + {{3{b[7]}}, b};
    tmp = shift_a6 * 3;
    out = tmp[10:3];
  end
  else if (sel == 7) begin
    tmp = a * 6;
    shift_b = b >> 2;
    tmp = tmp + b;
    out = tmp[10:3];
  end
    
  out_addr <= addr;
end

endmodule // ALU