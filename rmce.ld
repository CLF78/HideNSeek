SECTIONS {
	/* Common Classes and Functions */
	Racedata = 0x809B8F68;
	Raceinfo = 0x809B8F70;
	PlayerHolder = 0x809BD110;
	MenuData = 0x809BD508;
	RKNetController = 0x809BD918;
	ItemHolder = 0x809BEE20;
	MusicHandler = 0x809BDBB8;
	RKNetSelectHandler = 0x809BD930;

	NETSHA1Init = 0x801D2454;
	NETSHA1Update = 0x801D24A4;
	NETSHA1GetDigest = 0x801D2558;

	UtilRandomSeed = 0x800F2E28;
	UtilRandint = 0x800F2E40;
	RandomNextLimited = 0x8054F5AC;

	/* Codehandler Hooks */
	VIHook = 0x801BAA80;
	KPADHook = 0x80197A08;
	GXDrawHook = 0x8016EACC;
	GXFlushHook = 0x8016E60C;
	OSSleepHook = 0x801AAAF4;
	AXNextFrameHook = 0x80126500;

	/* Payload Hook */
	RelHook = 0x801A6C90;

	/* Base Functions */
	DVDOpen = 0x8015E21C;
	DVDReadPrio = 0x8015E794;
	DVDClose = 0x8015E4C8;
	sprintf = 0x80010ECC;
	swprintf = 0x80016CB4;
	OSFatal = 0x801A4E24;
	CalcCRC32 = 0x801D1C00;
	SCGetLanguage = 0x801B1C6C;

	/* Exception Handler */
	ShowExceptions = 0x802A3084;
	ExcDispInfo = 0x802A3090;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED7C8;
	WiimmfiPatch2 = 0x800ECA0C;
	WiimmfiPatch3 = 0x800EE300;
	WiimmfiPatch4 = 0x801D4E5C;

	LoginRegion = 0x80380C50;

	WiimmfiVersionString = 0x80271D14;
	NaswiiURL = 0x802760C4;
	NaswiiURL2 = 0x802760EC;
	NaswiiURL3 = 0x8027616C;
	NaswiiURL4 = 0x80276110;
	AvailableURL = 0x80276A28;
	GPCMURL = 0x80277198;
	GPSPURL = 0x80277BB0;
	MasterURL = 0x80278D51;
	NatnegURL = 0x8027996B;
	NatnegURL2 = 0x80279987;
	NatnegURL3 = 0x802799A3;
	MSURL = 0x80279AF3;
	GSURL = 0x80279B77;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x80659EE4;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x80091234;

	/* Battle Arena Fixes */
	BattleSpawnFixHook = 0x805317BC;
	BattleCCFixHook = 0x80571880;
	BattleCCFix2 = 0x80571884;

	/* Disable 5 Minute Limit */
	No5LimitHook = 0x80539E70;
	No5LimitHook2 = 0x80539EC0;
	No5LimitHook3 = 0x80539F08;

	/* Disable 5:56 DC */
	No556DC = 0x80539F3C;

	/* Disable HUD */
	DecrementScreenElements = 0x805DDB7C;
	DisablePosition = 0x808362EC;
	DisableLap = 0x80836364;
	DisableMap = 0x80836700;

	/* Disable Laps */
	NoLaps = 0x8052FEA4;

	/* Disable Star Power Music */
	NoStarMusic = 0x80708588;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806F59BC;

	/* Disable Track Music */
	NoMusicHook = 0x8009126C;

	/* Disable Wheelie */
	DisableWheelieHook = 0x80581F94;

	/* Enable Score */
	EnableScore = 0x80836BD8;
	UpdateScoreHook = 0x80842A98;
	FixScoreColor = 0x807E269C;
	FixScoreSound = 0x80842ADC;

	/* Finish Stuff */
	FinishPos = 0x805309B0;
	FinishPosFix = 0x8053A184;
	FinishPoints = 0x8052A0F0;

	/* Force CC */
	ForceCCHook = 0x806594C8;

	/* Force Teams On */
	FixResults = 0x8064D100;
	ForceTeams = 0x8052B9E0;
	ResetSeeker = 0x8052B92C;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x8061C20A;
	FroomRaceCount2 = 0x8064D462;

	/* GeoHit Patcher */
	GeoHitHook = 0x8081695C;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x8061514B;
	AutoFriendsMenu2 = 0x8061A302;
	AutoFriendsMenu3 = 0x8061A206;

	/* Increase Visual Distance */
	DrawDistance = 0x8088DBE0;

	/* Infinite Star */
	InfiniteStarHook = 0x80572EC4;
	InfiniteStarHook2 = 0x80579BA4;
	StarFunc = 0x807A860C;

	/* Instant Respawn */
	InstantRespawn1 = 0x8056EFD8;
	InstantRespawn2 = 0x805733C4;

	/* Invisibility */
	InvisibilityHook = 0x80653AAC;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8056AA1C;
	ItemHitRemoteHook = 0x8065EBCC;
	DisconnectPlayer = 0x8052F23C;
	PlayerDCHook = 0x80654710;

	/* Item Mod */
	ItemModHook = 0x807AB700;
	ItemRouletteHook = 0x807AB784;
	ItemRouletteHook2 = 0x807AB9C8;
	NoSpecialItems = 0x80790FB0;

	/* License Unlocker */
	LicenseUnlocker = 0x80544438;

	/* Message Editor */
	MessageEditorHook = 0x805C12A4;
	MessageEditorHook2 = 0x805C1238;
	MessageEditorHook3 = 0x80843288;
	MessageEditorHook4 = 0x80843300;
	MessageFunc = 0x805D840C;

	/* Music Patches */
	BattleCountdown = 0x8070EC28;
	JingleFunc = 0x8070A020;
	SomeJingleThing = 0x809BDC10;
	TimerFlash = 0x807ED7F4;

	/* Mute Characters */
	MuteCharsHook = 0x80700BC8;
	MuteCharsHook2 = 0x8070E764;
	MuteCharsHook3 = 0x80700BCC;

	/* No Clip */
	NoClipHook = 0x8056AA1C;

	/* No Disconnect */
	NoDisconnect1 = 0x8051CF94;
	NoDisconnect2 = 0x80539A30;
	NoDisconnect3 = 0x80539B78;
	NoDisconnect4 = 0x80539BE8;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807AB617;

	/* Reversed Timer */
	TimerManagerHook = 0x80531134;

	/* Room Message Handler */
	HostFlagsHook = 0x806569E8;
	GuestFlagsHook = 0x80656AE8;
	FlagResetHook = 0x800D1A10;

	/* Screen Edits */
	ScreenLoadHook = 0x805FD978;
	CupScreenPatchHook = 0x808D3774;
	BattleCupScreenPatchHook = 0x808D60B4;
	ScreenDSIFix1Hook = 0x8081F84C;
	ScreenDSIFix2Hook = 0x808507B4;
	ScreenDSIFix3Hook = 0x808527F8;
	TrackVoteFix = 0x80612F1E;
	TrackVoteFix2 = 0x80612CB6;
	TrackVoteFix3 = 0x80659FF7;
	TrackVoteFix4 = 0x8065A03F;
	TrackVoteFix5 = 0x80612CB0;
	createScreen = 0x805F1E54;
	switchScreen = 0x8081F828;

	/* Seeker Picker */
	HNSDataHook = 0x8052BA60;
	HNSDataHook2 = 0x8052D5D8;

	/* Spectator Mode */
	SpectatorModeHook = 0x805971F8;
	
	/* Starting Time Modifier */
	TimerInit = 0x80530D9C;
	TimerInit2 = 0x80530D48;

	/* Tag Distance Modifier */
	TagDistanceHook = 0x807E586C;
	TagDistanceHook2 = 0x807E7ABC;
	TagShowHook = 0x807E6620;
	TagFunc = 0x807E5A1C;
}
