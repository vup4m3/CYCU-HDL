module Rom(
clk,
count,
dout
);

input clk;
input [4:0]count; // 5-bit counter
output reg [7:0]dout;

reg [7:0]rom_data;

always @(count) begin
  case (count)
    5'd3: rom_data <= -12;
    5'd4: rom_data <= -53;
    5'd5: rom_data <= 88;
    5'd6: rom_data <= -20;
    5'd7: rom_data <= 11;
    5'd8: rom_data <= -82;
    5'd9: rom_data <= 100;
    5'd10: rom_data <= -91;
    5'd11: rom_data <= 31;
    5'd12: rom_data <= 118;
    5'd13: rom_data <= -46;
    5'd14: rom_data <= 75;
    5'd15: rom_data <= -67;
    5'd16: rom_data <= -105;
    5'd17: rom_data <= 20;
    5'd18: rom_data <= 97;
  endcase
end

always @(posedge clk) begin
  dout <= rom_data;
end

endmodule // ROM