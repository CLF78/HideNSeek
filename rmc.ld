SECTIONS {
	/* Base Functions */
	gameRegion = 0x80000003;
	_directWriteArray = 0x80005F34;
	memset = 0x80006038;

	/* HnS Per-Race Data */
	HideNSeekData = 0x800001B0;
	EndReason = 0x800001E4;
	SpectatorMode = 0x800001E5;
	CurrentSpectated = 0x800001E6;
	AmIDead = 0x800001E7;
	Have30SecondsPassed = 0x800001E8;

	/* HNS Per-GP Data */
	SeekerCount = 0x800002B0;
	IsInfection = 0x800002B1;
	PrevSeekers = 0x800002B2;
	HalfTimer = 0x800002B4;
	BtGlitch = 0x800002B5;
	AlwaysWinVote = 0x800002B6;
	AlwaysSeeker = 0x800002B7;

	/* Riivo Options */
	NoMusic = 0x80004000;
}
