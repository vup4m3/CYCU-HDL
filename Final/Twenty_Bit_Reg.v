module Twenty_Bit_Reg(
clk,
din,
en,
dout
);

input clk;
input en;
input [19:0]din;
output reg [19:0]dout;

reg [19:0]temp;

always @(posedge clk) begin
  if (!en)
	dout <= 20'b0;
  else
	dout <= din;
end

endmodule 