SECTIONS {
	/* Base Functions */
	_directWriteArray = 0x80005F34;
	memset = 0x80005F84;
	StartFunc = 0x808DD400;

	/* HnS Per-Race Data */
	HideNSeekData = 0x800001B0;
	SpectatorMode = 0x800001E4;
	CurrentSpectated = 0x800001E5;
	AmIDead = 0x800001E6;
	Have30SecondsPassed = 0x800001E7;
	UseReplayCams = 0x800001E8;
	MusicState = 0x800001E9;
	ENPTCRC = 0x800001EC;

	/* HNS Per-GP Data */
	IsInfection = 0x800002B0;
	SeekerCount = 0x800002B1;
	PrevSeekers = 0x800002B2;
	HalfTimer = 0x800002B4;
	AlwaysSeeker = 0x800002B5;
	GlitchesAllowed = 0x800002B6;
	BtGlitch = 0x800002B7;
	AlwaysWinVote = 0x800002B8;

	/* Version */
	Version = 0x800003B0;

	/* Kill Data */
	KillData = 0x800004B0;

	/* Riivo Options */
	NoMusic = 0x80004000;
	/* (DEPRECATED) CTSupport = 0x8000400E; */
	ThirtyFPS = 0x8000400F;
}
