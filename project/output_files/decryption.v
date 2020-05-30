// В данном модуле происходит полное дешифрование блока данных

module decryption(
input		[ 15:0]	datain,
input		[255:0]	key,
input		[ 15:0]	rs1,
input		[ 15:0]	rs2,
input		[ 15:0]	rs3,
input		[ 15:0]	rs4,
output	[ 15:0]	dec3_in,
output	[ 15:0]	dec3_out,
output	[ 15:0]	dec2_out,
output	[ 15:0]	dec1_in,
output	[ 15:0]	dataout);


wire	[15:0] dec4_out;
wire	[15:0] dec2_in;
wire	[15:0] dec1_out;

// Наложение значений регистров внутреннего состояния
assign dec3_in = dec4_out - rs4;
assign dec2_in = dec3_out - rs3;
assign dec1_in = dec2_out - rs2;

// Выполнение шифрования Dk
decryption_function inst4 (datain,  key[255:192], dec4_out);
decryption_function inst3 (dec3_in, key[191:128], dec3_out);
decryption_function inst2 (dec2_in, key[127:64 ], dec2_out);
decryption_function inst1 (dec1_in, key[ 63:0  ], dec1_out);

assign dataout = dec1_out - rs1;

endmodule
