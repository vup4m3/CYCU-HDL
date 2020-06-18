module Counter (
clk,
rst, 
up_st,
dout
);

input clk, rst, up_st;
output reg [4:0] dout;
reg en, fix;

initial en = 1'b0;
initial fix = 1'b0;

always@(posedge clk or negedge rst) begin
	if (rst == 1'b0)
		dout <= 5'b0;
	else if (dout == 28)
		dout <= 5'b0;
	else if (fix == 1'b1)
		dout <= dout;
	else if (up_st == 1'b1 && en == 1'b0)
		dout <= 5'b0;
	else if (up_st == 1'b1 && en == 1'b1)
		dout <= dout+1;
	else 
		dout <= dout;
		
end

always@(posedge clk or negedge rst) begin
	if (rst == 1'b0)
		en <= 1'b0;
	else if (up_st == 1'b0)
		en <= 1'b0;
	else if (dout == 28)
		en <= 1'b0;
	else if (up_st == 1'b1)
		en <= 1'b1;
end

always@(posedge clk or negedge rst) begin
	if (rst == 1'b0)
		fix <= 1'b0;
	else if (up_st == 1'b0)
		fix <= 1'b0;
	else if (dout == 28)
		fix <= 1'b1;
end

endmodule
