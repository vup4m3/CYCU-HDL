module Twenty_Bit_Reg(
clk,
din,
count,
dout
);

input clk;
input [4:0] count;
input [19:0]din;
output reg [19:0]dout;

reg [19:0]temp;

always @(posedge clk) begin
  if (count < 4)
	dout <= 20'b0;
  else
	dout <= din;
end

endmodule 