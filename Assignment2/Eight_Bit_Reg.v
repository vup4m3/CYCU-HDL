module Eight_Bit_Reg(
clk,
din,
dout
);

input clk;
input [7:0]din;
output reg [7:0]dout;
  
reg [7:0]temp;

always @(posedge clk) begin
  temp <= din;
end

always @(posedge clk) begin
  dout <= temp;
end

endmodule // Eight_Bit_Rag