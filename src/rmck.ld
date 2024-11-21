SECTIONS {
	/* Common Classes and Functions */
	SystemManager = 0x80374020;
	Racedata = 0x809ABD68;
	Raceinfo = 0x809ABD70;
	PlayerHolder = 0x809AFF38;
	MenuData = 0x809B0478;
	RKNetController = 0x809B0718;
	ItemHolder = 0x809B1C58;
	MusicHandler = 0x809B0E38;
	RKNetSelectHandler = 0x809B0740;
	ScreenHUD = 0x809B2CC0;

	PSVECSquareDistance = 0x8019B13C;

	DWC_IsServerMyself = 0x800d27c0;
	DWC_GetServerAid = 0x800d2748;
	DWC_CloseConnectionHard = 0x800d2060;
	GetRaceHeader2Buffer = 0x80641fd0;
	OSDisableInterrupts = 0x801a6908;
	OSRestoreInterrupts = 0x801a6930;
	ptr_miscPacketHandler = 0x809b0590;

	NETSHA1Init = 0x801D2850;
	NETSHA1Update = 0x801D28A0;
	NETSHA1GetDigest = 0x801D2954;

	UtilRandomSeed = 0x800F2F40;
	UtilRandint = 0x800F2F58;
	RandomNextLimited = 0x80543624;

	GetPlayerPosition = 0x8057E264;

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
	snprintf = 0x800119A0;
	swprintf = 0x8001787C;
	OSFatal = 0x801A5220;
	OSReport = 0x801A292C;
	CalcCRC32 = 0x801D1FFC;
	SCGetLanguage = 0x801B2068;
	memmove = 0x8000F258;

	/* Exception Handler */
	ShowExceptions = 0x80295404;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED8E0;
	WiimmfiPatch2 = 0x800ECB24;
	WiimmfiPatch3 = 0x800EE418;
	WiimmfiPatch4 = 0x801D5258;

	LoginRegion = 0x80372FD0;
	VSRegion = 0x8064195C;
	VSRegion2 = 0x80647524;
	VSRegion3 = 0x8064834C;

	WiimmfiVersionString = 0x80263E34;
	WiimmfiURLs = 0x802682B4;

	/* 30 FPS */
	ThirtyFPSHook = 0x80508FB4;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x80650138;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x80091334;

	/* Battle Arena Fixes */
	BattleStartFixHook = 0x8052435C;
	BattleCCFixHook = 0x8056613C;
	BattleRespawnFixHook = 0x80523424;

	/* Battle Camera */
	BattleCamera = 0x805966CF;

	/* Disable 5:56 DC */
	No556DC = 0x8052D4D0;

	/* Disable Lakitu Backwards */
	NoLakitu = 0x80523614;

	/* Disable Laps */
	NoLaps = 0x80522A44;

	/* Disable Luma */
	NoLuma = 0x807B6D3C;

	/* Disable Star Power Music */
	NoStarMusic = 0x806FE3D4;
	NoStarMusic2Hook = 0x806F63FC;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806E8CCC;

	/* Disable Track Music */
	NoMusicHook = 0x8009136C;

	/* Disable Various HUD Elements */
	HUDEditsHook = 0x80844678;

	/* Enable Score */
	InitScore = 0x807E5B64;
	UpdateScoreHook = 0x807E5C5C;
	FixScoreColor = 0x807DA308;
	ScoreCTR = 0x80898C17;

	/* End Race on Command */
	No5LimitHook = 0x8052D404;
	FinishPoints = 0x8051CA33;
	StopUpdatingTimer = 0x805228F4;
	StopUpdatingPosTracker = 0x80521730;
	StopUpdatingPosTracker2 = 0x8052D814;
	StopUpdatingPosTracker3 = 0x80521F5C;
	StopUpdatingPosTracker4 = 0x80520990;
	FixStartPosition = 0x805245AC;
	RaceAlonePatch = 0x8052DBF0;
	NoCheckpointsFix = 0x8052DAD7;

	/* Force CC */
	ForceCCHook = 0x8064F71C;

	/* Force Teams On */
	FixResults = 0x80634070;
	ResetSeeker = 0x8051E4CC;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x806343D0;
	FroomRaceCount2 = 0x8063D834;

	/* Glitch Prevention */
	DisableWallrideHook = 0x8056A070;
	DisableHWGHook = 0x80582CD0;
	ActivateOob = 0x80561B58;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x80635C73;
	AutoFriendsMenu2 = 0x8063B92E;
	AutoFriendsMenu3 = 0x8063B832;

	/* Host Version Check */
	GuestSendHook = 0x800DBD98;
	HostCheckHook = 0x800DC4F8;
	DWCiCheckResvCommand = 0x800DE718;
	HostCheckHelperHook = 0x800DC410;
	Original30 = 0x80264E30;

	/* Improved Positioning */
	NoInterpolation = 0x8087FF30;

	/* Increase Visual Distance */
	DrawDistance = 0x80880728;

	/* Infinite Star */
	InfiniteStarHook = 0x80567780;
	InfiniteStarHook2 = 0x805599F4;
	StarFunc = 0x8056E2C0;
	NoStarInvincibilityHook = 0x80555764;
	NoStarInvincibilityHook2 = 0x80818FAC;
	NoStarInvincibilityHook3 = 0x805830EC;

	/* Instant Respawn */
	InstantRespawn1 = 0x80561E83;
	InstantRespawn2 = 0x80567c58;
	InstantRespawn3 = 0x808a403d;

	/* Invisibility */
	InvisibilityHook = 0x8064624C;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8055D1D8;
	ItemHitRemoteHook = 0x8064C258;
	DisconnectPlayer = 0x80521DDC;
	PlayerDCHook = 0x80646EB0;
	HitboxPatch1Hook = 0x8055D000;
	HitboxPatch2Hook = 0x8055D014;

	/* Item Mod */
	ItemModHook = 0x807A8520;
	ItemRouletteHook = 0x807A85A4;
	ItemRouletteHook2 = 0x807A87E8;
	NoSpecialItems = 0x8078837C;
	NoSpecialItems2 = 0x8064C460;

	/* Kill Data */
	InitKillDataHook = 0x80846970;
	NoKillDataHide = 0x80845DDC;
	MenuDataGetPlayerName = 0x805E8D50;
	SetMSGID = 0x8062C0CC;
	screenText_construct = 0x805BB90C;

	/* KMP - Track Identifier */
	TrackIdentifierHook = 0x80501DE0;
	TrackIdentifierHook2 = 0x80500868;

	/* KMP Injector - AREA */
	AREAHook = 0x80503EA4;

	/* KMP Patcher - GOBJ Fixes */
	GOBJRockFixHook = 0x806D1EF4;
	GOBJRockFix2Hook = 0x808062DC;
	GOBJGeyserFixHook = 0x806B1ED0;
	GOBJTwanwanFixHook = 0x80878908;
	GOBJVenicenamiFixHook = 0x8081CC6C;
	GOBJVenicesakuFixHook = 0x80805D30;
	GOBJVenicehasiFixHook = 0x80804AD8;

	/* License Unlocker */
	LicenseUnlocker = 0x805379CC;

	/* Main Menu Mod */
	MainMenuButtonSetup = 0x8083E9E0;
	MainMenuCrashFixHook = 0x8083F3EC;
	MKChannelRedirect = 0x8083F68B;
	ResetText = 0x8062C2E0;

	/* Message Editor */
	MessageEditorHook = 0x805E6FEC;
	MessageEditorHook2 = 0x805BBD18;

	/* Music Patches */
	BattleCountdown = 0x80704A74;
	JingleFunc = 0x806FFE6C;
	SomeJingleThing = 0x809B0E90;
	TimerFlash = 0x807E66B4;
	BattleEnd = 0x806F9700;
	MusicPitch = 0x8088F538;
	FastMusicHook = 0x806FFE88;

	/* No Clip */
	NoClipHook = 0x8055D9C4;

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

	/* Patch.szs */
	SZSCount = 0x805181AF;
	PatchSZSHook = 0x805183B0;
	FilenameEndings = 0x808A15F8;
	DefaultFileEnding = 0x8087E200;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807A8437;

	/* Reversed Timer */
	TimerManagerHook = 0x80523CD4;
	TimerEndManagerHook = 0x807E6540;
	TimerEndBranch = 0x807E654A;

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
	BattleCupScreenPatch2 = 0x8063E4EC;
	ScreenDSIFix1Hook = 0x80825B04;
	ScreenDSIFix2Hook = 0x8082781C;
	ScreenDSIFix3Hook = 0x8082B2D8;
	TrackVoteFix = 0x80632656;
	TrackVoteFix2 = 0x806323EE;
	TrackVoteFix3 = 0x8065024B;
	TrackVoteFix4 = 0x80650293;
	TrackVoteFix5 = 0x806323E8;
	TimerShow = 0x8063E56C;
	TrackVoteLabel1 = 0x8082E908;
	TrackVoteLabel2 = 0x8082F7F0;
	TrackVoteLabel3 = 0x808276B0;
	TrackVoteLabel4 = 0x80827758;
	TrackVoteLabel5 = 0x8082B214;
	createScreen = 0x80611100;
	switchScreen = 0x80825AE0;
	SceneSwapHook = 0x80610214;

	/* Seeker Picker */
	HNSDataHook = 0x8051E600;
	HNSDataHook2 = 0x80520178;

	/* Set Default Drift Type */
	DefaultDriftType = 0x805343C4;

	/* Spectator Mode */
	SpectatorModeHook = 0x80590288;
	ReplayCameraHook = 0x80590918;
	BackwardsCameraHook = 0x8059029C;

	/* Speed Nullifier */
	StopperHook = 0x80568BC0;
	StopperHook2 = 0x80569A14;
	StopperHook3 = 0x805709C4;
	StopperHook4 = 0x80583A58;
	StopperHook5 = 0x805828D4;

	/* Starting Time Modifier */
	TimerInit = 0x8052393C;
	TimerInit2 = 0x805238E8;

	/* Tag Distance Modifier */
	TagDistanceHook = 0x807DE254;
	TagDistanceHook2 = 0x807E04A4;
	TagShowHook = 0x807DF008;
	TagFunc = 0x807DE404;
	PlayAnim = 0x8062AC34;
	TeamLineColors = 0x80898254;
	ZeroFloat = 0x80898198;

	/* Track Check */
	InsertTrackIdentHook = 0x8052c4c8;
	CheckTrackIdentHook = 0x8052d4f4;
	clearSendRH2 = 0x80642090;
}
