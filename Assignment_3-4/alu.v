module ALU(
  input clk,
  input [2:0] addr,
  input [7:0]a,
  input [7:0]b,
  input [2:0]sel,
  input alu_en,
  output [2:0] addr,
  output [7:0] out,
  output out_en
);

reg [11:0] tmp;
reg [11:0] u_shift_a, shift_a, u_shift_b, shift_b, shift_a6;


always @(posedge clk) begin
  if (alu_en == 0)
    ;
  else if (sel == 0) begin
    tmp <= {a[7], a} + {b[7], b};
    out <= tmp[8:1];
  end
  else if (sel == 1) begin
    tmp <= {a[7], a} + ~({b[7], b}) + 1;
    out <= tmp[8:1];
    end
  else if (sel == 2)
    out <= a & b;
  else if (sel == 3)
    out <= a | b;
  else if (sel == 4)
    out <= a ^ b;
  else if (sel == 5) begin
    u_shift_a <= a >> 1;
    shift_a <= {{4{a[7]}}, u_shift_a[6:0]} ;
    u_shift_b <= b << 2;
    shift_b <= { b[7], u_shift_b[9:0] };
    tmp <= shift_a + shift_b;
    out <= tmp[10:3];
  end
  else if (sel == 6) begin
    temp <= a * 6;
    shift_b <= b >> 2;
    temp <= temp + b;
    out <= tmp[10:3];
  end
    
end

endmodule // ALU