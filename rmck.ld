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
	VSRegion = 0x8064195C;
	VSRegion2 = 0x806419C8;
	VSRegion3 = 0x80647524;
	VSRegion4 = 0x80647578;
	VSRegion5 = 0x80647A3C;
	VSRegion6 = 0x80647A90;
	VSRegion7 = 0x8064834C;
	VSRegion8 = 0x80648398;

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

	/* Disable Lakitu Backwards */
	NoLakitu = 0x80523614;

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
	FinishPoints = 0x8051CC64;
	FixPositionsHook = 0x8084AC80;
	FixPositions2 = 0x8051CA64;
	FixPositions3 = 0x8051CAF8;
	FixPositions4Hook = 0x8051CA48;
	FixPositions5Hook = 0x8084B6A8;
	FixPositions6 = 0x8084B688;
	FixFanfareHook = 0x8077B47C;

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

	/* Host Version Check */
	GuestSendHook = 0x800DBD98;
	HostCheckHook = 0x800DC4FC;
	DWCiCheckResvCommand = 0x800DE718;
	HostCheckHelperHook = 0x800DC410;
	Original30 = 0x80264E30;

	/* Increase Visual Distance */
	DrawDistance = 0x80880728;

	/* Infinite Star */
	InfiniteStarHook = 0x80567780;
	InfiniteStarHook2 = 0x8056E460;
	InfiniteStarHook3 = 0x805599F4;
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
	BattleEnd = 0x806F9700;

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

	/* Online Menu Edits */
	NoWWButton1 = 0x80639C9B;
	NoWWButton2 = 0x80639D28;
	NoWWButton3 = 0x80639D50;
	NoWWButton4 = 0x80639D68;
	NoWWButton5 = 0x80639F2B;
	NoWWButton6 = 0x80639F56;
	NoWWButton7 = 0x80639FCE;
	NoWWButton8 = 0x8063A277;
	BattleButton1 = 0x8063A733;
	BattleButton2 = 0x8063A74B;
	BattleButton3 = 0x8063AA87;
	BattleButton4 = 0x805F6988;
	VersionString1 = 0x8063A8BE;
	VersionString2 = 0x8063A8D2;
	VersionString3 = 0x8063B13A;
	VersionString4 = 0x805C7E9A;
	VersionString5 = 0x805F6A72;
	VersionString6 = 0x805F6A96;
	VersionString7 = 0x805C2882;
	VersionString8 = 0x805C3E06;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807A8437;

	/* Respawn Cooldown */
	RespawnCooldownHook = 0x8056FD54;

	/* Reversed Timer */
	TimerManagerHook = 0x80523CD4;

	/* Room Message Handler */
	HostFlagsHook = 0x80649188;
	GuestFlagsHook = 0x80649288;
	FlagResetHook = 0x800D1B10;
	FlagResetHook2 = 0x800D19E0;
	FlagResetHook3 = 0x800D1DC4;
	FlagResetHook4 = 0x800D2D30;
	MessageButtons = 0x805CA587;
	MessageButtons2Hook = 0x805C957C;
	MessageButtons3Hook = 0x805C8F18;
	MessageButtons4 = 0x805CA61B;
	MessageButtons5 = 0x805C8E93;
	MessageButtons6Hook = 0x805CAD14;

	/* Screen Edits */
	ScreenLoadHook = 0x8061CC24;
	ScreenLoadHook2 = 0x8061C498;
	CupScreenPatchHook = 0x808C79FC;
	BattleCupScreenPatchHook = 0x808C73BC;
	ScreenDSIFix1Hook = 0x80825B04;
	ScreenDSIFix2Hook = 0x8082781C;
	ScreenDSIFix3Hook = 0x8082B2D8;
	ScreenDSIFix4Hook = 0x80826220;
	TrackVoteFix = 0x80632656;
	TrackVoteFix2 = 0x806323EE;
	TrackVoteFix3 = 0x8065024B;
	TrackVoteFix4 = 0x80650293;
	TrackVoteFix5 = 0x806323E8;
	createScreen = 0x80611100;
	switchScreen = 0x80825AE0;
	MainMenuFix1 = 0x805D9CDC;
	MainMenuFix1Dest = 0x8083F4CC;
	MainMenuFix2 = 0x8083F4F0;
	MainMenuFix3 = 0x8083F50C;
	MainMenuFix4 = 0x8083F89C;
	SceneSwapHook = 0x80610214;

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
