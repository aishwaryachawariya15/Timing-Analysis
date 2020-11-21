


module test(input a,b,clk,rst,output op);

wire w,x,y,z;

assign w=~a;
dff d1(x,w,clk,rst);
assign y=x&b;
dff d2(z,y,clk,rst);
assign op=z&b;



endmodule
