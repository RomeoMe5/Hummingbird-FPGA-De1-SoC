module initial_process(
input 						clk,
input							reset,
input							data_rdy,
input				[15:0]	nonce0,
input				[15:0]	nonce1,
input				[15:0]	nonce2,
input				[15:0]	nonce3,
input				[15:0]	enc1_out,
input				[15:0]	enc2_out,
input				[15:0]	enc3_out,
input				[15:0]	enc_data_out,
input				[15:0]	dec3_in,
input				[15:0]	dec3_out,
input				[15:0]	dec2_out,
input				[15:0]	dec1_in,
output	reg	[15:0]	encRS1,
output	reg	[15:0]	encRS2,
output	reg	[15:0]	encRS3,
output	reg	[15:0]	encRS4,
output	reg	[15:0]	decRS1,
output	reg	[15:0]	decRS2,
output	reg	[15:0]	decRS3,
output	reg	[15:0]	decRS4,
output						encComplete,
output						decComplete,
output	reg				rs_rdy);

reg [15:0] 	LFSR;
reg [ 2:0] 	cnt;
reg			enc_complete;
reg			dec_complete;

assign encComplete = enc_complete;
assign decComplete = dec_complete;

always @(posedge clk)
begin
if(~reset)
begin
	cnt = 0;
	rs_rdy <= 0;
end
else
	case(cnt)
	'b0:	begin
				enc_complete <= 0;
				dec_complete <= 0;
				encRS1 <= nonce0;
				encRS2 <= nonce1;
				encRS3 <= nonce2;
				encRS4 <= nonce3;
				cnt <= cnt + 1;
			end
	'b1:	begin
				encRS1 <= encRS1 + enc_data_out;
				encRS2 <= enc1_out + encRS2;
				encRS3 <= enc2_out + encRS3;
				encRS4 <= enc3_out + encRS4;
				cnt <= cnt + 1;
			end
	'b10:	begin
				encRS1 <= encRS1 + enc_data_out;
				encRS2 <= enc1_out + encRS2;
				encRS3 <= enc2_out + encRS3;
				encRS4 <= enc3_out + encRS4;
				cnt <= cnt + 1;
			end
	'b11:	begin
				encRS1 <= encRS1 + enc_data_out;
				encRS2 <= enc1_out + encRS2;
				encRS3 <= enc2_out + encRS3;
				encRS4 <= enc3_out + encRS4;
				cnt <= cnt + 1;
			end
	'b100:begin
				encRS1 <= encRS1 + enc_data_out;
				encRS2 <= enc1_out + encRS2;
				encRS3 <= enc2_out + encRS3;
				encRS4 <= enc3_out + encRS4;
				cnt <= cnt + 1;
				rs_rdy	<= 1;
			end
	'b101:begin
				cnt <= cnt + data_rdy;
				LFSR <= enc_data_out | 16'h1000;
				decRS1 <= encRS1;
				decRS2 <= encRS2;
				decRS3 <= encRS3;
				decRS4 <= encRS4;
				enc_complete <= data_rdy;
				dec_complete <= data_rdy;
			end
	'b110:begin
				if(data_rdy)
				begin
				encRS1 <= encRS1 + enc3_out;
				encRS2 <= encRS2 + enc1_out + encRS4 + enc1_out + encRS1 + enc3_out;
				encRS3 <= encRS3 + enc2_out + LFSR;
				encRS4 <= encRS4 + enc1_out + encRS1 + enc3_out;
				decRS1 <= decRS1 + dec3_in;
				decRS2 <= dec2_out + decRS4 + dec1_in + decRS1 + dec3_in;
				decRS3 <= dec3_out + LFSR;
				decRS4 <= decRS4 + dec1_in + decRS1 + dec3_in;
				end
				cnt <= cnt + !data_rdy;
				enc_complete <= data_rdy;
				dec_complete <= data_rdy;
			end
	'b111:begin
				cnt <= cnt - data_rdy;
				enc_complete <= data_rdy;
				dec_complete <= data_rdy;
			end
	default: cnt <= 4'b000;
	endcase
end

endmodule
