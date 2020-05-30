module final_humming(
input 				clk,
input					reset,
input					data_rdy,
input		[ 15:0]	input_data,
input		[256:0]	key,
input		[ 15:0]	NONCE0,
input		[ 15:0]	NONCE1,
input		[ 15:0]	NONCE2,
input		[ 15:0]	NONCE3,
output	[ 15:0]	enc_data_final,
output	[ 15:0]	dec_data_final,
output				enc_complete,
output				dec_complete);

reg [15:0] data_in;

wire [15:0] encRS1;
wire [15:0] encRS2;
wire [15:0] encRS3;
wire [15:0] encRS4;
wire [15:0] decRS1;
wire [15:0] decRS2;
wire [15:0] decRS3;
wire [15:0] decRS4;

wire [15:0] enc1_out;
wire [15:0] enc2_out;
wire [15:0] enc3_out;
wire [15:0] dec3_in;
wire [15:0] dec3_out;
wire [15:0] dec2_out;
wire [15:0] dec1_in;
wire rs_rdy;

wire [15:0]	enc_data_out;
wire [15:0]	dec_data_in;
wire [15:0]	dec_data_out;

// Вывод результатов работы модуля после шифрования
assign enc_data_final=(enc_complete)?enc_data_out:16'h0;
assign dec_data_final=(dec_complete)?dec_data_out:16'h0;
assign dec_data_in = enc_data_out;

// Выполнение шифрования блока данных
encryption inst_enc(	data_in,
							key,
							encRS1,
							encRS2,
							encRS3,
							encRS4,
							enc1_out,
							enc2_out,
							enc3_out,
							enc_data_out);

// Выполнение дешифрования блока данных
decryption inst_dec(	dec_data_in,
							key,
							decRS1,
							decRS2,
							decRS3,
							decRS4,
							dec3_in,
							dec3_out,
							dec2_out,
							dec1_in,
							dec_data_out);

// Блок инициализации и обновления регистров состояния
initial_process inst_init(	clk,
									reset,
									data_rdy,
									NONCE0,
									NONCE1,
									NONCE2,
									NONCE3,
									enc1_out,
									enc2_out,
									enc3_out,
									enc_data_out,
									dec3_in,
									dec3_out,
									dec2_out,
									dec1_in,				
									encRS1,
									encRS2,
									encRS3,
									encRS4,
									decRS1,
									decRS2,
									decRS3,
									decRS4,
									enc_complete,
									dec_complete,
									rs_rdy);

// Управление потоком входных данных
always @(posedge clk)
begin
	if(~reset)
	begin
		// В процессе инициализации 
		data_in <= NONCE0 + NONCE2;
	end
	else if(rs_rdy)
	begin
		// В процессе шифрования
		data_in <= input_data;
	end
end

endmodule
