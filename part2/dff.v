module dff(
output reg q,
input din,clk,rst);

always@(posedge clk or posedge rst)
begin
if(rst)
q<=0;
else
q<=din;
end
endmodule
