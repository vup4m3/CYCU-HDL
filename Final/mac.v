module MAC(
  input clk,
  input [2:0] addr,
  input [7:0]a,
  input [7:0]b,
  input mac_en,
  output reg [15:0] out,
  output reg [2:0] out_addr
);

reg signed [15:0] mlti_out;
reg signed [19:0] add_out, temp_reg;
reg signed [19:0] reg_out;
reg [4:0] count;

// Counter cnt(.clk(clk), .rst(rst), .up_st(mac_en), .dout(cnt_out));
// Twenty_Bit_Reg tbg(.clk(clk), .din(add_out), .count(cnt_out), .dout(tmp_out));

always @(posedge clk) begin // multiply
  if ( count > 9 )
    mlti_out = 0;
  else if (mac_en)
	mlti_out = a*b;
end

always @(posedge clk) begin // add
  if (count > 1)
	add_out = mlti_out+reg_out;
  else 
    add_out = 1'b0;
end

always @(posedge clk) begin
  if ( count < 1 )
   temp_reg <= 0;
  else 
   temp_reg <= add_out;
end

always @(posedge clk) begin
  reg_out <= temp_reg;
end  

always @(posedge clk) begin
  if ( count < 8 )
    out <= add_out[19:4];
  else 
    out <= out ;
end

always @(posedge clk) begin
  out_addr <= addr;
end

always @(posedge clk) begin
  if (!mac_en)
    count <= 0;
  else if ( count > 18)
    count <= count;
  else 
    count <= count + 1;
end

endmodule // MAC