module linear_transform_enc(
input	wire	[15:0] m,
output		[15:0] L);

wire [15:0] m6, m10;

assign m6 [15:0] = {m[9:0],m[15:10]};
assign m10[15:0] = {m[5:0],m[15:6]};

assign L = m ^ m6 ^ m10;

endmodule

module linear_transform_dec(
input	wire	[15:0] m,
output		[15:0] L);

wire [15:0] m2, m4, m12, m14;

assign m2 [15:0] = {m[13:0],m[15:14]};
assign m4 [15:0] = {m[11:0],m[15:12]};
assign m12 [15:0] = {m[3:0],m[15:4]};
assign m14 [15:0] = {m[1:0],m[15:2]};

assign L = m ^ m2 ^ m4 ^ m12 ^ m14;

endmodule
