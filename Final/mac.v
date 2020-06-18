module MAC(
  input clk,
  input [2:0] addr,
  input [7:0]a,
  input [7:0]b,
  input mac_en,
  output reg [7:0] out,
  output reg [2:0] out_addr
);
wire [4:0] cnt_out; // counter output
reg signed [15:0] mlti_out;
reg signed [19:0] add_out;
reg signed [19:0] tmp_out;
reg [4:0] count;

// Counter cnt(.clk(clk), .rst(rst), .up_st(mac_en), .dout(cnt_out));
// Twenty_Bit_Reg tbg(.clk(clk), .din(add_out), .count(cnt_out), .dout(tmp_out));

always @(posedge clk) begin // multiply
  if (mac_en)
	mlti_out <= a*b;
end

always @(posedge clk) begin // add
  if (mac_en)
	add_out <= mlti_out+tmp_out;
end

always @(posedge clk) begin // output
  out <= tmp_out[19:4]; 
  out_addr <= addr;
end

always @(posedge clk) begin
    if (!mac_en)
      tmp_out <= 0;
    if ( count > 0 && count < 9 )  
      tmp_out <= add_out;
end

always @(posedge clk) begin
  if (!mac_en)
    count <= 0;
  else 
    count = count + 1;
end

endmodule // MAC