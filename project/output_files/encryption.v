// В данном модуле происходит полное шифрование блока данных

module encryption(
input		[ 15:0]	datain,
input		[255:0]	key,
input		[ 15:0]	rs1,
input		[ 15:0]	rs2,
input		[ 15:0]	rs3,
input		[ 15:0]	rs4,
output	[ 15:0]	enc1_out,
output	[ 15:0]	enc2_out,
output	[ 15:0]	enc3_out,
output	[ 15:0]	dataout);

wire	[15:0] enc1_in;
wire	[15:0] enc2_in;
wire	[15:0] enc3_in;
wire	[15:0] enc4_in;
wire	[15:0] enc4_out;

// Наложение значений регистров внутреннего состояния
assign enc1_in = datain + rs1;
assign enc2_in = enc1_out + rs2;
assign enc3_in = enc2_out + rs3;
assign enc4_in = enc3_out + rs4;

// Выполнение шифрования Ek
encryption_function inst1 (enc1_in, key[ 63:0  ], enc1_out);
encryption_function inst2 (enc2_in, key[127:64 ], enc2_out);
encryption_function inst3 (enc3_in, key[191:128], enc3_out);
encryption_function inst4 (enc4_in, key[255:192], enc4_out);

assign dataout = enc4_out;

endmodule
