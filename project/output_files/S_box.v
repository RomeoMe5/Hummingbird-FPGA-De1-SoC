//В данном файле представленно множество модулей табличной замены S_box
//enc - табличная замена используемая в процессе шифрования
//dec - табличная замена используемая в процессе дешифрования
 
module S1_box_enc(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h8;
   'h1: out = 'h6;
   'h2: out = 'h5;
   'h3: out = 'hf;
   'h4: out = 'h1;
   'h5: out = 'hc;
   'h6: out = 'ha;
   'h7: out = 'h9;
   'h8: out = 'he;
   'h9: out = 'hb;
   'ha: out = 'h2;
   'hb: out = 'h4;
   'hc: out = 'h7;
   'hd: out = 'h0;
   'he: out = 'hd;
   'hf: out = 'h3;
	endcase

endmodule
//-------------------
module S2_box_enc(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h0;
   'h1: out = 'h7;
   'h2: out = 'he;
   'h3: out = 'h1;
   'h4: out = 'h5;
   'h5: out = 'hb;
   'h6: out = 'h8;
   'h7: out = 'h2;
   'h8: out = 'h3;
   'h9: out = 'ha;
   'ha: out = 'hd;
   'hb: out = 'h6;
   'hc: out = 'hf;
   'hd: out = 'hc;
   'he: out = 'h4;
   'hf: out = 'h9;
	endcase

endmodule
//-------------------
module S3_box_enc(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h2;
   'h1: out = 'he;
   'h2: out = 'hf;
   'h3: out = 'h5;
   'h4: out = 'hc;
   'h5: out = 'h1;
   'h6: out = 'h9;
   'h7: out = 'ha;
   'h8: out = 'hb;
   'h9: out = 'h4;
   'ha: out = 'h6;
   'hb: out = 'h8;
   'hc: out = 'h0;
   'hd: out = 'h7;
   'he: out = 'h3;
   'hf: out = 'hd;
	endcase

endmodule
//-------------------
module S4_box_enc(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h0;
   'h1: out = 'h7;
   'h2: out = 'h3;
   'h3: out = 'h4;
   'h4: out = 'hc;
   'h5: out = 'h1;
   'h6: out = 'ha;
   'h7: out = 'hf;
   'h8: out = 'hd;
   'h9: out = 'he;
   'ha: out = 'h6;
   'hb: out = 'hb;
   'hc: out = 'h2;
   'hd: out = 'h8;
   'he: out = 'h9;
   'hf: out = 'h5;
	endcase

endmodule
//-------------------
module S1_box_dec(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'hd;
   'h1: out = 'h4;
   'h2: out = 'ha;
   'h3: out = 'hf;
   'h4: out = 'hb;
   'h5: out = 'h2;
   'h6: out = 'h1;
   'h7: out = 'hc;
   'h8: out = 'h0;
   'h9: out = 'h7;
   'ha: out = 'h6;
   'hb: out = 'h9;
   'hc: out = 'h5;
   'hd: out = 'he;
   'he: out = 'h8;
   'hf: out = 'h3;
	endcase

endmodule
//-------------------
module S2_box_dec(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h0;
   'h1: out = 'h3;
   'h2: out = 'h7;
   'h3: out = 'h8;
   'h4: out = 'he;
   'h5: out = 'h4;
   'h6: out = 'hb;
   'h7: out = 'h1;
   'h8: out = 'h6;
   'h9: out = 'hf;
   'ha: out = 'h9;
   'hb: out = 'h5;
   'hc: out = 'hd;
   'hd: out = 'ha;
   'he: out = 'h2;
   'hf: out = 'hc;
	endcase

endmodule
//-------------------
module S3_box_dec(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'hc;
   'h1: out = 'h5;
   'h2: out = 'h0;
   'h3: out = 'he;
   'h4: out = 'h9;
   'h5: out = 'h3;
   'h6: out = 'ha;
   'h7: out = 'hd;
   'h8: out = 'hb;
   'h9: out = 'h6;
   'ha: out = 'h7;
   'hb: out = 'h8;
   'hc: out = 'h4;
   'hd: out = 'hf;
   'he: out = 'h1;
   'hf: out = 'h2;
	endcase

endmodule
//-------------------
module S4_box_dec(

	input			[3:0]	in,
	output reg	[3:0]	out
);

always @*
	case(in)
	'h0: out = 'h0;
   'h1: out = 'h5;
   'h2: out = 'hc;
   'h3: out = 'h2;
   'h4: out = 'h3;
   'h5: out = 'hf;
   'h6: out = 'ha;
   'h7: out = 'h1;
   'h8: out = 'hd;
   'h9: out = 'he;
   'ha: out = 'h6;
   'hb: out = 'hb;
   'hc: out = 'h4;
   'hd: out = 'h8;
   'he: out = 'h9;
   'hf: out = 'h7;
	endcase

endmodule
//-------------------