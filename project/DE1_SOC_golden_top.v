// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Thu Jul 11 11:26:45 2013
// ============================================================================

`define ENABLE_CLOCK
`define ENABLE_HEX
`define ENABLE_KEY
`define ENABLE_LEDR
`define ENABLE_SW

module DE1_SOC_golden_top(

      /* Enables CLOCK */
	`ifdef ENABLE_CLOCK
      input              CLOCK_50,
	`endif

      /* Enables GPIO - 3.3V */
	`ifdef ENABLE_GPIO
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
	`endif

      /* Enables HEX - 3.3V */
	`ifdef ENABLE_HEX
      output      [6:0]  HEX0,
      output      [6:0]  HEX1,
      output      [6:0]  HEX2,
      output      [6:0]  HEX3,
      output      [6:0]  HEX4,
      output      [6:0]  HEX5,
	`endif

      /* Enables KEY - 3.3V */
	`ifdef ENABLE_KEY
      input       [3:0]  KEY,
	`endif

      /* Enables LEDR - 3.3V */
	`ifdef ENABLE_LEDR
      output      [9:0]  LEDR,
	`endif

      /* Enables SW - 3.3V */
	`ifdef ENABLE_SW
      input       [9:0]  SW
	`endif
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire	[ 15:0]	planetext;
wire	[ 15:0]	encrypt;
wire	[ 15:0]	decrypt;
wire	[255:0]	key;
wire	[ 15:0]	NONCE1;
wire	[ 15:0]	NONCE2;
wire	[ 15:0]	NONCE3;
wire	[ 15:0]	NONCE4;
wire	[ 15:0]	enc1_out;
wire	[ 15:0]	enc2_out;
wire	[ 15:0]	enc3_out;
wire				data_rdy;
reg 	[ 15:0] 	text;

//=======================================================
//  Structural coding
//=======================================================

assign planetext = 16'hA52E;
assign key = 256'h35FB86AFF0F5291D35FBB6A3F4F5285D35FB86AF90F5251D35FB86AFF0F5291D;
assign NONCE1 = 16'hA62F;
assign NONCE2 = 16'hB410;
assign NONCE3 = 16'hD9B2;
assign NONCE4 = 16'hF7F1;

assign data_rdy = SW[2];
always @(posedge CLOCK_50)
	case({SW[1],SW[0]})
	'b00: text = planetext;
	'b01: text = encrypt;
	'b10: text = decrypt;
	'b11: text = 16'h0000;
	endcase

final_humming humming_inst(CLOCK_50, KEY[0], data_rdy, planetext, key, NONCE1, NONCE2, 
 NONCE3, NONCE4, encrypt, decrypt, LEDR[0],LEDR[1]);
 
hex_display hx1(text[ 3:0 ], HEX0[6:0]);
hex_display hx2(text[ 7:4 ], HEX1[6:0]);
hex_display hx3(text[11:8 ], HEX2[6:0]);
hex_display hx4(text[15:12], HEX3[6:0]);

endmodule
