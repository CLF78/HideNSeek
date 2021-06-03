SECTIONS {
	/* Common Classes and Functions */
	Racedata = 0x809BD728;
	Raceinfo = 0x809BD730;
	PlayerHolder = 0x809C18F8;
	MenuData = 0x809C1E38;
	RKNetController = 0x809C20D8;
	ItemHolder = 0x809C3618;
	MusicHandler = 0x809C27F8;
	RKNetSelectHandler = 0x809C2100;
	ScreenHUD = 0x809C4680;

	NETSHA1Init = 0x801D24F4;
	NETSHA1Update = 0x801D2544;
	NETSHA1GetDigest = 0x801D25F8;

	UtilRandomSeed = 0x800F2EC8;
	UtilRandint = 0x800F2EE0;
	RandomNextLimited = 0x805555CC;

	/* Codehandler Hooks */
	VIHook = 0x801BAB20;
	KPADHook = 0x80197AA8;
	GXDrawHook = 0x8016EB6C;
	GXFlushHook = 0x8016E6AC;
	OSSleepHook = 0x801AAAA0;
	AXNextFrameHook = 0x801265A0;

	/* Payload Hook */
	RelHook = 0x801A6D30;

	/* Base Functions */
	DVDOpen = 0x8015E2BC;
	DVDReadPrio = 0x8015E834;
	DVDClose = 0x8015E568;
	sprintf = 0x80011A2C;
	swprintf = 0x80017814;
	OSFatal = 0x801A4EC4;
	OSReport = 0x801A25D0;
	CalcCRC32 = 0x801D1CA0;
	SCGetLanguage = 0x801B1D0C;

	/* Exception Handler */
	ShowExceptions = 0x802A7404;
	ExcDispInfo = 0x802A7410;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED868;
	WiimmfiPatch2 = 0x800ECAAC;
	WiimmfiPatch3 = 0x800EE3A0;
	WiimmfiPatch4 = 0x801D4EFC;

	LoginRegion = 0x80384FD0;
	VSRegion = 0x80653644;
	VSRegion2 = 0x806536B0;
	VSRegion3 = 0x8065920C;
	VSRegion4 = 0x80659260;
	VSRegion5 = 0x80659724;
	VSRegion6 = 0x80659778;
	VSRegion7 = 0x8065A034;
	VSRegion8 = 0x8065A080;

	WiimmfiVersionString = 0x80276054;
	NaswiiURL = 0x8027A404;
	NaswiiURL2 = 0x8027A42C;
	NaswiiURL3 = 0x8027A4AC;
	NaswiiURL4 = 0x8027A450;
	AvailableURL = 0x8027AD68;
	GPCMURL = 0x8027B4D8;
	GPSPURL = 0x8027BEF0;
	MasterURL = 0x8027D091;
	NatnegURL = 0x8027DCAB;
	NatnegURL2 = 0x8027DCC7;
	NatnegURL3 = 0x8027DCE3;
	MSURL = 0x8027DE33;
	GSURL = 0x8027DEB7;

	/* 30 FPS */
	ThirtyFPSHook1 = 0x80009A3C;
	ThirtyFPSHook2 = 0x800092AB;
	ThirtyFPSHook3 = 0x800090AF;
	ThirtyFPSHook4 = 0x8051AF94;
	ThirtyFPSHook5 = 0x8051B33C;
	ThirtyFPSHook6 = 0x8051B32B;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x80661E20;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x800912D4;

	/* Battle Arena Fixes */
	BattleSpawnFixHook = 0x80536304;
	BattleCCFixHook = 0x805780E4;
	BattleCCFix2 = 0x805780E8;

	/* Battle Camera */
	BattleCamera = 0x805A8B0B;

	/* Disable 5 Minute Limit */
	No5LimitHook = 0x8053F3AC;
	No5LimitHook2 = 0x8053F3FC;
	No5LimitHook3 = 0x8053F444;

	/* Disable 5:56 DC */
	No556DC = 0x8053F478;

	/* Disable HUD */
	DecrementScreenElements = 0x8060245C;
	DisablePosition = 0x80857D7C;
	DisableLap = 0x80857DF4;
	DisableMap = 0x80858190;

	/* Disable Laps */
	NoLaps = 0x805349EC;

	/* Disable Lakitu Backwards */
	NoLakitu = 0x805355BC;

	/* Disable Luma */
	NoLuma = 0x807C897C;

	/* Disable Star Power Music */
	NoStarMusic = 0x8071002C;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806FA924;

	/* Disable Track Patches */
	PatchFilename = 0x8088FDF4;

	/* Disable Track Music */
	NoMusicHook = 0x8009130C;

	/* Enable Score */
	EnableScore = 0x80858668;
	UpdateScoreHook = 0x807F789C;
	FixScoreColor = 0x807EBF48;
	FixScoreSound = 0x807F78E0;

	/* Finish Stuff */
	FinishPoints = 0x8052EC0C;
	StopUpdatingPosTracker = 0x805336D8;
	StopUpdatingPosTracker2 = 0x8053F9C0;
	StopUpdatingPosTracker3 = 0x80533F04;
	StopUpdatingPosTracker4 = 0x80532938;
	StopUpdatingPosTracker5 = 0x80536554;
	StopUpdatingPosTracker6 = 0x8053F7BC;
	StopUpdatingTimer = 0x8053489C;
	RaceAlonePatch = 0x8053FC10;

	/* Force CC */
	ForceCCHook = 0x80661404;

	/* Force Teams On */
	FixResults = 0x80645D58;
	ForceTeams = 0x80530528;
	ResetSeeker = 0x80530474;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x806460BA;
	FroomRaceCount2 = 0x8064F51E;

	/* Glitch Prevention */
	DisableWallrideHook = 0x8057C018;
	DisableHWGHook = 0x805953E8;
	FallBoundaryHook1 = 0x80515E84;
	FallBoundaryHook2 = 0x80515EC4;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x8064795B;
	AutoFriendsMenu2 = 0x8064D616;
	AutoFriendsMenu3 = 0x8064D51A;

	/* Grumble Volcano Patches */
	RockFixHook = 0x806E3B4C;
	RockFix2Hook = 0x80817F1C;
	GeyserFixHook = 0x806C3B28;

	/* Host Version Check */
	GuestSendHook = 0x800DBD38;
	HostCheckHook = 0x800DC49C;
	DWCiCheckResvCommand = 0x800DE6B8;
	HostCheckHelperHook = 0x800DC3B0;
	Original30 = 0x80277050;

	/* Improved Positioning */
	ForceInterpolation = 0x8058BA38;
	InterpolationHook = 0x8058BA50;
	InterpolationHook2 = 0x8058BC30;

	/* Increase Visual Distance */
	DrawDistance = 0x80892320;

	/* Infinite Star */
	InfiniteStarHook = 0x80579728;
	InfiniteStarHook2 = 0x80580408;
	InfiniteStarHook3 = 0x8056B99C;
	StarFunc = 0x807B706C;
	StarFix = 0x807B709C;

	/* Instant Respawn */
	InstantRespawn1 = 0x80573E28;
	InstantRespawn2 = 0x80579C28;

	/* Invisibility */
	InvisibilityHook = 0x80657F34;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8056F180;
	ItemHitRemoteHook = 0x8065DF44;
	DisconnectPlayer = 0x80533D84;
	PlayerDCHook = 0x80658B98;
	HitboxPatch1Hook = 0x8056EFA8;
	HitboxPatch2Hook = 0x8056EFBC;

	/* Item Mod */
	ItemModHook = 0x807BA160;
	ItemRouletteHook = 0x807BA1E4;
	ItemRouletteHook2 = 0x807BA428;
	NoSpecialItems = 0x80799FBC;

	/* License Unlocker */
	LicenseUnlocker = 0x80549974;

	/* Message Editor */
	MessageEditorHook = 0x805CDDC4;
	MessageEditorHook2 = 0x805CDD58;
	MessageEditorHook3 = 0x807F8E50;
	MessageEditorHook4 = 0x807F8EC8;
	MessageFunc = 0x805F8CF0;

	/* Music Patches */
	BattleCountdown = 0x807166CC;
	JingleFunc = 0x80711AC4;
	SomeJingleThing = 0x809C2850;
	TimerFlash = 0x807F82F4;
	BattleEnd = 0x8070B358;
	MusicPitch = 0x808A10D8;
	FastMusicEnableHook = 0x80712054;
	FastMusicDisableHook = 0x807120E4;

	/* Mute Characters */
	MuteCharsHook = 0x8070756C;
	MuteCharsHook2 = 0x80716208;
	MuteCharsHook3 = 0x80707570;

	/* No Clip */
	NoClipHook = 0x8056F86C;

	/* No Disconnect */
	NoDisconnect1 = 0x80521408;
	NoDisconnect2 = 0x8053EF6C;
	NoDisconnect3 = 0x8053F0B4;
	NoDisconnect4 = 0x8053F124;

	/* Online Menu Edits */
	NoWWButton1 = 0x8064B983;
	NoWWButton2 = 0x8064BA10;
	NoWWButton3 = 0x8064BA38;
	NoWWButton4 = 0x8064BA50;
	NoWWButton5 = 0x8064BC13;
	NoWWButton6 = 0x8064BC3E;
	NoWWButton7 = 0x8064BCB6;
	NoWWButton8 = 0x8064BF5F;
	BattleButton1 = 0x8064C41B;
	BattleButton2 = 0x8064C433;
	BattleButton3 = 0x8064C76F;
	BattleButton4 = 0x80608568;
	VersionString1 = 0x8064C5A6;
	VersionString2 = 0x8064C5BA;
	VersionString3 = 0x8064CE22;
	VersionString4 = 0x805D9CFE;
	VersionString5 = 0x80608652;
	VersionString6 = 0x80608676;
	VersionString7 = 0x805D46E6;
	VersionString8 = 0x805D5C6A;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807BA077;

	/* Respawn Cooldown */
	RespawnCooldownHook = 0x80581CFC;

	/* Reversed Timer */
	TimerManagerHook = 0x80535C7C;
	TimerEndManagerHook = 0x807F8180;
	TimerEndBranch = 0x807F818A;

	/* Room Message Handler */
	HostFlagsHook = 0x8065AE70;
	GuestFlagsHook = 0x8065AF70;
	FlagResetHook = 0x800D1AB0;
	FlagResetHook2 = 0x800D1980;
	FlagResetHook3 = 0x800D1D64;
	FlagResetHook4 = 0x800D2CD0;
	MessageButtons = 0x805DC3EB;
	MessageButtons2Hook = 0x805DB3E0;
	MessageButtons3Hook = 0x805DAD7C;
	MessageButtons4 = 0x805DC47F;
	MessageButtons5 = 0x805DACF7;
	MessageButtons6Hook = 0x805DCB78;

	/* Screen Edits */
	ScreenLoadHook = 0x8062E82C;
	ScreenLoadHook2 = 0x8062E0A0;
	CupScreenPatchHook = 0x808D9564;
	BattleCupScreenPatchHook = 0x808D8F24;
	BattleCupScreenPatch2 = 0x806501D4;
	ScreenDSIFix1Hook = 0x80837744;
	ScreenDSIFix2Hook = 0x8083945C;
	ScreenDSIFix3Hook = 0x8083CF18;
	ScreenDSIFix4Hook = 0x80837E60;
	TrackVoteFix = 0x8064433E;
	TrackVoteFix2 = 0x806440D6;
	TrackVoteFix3 = 0x80661F33;
	TrackVoteFix4 = 0x80661F7B;
	TrackVoteFix5 = 0x806440D0;
	TimerShow = 0x80650254;
	TrackVoteLabel1 = 0x80840548;
	TrackVoteLabel2 = 0x80841430;
	TrackVoteLabel3 = 0x808392F0;
	TrackVoteLabel4 = 0x80839398;
	TrackVoteLabel5 = 0x8083CE54;
	createScreen = 0x80622D08;
	switchScreen = 0x80837720;
	MainMenuFix1 = 0x805EBB40;
	MainMenuFix1Dest = 0x8085110C;
	MainMenuFix2 = 0x80851130;
	MainMenuFix3 = 0x8085114C;
	MainMenuFix4 = 0x808514DC;
	SceneSwapHook = 0x80621E1C;

	/* Seeker Picker */
	HNSDataHook = 0x805305A8;
	HNSDataHook2 = 0x80532120;

	/* Set Default Drift Type */
	DefaultDriftType = 0x8054636C;

	/* Spectator Mode */
	SpectatorModeHook = 0x805A2230;
	ReplayCameraHook = 0x805A28C0;
	BackwardsCameraHook = 0x805A2244;

	/* Speed Nullifier */
	StopperHook = 0x8057AB68;
	StopperHook2 = 0x8057B9BC;
	StopperHook3 = 0x8058296C;

	/* Starting Time Modifier */
	TimerInit = 0x805358E4;
	TimerInit2 = 0x80535890;

	/* Tag Modifier */
	TagDistanceHook = 0x807EFE94;
	TagDistanceHook2 = 0x807F20E4;
	TagShowHook = 0x807F0C48;
	TagFunc = 0x807F0044;
	PlayAnim = 0x8063C91C;
	TeamLineColors = 0x808A9DF4;
	ZeroFloat = 0x808A9D38;
}
