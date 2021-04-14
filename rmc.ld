SECTIONS {
	/* Base Functions */
	gameRegion = 0x80000003;
	_directWriteArray = 0x80005F34;
	memset = 0x80006038;

	/* HnS Data */
	HideNSeekData = 0x800001B0;
	SeekerCount = 0x800001E4;
	IsInfection = 0x800001E5;
	PrevSeekers = 0x800001E6;
	HalfTimer = 0x800001E8;
	BtGlitch = 0x800001E9;
	AlwaysWinVote = 0x800001EA;
	AlwaysSeeker = 0x800001EB;
	EndReason = 0x800001EC;
	SpectatorMode = 0x800001ED;
	CurrentSpectated = 0x800001EE;
	AmIDead = 0x800001EF;
	Have30SecondsPassed = 0x800001F0;

	/* Riivo Options */
	NoMusic = 0x80004000;
}
