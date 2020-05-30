/* Quartus Prime Version 18.1.1 Build 646 04/11/2019 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("D:/intelFPGA_lite/18.1/Projects/VKR_Hummingbird_tr1/output_files/") File("Hummingbird.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
