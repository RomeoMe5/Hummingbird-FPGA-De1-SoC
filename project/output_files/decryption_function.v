module decryption_function(
input	wire	[15:0]	data_in,
input	wire	[63:0]	key_in,
output		[15:0]	data_out);

wire [15:0] key1_in, key2_in, key3_in, key4_in;
wire [15:0] xor1, xor2, xor3, xor4, xor5;
wire [15:0] S_box1, S_box2, S_box3, S_box4, S_box5;
wire [15:0] L_transf1, L_transf2, L_transf3, L_transf4;

assign key1_in = key_in[15:0];
assign key2_in = key_in[31:16];
assign key3_in = key_in[47:32];
assign key4_in = key_in[63:48];

assign xor1 = data_in ^ (key2_in ^ key4_in);

S1_box_dec s51 (xor1[15:12],S_box1[15:12]);
S2_box_dec s52 (xor1[11:8], S_box1[11:8]);
S3_box_dec s53 (xor1[ 7:4], S_box1[ 7:4]);
S4_box_dec s54 (xor1[ 3:0], S_box1[ 3:0]);

assign xor2 = S_box1 ^ (key1_in ^ key3_in);

linear_transform_dec lt1 (xor2, L_transf1);

S1_box_dec s41 (L_transf1[15:12],S_box2[15:12]);
S2_box_dec s42 (L_transf1[11:8], S_box2[11:8]);
S3_box_dec s43 (L_transf1[ 7:4], S_box2[ 7:4]);
S4_box_dec s44 (L_transf1[ 3:0], S_box2[ 3:0]);

assign xor3 = S_box2 ^ key4_in;

linear_transform_dec lt2 (xor3, L_transf2);

S1_box_dec s31 (L_transf2[15:12],S_box3[15:12]);
S2_box_dec s32 (L_transf2[11:8], S_box3[11:8]);
S3_box_dec s33 (L_transf2[ 7:4], S_box3[ 7:4]);
S4_box_dec s34 (L_transf2[ 3:0], S_box3[ 3:0]);

assign xor4 = S_box3 ^ key3_in;

linear_transform_dec lt3 (xor4, L_transf3);

S1_box_dec s21 (L_transf3[15:12],S_box4[15:12]);
S2_box_dec s22 (L_transf3[11:8], S_box4[11:8]);
S3_box_dec s23 (L_transf3[ 7:4], S_box4[ 7:4]);
S4_box_dec s24 (L_transf3[ 3:0], S_box4[ 3:0]);

assign xor5 = S_box4 ^ key2_in;

linear_transform_dec lt4 (xor5, L_transf4);

S1_box_dec s11 (L_transf4[15:12],S_box5[15:12]);
S2_box_dec s12 (L_transf4[11:8], S_box5[11:8]);
S3_box_dec s13 (L_transf4[ 7:4], S_box5[ 7:4]);
S4_box_dec s14 (L_transf4[ 3:0], S_box5[ 3:0]);

assign data_out = S_box5 ^ key1_in;

endmodule
