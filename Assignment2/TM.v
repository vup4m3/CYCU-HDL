`timescale 1ns/1ns
module TM;

reg clk, rst, st_p;
reg signed [7:0] A_in;
wire out_st;
wire signed [15:0] dout;

MAC mac(.clk(clk), .rst(rst), .st_p(st_p), .A_in(A_in), .out_st(out_st),.dout(dout));

		
initial clk = 1'b0;

always #5 clk = ~clk;

initial begin
  rst = 1'b0;
  st_p = 1'b0;
  
  #5
  rst = 1'b1;
  st_p = 1'b1;
  #30
  A_in = 31;
  #10
  A_in = 118;
  #10
  A_in = -46;
  #10
  A_in = 75;
  #10
  A_in = -67;
  #10
  A_in = -105;
  #10
  A_in = 20;
  #10
  A_in = 97;
  #10
  A_in = -12;
  #10
  A_in = -53;
  #10
  A_in = 88;
  #10
  A_in = -20;
  #10
  A_in = 11;
  #10
  A_in = -82;
  #10
  A_in = 100;
  #10
  A_in = -91;
  
  #300
  $stop;
end

endmodule // TM