SECTIONS {
	/* Common Classes and Functions */
	Racedata = 0x809ABD68;
	Raceinfo = 0x809ABD70;
	PlayerHolder = 0x809AFF38;
	MenuData = 0x809B0478;
	RKNetController = 0x809B0718;
	ItemHolder = 0x809B1C58;
	MusicHandler = 0x809B0E38;
	RKNetSelectHandler = 0x809B0740;

	NETSHA1Init = 0x801D2850;
	NETSHA1Update = 0x801D28A0;
	NETSHA1GetDigest = 0x801D2954;

	UtilRandomSeed = 0x800F2F40;
	UtilRandint = 0x800F2F58;
	RandomNextLimited = 0x80543624;

	/* Codehandler Hooks */
	VIHook = 0x801BAE7C;
	KPADHook = 0x80197E04;
	GXDrawHook = 0x8016EC08;
	GXFlushHook = 0x8016E748;
	OSSleepHook = 0x801AAEF0;
	AXNextFrameHook = 0x80126618;

	/* Payload Hook */
	RelHook = 0x801A708C;

	/* Base Functions */
	DVDOpen = 0x8015E334;
	DVDReadPrio = 0x8015E8AC;
	DVDClose = 0x8015E5E0;
	sprintf = 0x80011A94;
	swprintf = 0x8001787C;
	OSFatal = 0x801A5220;
	CalcCRC32 = 0x801D1FFC;
	SCGetLanguage = 0x801B2068;

	/* Exception Handler */
	ShowExceptions = 0x80295404;
	ExcDispInfo = 0x80295410;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED8E0;
	WiimmfiPatch2 = 0x800ECB24;
	WiimmfiPatch3 = 0x800EE418;
	WiimmfiPatch4 = 0x801D5258;

	LoginRegion = 0x80372FD0;

	WiimmfiVersionString = 0x80263E34;
	NaswiiURL = 0x802682B4;
	NaswiiURL2 = 0x802682DC;
	NaswiiURL3 = 0x8026835C;
	NaswiiURL4 = 0x80268300;
	AvailableURL = 0x80268C18;
	GPCMURL = 0x80269388;
	GPSPURL = 0x80269DA0;
	MasterURL = 0x8026AF41;
	NatnegURL = 0x8026BB5B;
	NatnegURL2 = 0x8026BB77;
	NatnegURL3 = 0x8026BB93;
	MSURL = 0x8026BCE3;
	GSURL = 0x8026BD67;

	/* 30 FPS */
	ThirtyFPSHook1 = 0x80009B44;
	ThirtyFPSHook2 = 0x800093FB;
	ThirtyFPSHook3 = 0x800091FF;
	ThirtyFPSHook4 = 0x80508FB4;
	ThirtyFPSHook5 = 0x8050935C;
	ThirtyFPSHook6 = 0x8050934B;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x80650138;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x80091334;

	/* Battle Arena Fixes */
	BattleSpawnFixHook = 0x8052435C;
	BattleCCFixHook = 0x8056613C;
	BattleCCFix2 = 0x80566140;

	/* Disable 5 Minute Limit */
	No5LimitHook = 0x8052D404;
	No5LimitHook2 = 0x8052D454;
	No5LimitHook3 = 0x8052D49C;

	/* Disable 5:56 DC */
	No556DC = 0x8052D4D0;

	/* Disable HUD */
	DecrementScreenElements = 0x805F087C;
	DisablePosition = 0x8084613C;
	DisableLap = 0x808461B4;
	DisableMap = 0x80846550;

	/* Disable Laps */
	NoLaps = 0x80522A44;

	/* Disable Luma */
	NoLuma = 0x807B6D3C;

	/* Disable Star Power Music */
	NoStarMusic = 0x806FE3D4;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806E8CCC;

	/* Disable Track Music */
	NoMusicHook = 0x8009136C;

	/* Disable Wheelie */
	DisableWheelieHook = 0x80576810;

	/* Enable Score */
	EnableScore = 0x80846A28;
	UpdateScoreHook = 0x807E5C5C;
	FixScoreColor = 0x807DA308;
	FixScoreSound = 0x807E5CA0;

	/* Finish Stuff */
	FinishPos = 0x80523550;
	FinishPosFix = 0x8052D718;
	FinishPoints = 0x8051CC90;

	/* Force CC */
	ForceCCHook = 0x8064F71C;

	/* Force Teams On */
	FixResults = 0x80634070;
	ForceTeams = 0x8051E580;
	ResetSeeker = 0x8051E4CC;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x806343D2;
	FroomRaceCount2 = 0x8063D836;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x80635C73;
	AutoFriendsMenu2 = 0x8063B92E;
	AutoFriendsMenu3 = 0x8063B832;

	/* Grumble Volcano Patches */
	RockFixHook = 0x806D1EF4;
	RockFix2Hook = 0x808062DC;
	GeyserFixHook = 0x806B1ED0;

	/* Increase Visual Distance */
	DrawDistance = 0x80880728;

	/* Infinite Star */
	InfiniteStarHook = 0x80567780;
	InfiniteStarHook2 = 0x8056E460;
	StarFunc = 0x807A542C;

	/* Instant Respawn */
	InstantRespawn1 = 0x80561E80;
	InstantRespawn2 = 0x80567C80;

	/* Invisibility */
	InvisibilityHook = 0x8064624C;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8055D1D8;
	ItemHitRemoteHook = 0x8064C25C;
	DisconnectPlayer = 0x80521DDC;
	PlayerDCHook = 0x80646EB0;
	HitboxPatch1Hook = 0x8055D000;
	HitboxPatch2Hook = 0x8055D014;

	/* Item Mod */
	ItemModHook = 0x807A8520;
	ItemRouletteHook = 0x807A85A4;
	ItemRouletteHook2 = 0x807A87E8;
	NoSpecialItems = 0x8078837C;

	/* License Unlocker */
	LicenseUnlocker = 0x805379CC;

	/* Message Editor */
	MessageEditorHook = 0x805BBD84;
	MessageEditorHook2 = 0x805BBD18;
	MessageEditorHook3 = 0x807E7210;
	MessageEditorHook4 = 0x807E7288;
	MessageFunc = 0x805E7110;

	/* Music Patches */
	BattleCountdown = 0x80704A74;
	JingleFunc = 0x806FFE6C;
	SomeJingleThing = 0x809B0E90;
	TimerFlash = 0x807E66B4;

	/* Mute Characters */
	MuteCharsHook = 0x806F5914;
	MuteCharsHook2 = 0x807045B0;
	MuteCharsHook3 = 0x806F5918;

	/* No Clip */
	NoClipHook = 0x8055D8C4;

	/* No Disconnect */
	NoDisconnect1 = 0x8050F42C;
	NoDisconnect2 = 0x8052CFC4;
	NoDisconnect3 = 0x8052D10C;
	NoDisconnect4 = 0x8052D17C;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807A8437;

	/* Reversed Timer */
	TimerManagerHook = 0x80523CD4;

	/* Room Message Handler */
	HostFlagsHook = 0x80649188;
	GuestFlagsHook = 0x80649288;
	FlagResetHook = 0x800D1B10;

	/* Screen Edits */
	ScreenLoadHook = 0x8061CC24;
	CupScreenPatchHook = 0x808C79FC;
	BattleCupScreenPatchHook = 0x808C73BC;
	ScreenDSIFix1Hook = 0x80825B04;
	ScreenDSIFix2Hook = 0x8082781C;
	ScreenDSIFix3Hook = 0x8082B2D8;
	TrackVoteFix = 0x80632656;
	TrackVoteFix2 = 0x806323EE;
	TrackVoteFix3 = 0x8065024B;
	TrackVoteFix4 = 0x80650293;
	TrackVoteFix5 = 0x806323E8;
	createScreen = 0x80611100;
	switchScreen = 0x80825AE0;

	/* Seeker Picker */
	HNSDataHook = 0x8051E600;
	HNSDataHook2 = 0x80520178;

	/* Spectator Mode */
	SpectatorModeHook = 0x80590288;
	ReplayCameraHook = 0x80590918;
	
	/* Starting Time Modifier */
	TimerInit = 0x8052393C;
	TimerInit2 = 0x805238E8;

	/* Tag Distance Modifier */
	TagDistanceHook = 0x807DE254;
	TagDistanceHook2 = 0x807E04A4;
	TagShowHook = 0x807DF008;
	TagFunc = 0x807DE404;
}
