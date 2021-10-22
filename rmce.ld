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
	ScreenHUD = 0x809BFDC0;

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
	OSReport = 0x801A2530;
	CalcCRC32 = 0x801D1C00;
	SCGetLanguage = 0x801B1C6C;

	/* Exception Handler */
	ShowExceptions = 0x802A3084;

	/* Wiimmfi */
	WiimmfiPatch1 = 0x800ED7C8;
	WiimmfiPatch2 = 0x800ECA0C;
	WiimmfiPatch3 = 0x800EE300;
	WiimmfiPatch4 = 0x801D4E5C;

	LoginRegion = 0x80380C50;
	VSRegion = 0x8064F1BC;
	VSRegion2 = 0x8064F228;
	VSRegion3 = 0x80654D84;
	VSRegion4 = 0x80654DD8;
	VSRegion5 = 0x8065529C;
	VSRegion6 = 0x806552F0;
	VSRegion7 = 0x80655BAC;
	VSRegion8 = 0x80655BF8;

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

	/* 30 FPS */
	ThirtyFPSHook1 = 0x800099FC;
	ThirtyFPSHook2 = 0x8000926B;
	ThirtyFPSHook3 = 0x8000906F;
	ThirtyFPSHook4 = 0x80516B20;
	ThirtyFPSHook5 = 0x80516EC8;
	ThirtyFPSHook6 = 0x80516EB7;

	/* Always Win Track Vote */
	AlwaysWinVoteHook = 0x80659EE4;

	/* Automatic BRSAR Patch */
	AutoBRSARHook = 0x80091234;

	/* Battle Arena Fixes */
	BattleSpawnFixHook = 0x805317BC;
	BattleCCFixHook = 0x80571880;
	BattleCCFix2 = 0x80571884;

	/* Battle Camera */
	BattleCamera = 0x8059DAD3;

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

	/* Disable Lakitu Backwards */
	NoLakitu = 0x80530A74;

	/* Disable Luma */
	NoLuma = 0x807B9F1C;

	/* Disable Star Power Music */
	NoStarMusic = 0x80708588;

	/* Disable Title Demo Movie */
	NoTitleDemo = 0x806F59BC;

	/* Disable Track Patches */
	PatchFilename = 0x8088B990;

	/* Disable Track Music */
	NoMusicHook = 0x8009126C;

	/* Enable Score */
	EnableScore = 0x80836BD8;
	UpdateScoreHook = 0x80842A98;
	FixScoreColor = 0x807E269C;
	FixScoreSound = 0x80842ADC;

	/* Finish Stuff */
	FinishPoints = 0x8052A0C4;
	StopUpdatingPosTracker = 0x8052EB90;
	StopUpdatingPosTracker2 = 0x8053A484;
	StopUpdatingPosTracker3 = 0x8052F3BC;
	StopUpdatingPosTracker4 = 0x8052DDF0;
	StopUpdatingPosTracker5 = 0x80531A0C;
	StopUpdatingPosTracker6 = 0x8053A280;
	StopUpdatingTimer = 0x8052FD54;
	RaceAlonePatch = 0x8053A6D4;

	/* Force CC */
	ForceCCHook = 0x806594C8;

	/* Force Teams On */
	FixResults = 0x8064D100;
	ForceTeams = 0x8052B9E0;
	ResetSeeker = 0x8052B92C;

	/* Friend Room Race Count Modifier */
	FroomRaceCount1 = 0x8061C20A;
	FroomRaceCount2 = 0x8064D462;

	/* Glitch Prevention */
	DisableWallrideHook = 0x805757B4;
	DisableHWGHook = 0x8058EBC4;
	FallBoundaryHook1 = 0x80511A10;
	FallBoundaryHook2 = 0x80511A50;

	/* Go To Friends Menu Automatically */
	AutoFriendsMenu = 0x8061514B;
	AutoFriendsMenu2 = 0x8061A302;
	AutoFriendsMenu3 = 0x8061A206;

	/* Grumble Volcano Patches */
	RockFixHook = 0x806EE988;
	RockFix2Hook = 0x80805170;
	GeyserFixHook = 0x806E5814;

	/* Host Version Check */
	GuestSendHook = 0x800DBC98;
	HostCheckHook = 0x800DC3FC;
	DWCiCheckResvCommand = 0x800DE618;
	HostCheckHelperHook = 0x800DC310;
	Original30 = 0x80272D10;

	/* Improved Positioning */
	ForceInterpolation = 0x80585214;
	InterpolationHook = 0x8058522C;
	InterpolationHook2 = 0x8058540C;

	/* Increase Visual Distance */
	DrawDistance = 0x8088DBE0;

	/* Infinite Star */
	InfiniteStarHook = 0x80572EC4;
	InfiniteStarHook2 = 0x80579BA4;
	InfiniteStarHook3 = 0x80566B4C;
	StarFunc = 0x807A860C;
	StarFix = 0x807A863C;

	/* Instant Respawn */
	InstantRespawn1 = 0x8056EFD8;
	InstantRespawn2 = 0x805733C4;

	/* Invisibility */
	InvisibilityHook = 0x80653AAC;

	/* Item Hit Hooks */
	ItemHitLocalHook = 0x8056A330;
	ItemHitRemoteHook = 0x8065EBCC;
	DisconnectPlayer = 0x8052F23C;
	PlayerDCHook = 0x80654710;
	HitboxPatch1Hook = 0x8056A158;
	HitboxPatch2Hook = 0x8056A16C;

	/* Item Mod */
	ItemModHook = 0x807AB700;
	ItemRouletteHook = 0x807AB784;
	ItemRouletteHook2 = 0x807AB9C8;
	NoSpecialItems = 0x80790FB0;
	NoSpecialItems2 = 0x8065EDD0;

	/* License Unlocker */
	LicenseUnlocker = 0x80544438;

	/* Main Menu Mod */
	MainMenuButtonSetup = 0x8083100C;
	MainMenuCrashFixHook = 0x80831A18;
	MKChannelRedirect = 0x80831CB7;
	ResetText = 0x8060CBA8;

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
	BattleEnd = 0x807049B4;
	MusicPitch = 0x8089C9D0;
	FastMusicHook = 0x8070A03C;

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

	/* Online Menu Edits */
	NoWWButton1 = 0x8061866F;
	NoWWButton2 = 0x806186FC;
	NoWWButton3 = 0x80618724;
	NoWWButton4 = 0x8061873C;
	NoWWButton5 = 0x806188FF;
	NoWWButton6 = 0x8061892A;
	NoWWButton7 = 0x806189A2;
	NoWWButton8 = 0x80618C4B;
	BattleButton1 = 0x80619107;
	BattleButton2 = 0x8061911F;
	BattleButton3 = 0x8061945B;
	BattleButton4 = 0x805E3C88;
	VersionString1 = 0x80619292;
	VersionString2 = 0x806192A6;
	VersionString3 = 0x80619B0E;
	VersionString4 = 0x8062A272;
	VersionString5 = 0x805E3D72;
	VersionString6 = 0x805E3D96;
	VersionString7 = 0x805C75CA;
	VersionString8 = 0x805C8B4E;

	/* Remove Mushroom Bug */
	NoMushroomBug = 0x807AB617;

	/* Respawn Cooldown */
	RespawnCooldownHook = 0x8057B498;

	/* Reversed Timer */
	TimerManagerHook = 0x80531134;
	TimerEndManagerHook = 0x807ED680;
	TimerEndBranch = 0x807ED68A;

	/* Room Message Handler */
	HostFlagsHook = 0x806569E8;
	GuestFlagsHook = 0x80656AE8;
	FlagResetHook = 0x800D1A10;
	FlagResetHook2 = 0x800D18E0;
	FlagResetHook3 = 0x800D1CC4;
	FlagResetHook4 = 0x800D2C30;
	MessageButtons = 0x8062C907;
	MessageButtons2Hook = 0x8062B954;
	MessageButtons3Hook = 0x8062B2F0;
	MessageButtons4 = 0x8062C99B;
	MessageButtons5 = 0x8062B26B;
	MessageButtons6Hook = 0x8062D094;

	/* Screen Edits */
	ScreenLoadHook = 0x805FD978;
	ScreenLoadHook2 = 0x805FD1EC;
	CupScreenPatchHook = 0x808D3774;
	BattleCupScreenPatchHook = 0x808D60B4;
	BattleCupScreenPatch2 = 0x8061CEC0;
	ScreenDSIFix1Hook = 0x8081F84C;
	ScreenDSIFix2Hook = 0x808507B4;
	ScreenDSIFix3Hook = 0x808527F8;
	TrackVoteFix = 0x80612F1E;
	TrackVoteFix2 = 0x80612CB6;
	TrackVoteFix3 = 0x80659FF7;
	TrackVoteFix4 = 0x8065A03F;
	TrackVoteFix5 = 0x80612CB0;
	TimerShow = 0x8061CF40;
	TrackVoteLabel1 = 0x80825AE8;
	TrackVoteLabel2 = 0x808269D0;
	TrackVoteLabel3 = 0x80850648;
	TrackVoteLabel4 = 0x808506F0;
	TrackVoteLabel5 = 0x80852734;
	createScreen = 0x805F1E54;
	switchScreen = 0x8081F828;
	SceneSwapHook = 0x805F0F68;

	/* Seeker Picker */
	HNSDataHook = 0x8052BA60;
	HNSDataHook2 = 0x8052D5D8;

	/* Set Default Drift Type */
	DefaultDriftType = 0x80540E30;

	/* Spectator Mode */
	SpectatorModeHook = 0x805971F8;
	ReplayCameraHook = 0x80597888;
	BackwardsCameraHook = 0x8059720C;

	/* Speed Nullifier */
	StopperHook = 0x80574304;
	StopperHook2 = 0x80575158;
	StopperHook3 = 0x8057C108;

	/* Starting Time Modifier */
	TimerInit = 0x80530D9C;
	TimerInit2 = 0x80530D48;

	/* Tag Distance Modifier */
	TagDistanceHook = 0x807E586C;
	TagDistanceHook2 = 0x807E7ABC;
	TagShowHook = 0x807E6620;
	TagFunc = 0x807E5A1C;
	PlayAnim = 0x8060B4FC;
	TeamLineColors = 0x808A44CC;
	ZeroFloat = 0x808A4410;
}
