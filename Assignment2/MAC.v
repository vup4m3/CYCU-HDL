module MAC(
clk,
rst,
st_p,
A_in,

out_st,
dout
);

input clk, rst, st_p;
input [7:0] A_in;
output reg [15:0] dout;
output reg out_st;

wire [4:0] cnt_out; // counter output
wire signed [7:0] rom_out, A_out;
reg signed [15:0] mlti_out;
reg signed [19:0] add_out;
wire signed [19:0] tmp_out;

Counter cnt(.clk(clk), .rst(rst), .up_st(st_p), .dout(cnt_out));
Rom rom(.clk(clk), .count(cnt_out), .dout(rom_out));
Eight_Bit_Reg ebg(.clk(clk), .din(A_in), .dout(A_out));
Twenty_Bit_Reg tbg(.clk(clk), .din(add_out), .count(cnt_out), .dout(tmp_out));

always @* begin // multiply
  if (cnt_out > 19)
    mlti_out <= 16'b0;
  else if (cnt_out > 3)
	mlti_out <= A_out*rom_out;
  else
	mlti_out <= 16'b0;
end

always @* begin // add
  if (cnt_out > 3)
	add_out <= mlti_out+tmp_out;
  else
    add_out <= 20'b0;
end

always @(posedge clk) begin // output
  if(cnt_out > 20)
    dout <= tmp_out[19:4];
end

always @(posedge clk) begin // output
  if (cnt_out < 20)
    out_st = 0;
  else if (cnt_out == 20)
    out_st = 1;
  else if(cnt_out > 20)
	out_st <= 0;
end

endmodule // MAC