module Source_Reg(
  input clk,
  input [23:0] wdata,
  input cap_en,
  input alu_en,
  output reg [23:0] out_data
);

// [23]R, [22]C, [21:19]Addr, [18:16]Cmd, [15:8]a, [7:0]b
// reg [2:0] addr, addrtmp;
reg [3:0] cnt;
// reg hold;
reg [23:0] reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7; 

always @(posedge clk ) begin
  if (cap_en)begin
    if(wdata[21:19]==0 )reg_0<=wdata;
    else if(wdata[21:19]==1 )reg_1<=wdata;
    else if(wdata[21:19]==2 )reg_2<=wdata;
    else if(wdata[21:19]==3 )reg_3<=wdata;
    else if(wdata[21:19]==4 )reg_4<=wdata;
    else if(wdata[21:19]==5 )reg_5<=wdata;
    else if(wdata[21:19]==6 )reg_6<=wdata;
    else if(wdata[21:19]==7 )reg_7<=wdata;
  end
end

/*always @(posedge clk) begin
  addrtmp <=  wdata[21:19];
  if (cap_en)
    addr <= addrtmp;
end
*/

always @( posedge clk ) begin
  if(!alu_en) cnt<=0;
  else if( cnt<8 )begin
    if(cnt==0)out_data<=reg_0;
    else if(cnt==1)out_data<=reg_1;
    else if(cnt==2)out_data<=reg_2;
    else if(cnt==3)out_data<=reg_3;
    else if(cnt==4)out_data<=reg_4;
    else if(cnt==5)out_data<=reg_5;
    else if(cnt==6)out_data<=reg_6;
    else if(cnt==7)out_data<=reg_7;

    cnt<=cnt+1;
  end

  
  else if( cnt==8 ) cnt<=cnt;
  
end

endmodule