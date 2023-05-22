SECTIONS {
	/* Common Classes and Functions */
	SystemManager = 0x80385980;
	Racedata = 0x809BC788;
	Raceinfo = 0x809BC790;
	PlayerHolder = 0x809C0958;
	MenuData = 0x809C0E98;
	RKNetController = 0x809C1138;
	ItemHolder = 0x809C2678;
	MusicHandler = 0x809C1858;
	RKNetSelectHandler = 0x809C1160;
	ScreenHUD = 0x809C36E0;

	PSVECSquareDistance = 0x8019AD00;

	NETSHA1Init = 0x801D2414;
	NETSHA1Update = 0x801D2464;
	NETSHA1GetDigest = 0x801D2518;

	UtilRandomSeed = 0x800F2DE8;
	UtilRandint = 0x800F2E00;
	RandomNextLimited = 0x80554F4C;

	GetPlayerPosition = 0x8058FB8C;

	/* Codehandler Hooks */
	VIHook = 0x801BAA40;
	KPADHook = 0x801979C8;
	GXDrawHook = 0x8016EA8C;
	GXFlushHook = 0x8016E5CC;
	OSSleepHook = 0x801AA9C0;
	AXNextFrameHook = 0x801264C0;

	/* Payload Hook */
	RelHook = 0x801A6C50;

	/* Base Functions */
	DVDOpen = 0x8015E1DC;
	DVDReadPrio = 0x8015E754;
	DVDClose = 0x8015E488;
	sprintf = 0x80011950;
	snprintf = 0x8001185C;
	swprintf = 0x80017738;
	OSFatal = 0x801A4DE4;
	OSReport = 0x801A24F0;
	CalcCRC32 = 0x801D1BC0;
	SCGetLanguage = 0x801B1C2C;
	memmove = 0x8000F114;

	/* Exception Handler */
	ShowExceptions = 0x802A6D84;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED788;
	WiimmfiPatch2 = 0x800EC9CC;
	WiimmfiPatch3 = 0x800EE2C0;
	WiimmfiPatch4 = 0x801D4E1C;

	LoginRegion = 0x80384950;
	VSRegion = 0x80652CB0;
	VSRegion2 = 0x80658878;
	VSRegion3 = 0x806596A0;

	WiimmfiVersionString = 0x802759F4;
	WiimmfiURLs = 0x80279DA4;

	/* 30 FPS */
	ThirtyFPSHook = 0x8051A914;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x8066148C;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x800911F4;

	/* Battle Arena Fixes */
	BattleStartFixHook = 0x80535C84;
	BattleCCFixHook = 0x80577A64;
	BattleRespawnFixHook = 0x80534D4C;

	/* Battle Camera */
	BattleCamera = 0x805A7FF7;

	/* Disable 5:56 DC */
	No556DC = 0x8053EDF8;

	/* Disable Lakitu Backwards */
	NoLakitu = 0x80534F3C;

	/* Disable Laps */
	NoLaps = 0x8053436C;

	/* Disable Luma */
	NoLuma = 0x807C7FE8;

	/* Disable Star Power Music */
	NoStarMusic = 0x8070F698;
	NoStarMusic2Hook = 0x807076C0;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806F9F90;

	/* Disable Track Music */
	NoMusicHook = 0x8009122C;

	/* Disable Various HUD Elements */
	HUDEditsHook = 0x80855924;

	/* Enable Score */
	InitScore = 0x807F6E10;
	UpdateScoreHook = 0x807F6F08;
	FixScoreColor = 0x807EB5B4;
	ScoreCTR = 0x808A9917;

	/* End Race on Command */
	No5LimitHook = 0x8053ED2C;
	FinishPoints = 0x8052E35B;
	StopUpdatingTimer = 0x8053421C;
	StopUpdatingPosTracker = 0x80533058;
	StopUpdatingPosTracker2 = 0x8053F13C;
	StopUpdatingPosTracker3 = 0x80533884;
	StopUpdatingPosTracker4 = 0x805322B8;
	FixStartPosition = 0x80535ED4;
	RaceAlonePatch = 0x8053F518;
	NoCheckpointsFix = 0x8053F3FF;

	/* Force CC */
	ForceCCHook = 0x80660A70;

	/* Force Teams On */
	FixResults = 0x806453C4;
	ResetSeeker = 0x8052FDF4;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x80645724;
	FroomRaceCount2 = 0x8064EB88;

	/* Glitch Prevention */
	DisableWallrideHook = 0x8057B998;
	DisableHWGHook = 0x805945F8;
	ActivateOob = 0x80573480;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x80646FC7;
	AutoFriendsMenu2 = 0x8064CC82;
	AutoFriendsMenu3 = 0x8064CB86;

	/* Host Version Check */
	GuestSendHook = 0x800DBC58;
	HostCheckHook = 0x800DC3B8;
	DWCiCheckResvCommand = 0x800DE5D8;
	HostCheckHelperHook = 0x800DC2D0;
	Original30 = 0x802769F0;

	/* Improved Positioning */
	NoInterpolation = 0x80891178;

	/* Increase Visual Distance */
	DrawDistance = 0x80891970;

	/* Infinite Star */
	InfiniteStarHook = 0x805790A8;
	InfiniteStarHook2 = 0x8056B31C;
	StarFunc = 0x8057FBE8;
	NoStarInvincibilityHook = 0x8056708C;
	NoStarInvincibilityHook2 = 0x8082A258;
	NoStarInvincibilityHook3 = 0x80594A14;

	/* Instant Respawn */
	InstantRespawn1 = 0x805737AB;
	InstantRespawn2 = 0x805795A0;

	/* Invisibility */
	InvisibilityHook = 0x806575A0;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8056EB00;
	ItemHitRemoteHook = 0x8065D5AC;
	DisconnectPlayer = 0x80533704;
	PlayerDCHook = 0x80658204;
	HitboxPatch1Hook = 0x8056E928;
	HitboxPatch2Hook = 0x8056E93C;

	/* Item Mod */
	ItemModHook = 0x807B97CC;
	ItemRouletteHook = 0x807B9850;
	ItemRouletteHook2 = 0x807B9A94;
	NoSpecialItems = 0x80799628;
	NoSpecialItems2 = 0x8065D7B4;

	/* Kill Data */
	InitKillDataHook = 0x80857C1C;
	NoKillDataHide = 0x80857088;
	MenuDataGetPlayerName = 0x805FA20C;
	SetMSGID = 0x8063D420;
	screenText_construct = 0x805CD228;

	/* KMP - Track Identifier */
	TrackIdentifierHook = 0x80513740;
	TrackIdentifierHook2 = 0x805121C8;

	/* KMP Injector - AREA */
	AREAHook = 0x80515804;

	/* KMP Patcher - GOBJ Fixes */
	GOBJRockFixHook = 0x806E31B8;
	GOBJRockFix2Hook = 0x80817588;
	GOBJGeyserFixHook = 0x806C3194;
	GOBJTwanwanFixHook = 0x80889BB4;
	GOBJVenicenamiFixHook = 0x8082DF18;
	GOBJVenicesakuFixHook = 0x80816FDC;
	GOBJVenicehasiFixHook = 0x80815D84;

	/* License Unlocker */
	LicenseUnlocker = 0x805492F4;

	/* Main Menu Mod */
	MainMenuButtonSetup = 0x8084FC8C;
	MainMenuCrashFixHook = 0x80850698;
	MKChannelRedirect = 0x80850937;
	ResetText = 0x8063D634;

	/* Message Editor */
	MessageEditorHook = 0x805F84A8;
	MessageEditorHook2 = 0x805CD634;

	/* Music Patches */
	BattleCountdown = 0x80715D38;
	JingleFunc = 0x80711130;
	SomeJingleThing = 0x809C18B0;
	TimerFlash = 0x807F7960;
	BattleEnd = 0x8070A9C4;
	MusicPitch = 0x808A0238;
	FastMusicHook = 0x8071114C;

	/* No Clip */
	NoClipHook = 0x8056F2EC;

	/* No Disconnect */
	NoDisconnect1 = 0x80520D88;
	NoDisconnect2 = 0x8053E8EC;
	NoDisconnect3 = 0x8053EA34;
	NoDisconnect4 = 0x8053EAA4;

	/* Online Menu Edits */
	NoWWButton1 = 0x8064AFEF;
	NoWWButton2 = 0x8064B07C;
	NoWWButton3 = 0x8064B0A4;
	NoWWButton4 = 0x8064B0BC;
	NoWWButton5 = 0x8064B27F;
	NoWWButton6 = 0x8064B2AA;
	NoWWButton7 = 0x8064B322;
	NoWWButton8 = 0x8064B5CB;
	BattleButton1 = 0x8064BA87;
	BattleButton2 = 0x8064BA9F;
	BattleButton3 = 0x8064BDDB;
	BattleButton4 = 0x80607CDC;
	VersionString1 = 0x8064BC12;
	VersionString2 = 0x8064BC26;
	VersionString3 = 0x8064C48E;
	VersionString4 = 0x805D95DA;
	VersionString5 = 0x80607DC6;
	VersionString6 = 0x80607DEA;
	VersionString7 = 0x805D3FC2;
	VersionString8 = 0x805D5546;

	/* Patch.szs */
	SZSCount = 0x80529B0B;
	PatchSZSHook = 0x80529CD8;
	FilenameEndings = 0x808B22E8;
	DefaultFileEnding = 0x8088F450;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807B96E3;

	/* Reversed Timer */
	TimerManagerHook = 0x805355FC;
	TimerEndManagerHook = 0x807F77EC;
	TimerEndBranch = 0x807F77F6;

	/* Room Message Handler */
	HostFlagsHook = 0x8065A4DC;
	GuestFlagsHook = 0x8065A5DC;
	FlagResetHook = 0x800D19D0;
	FlagResetHook2 = 0x800D18A0;
	FlagResetHook3 = 0x800D1C84;
	FlagResetHook4 = 0x800D2BF0;
	MessageButtons = 0x805DBCC7;
	MessageButtons2Hook = 0x805DACBC;
	MessageButtons3Hook = 0x805DA658;
	MessageButtons4 = 0x805DBD5B;
	MessageButtons5 = 0x805DA5D3;
	MessageButtons6Hook = 0x805DC454;

	/* Screen Edits */
	ScreenLoadHook = 0x8062DF78;
	ScreenLoadHook2 = 0x8062D7EC;
	CupScreenPatchHook = 0x808D86B4;
	BattleCupScreenPatchHook = 0x808D8074;
	BattleCupScreenPatch2 = 0x8064F840;
	ScreenDSIFix1Hook = 0x80836DB0;
	ScreenDSIFix2Hook = 0x80838AC8;
	ScreenDSIFix3Hook = 0x8083C584;
	TrackVoteFix = 0x806439AA;
	TrackVoteFix2 = 0x80643742;
	TrackVoteFix3 = 0x8066159F;
	TrackVoteFix4 = 0x806615E7;
	TrackVoteFix5 = 0x8064373C;
	TimerShow = 0x8064F8C0;
	TrackVoteLabel1 = 0x8083FBB4;
	TrackVoteLabel2 = 0x80840A9C;
	TrackVoteLabel3 = 0x8083895C;
	TrackVoteLabel4 = 0x80838A04;
	TrackVoteLabel5 = 0x8083C4C0;
	createScreen = 0x80622454;
	switchScreen = 0x80836D8C;
	SceneSwapHook = 0x80621568;

	/* Seeker Picker */
	HNSDataHook = 0x8052FF28;
	HNSDataHook2 = 0x80531AA0;

	/* Set Default Drift Type */
	DefaultDriftType = 0x80545CEC;

	/* Spectator Mode */
	SpectatorModeHook = 0x805A1BB0;
	ReplayCameraHook = 0x805A2240;
	BackwardsCameraHook = 0x805A1BC4;

	/* Speed Nullifier */
	StopperHook = 0x8057A4E8;
	StopperHook2 = 0x8057B33C;
	StopperHook3 = 0x805822EC;
	StopperHook4 = 0x80595380;
	StopperHook5 = 0x805941FC;

	/* Starting Time Modifier */
	TimerInit = 0x80535264;
	TimerInit2 = 0x80535210;

	/* Tag Distance Modifier */
	TagDistanceHook = 0x807EF500;
	TagDistanceHook2 = 0x807F1750;
	TagShowHook = 0x807F02B4;
	TagFunc = 0x807EF6B0;
	PlayAnim = 0x8063BF88;
	TeamLineColors = 0x808A8F54;
	ZeroFloat = 0x808A8E98;
}
