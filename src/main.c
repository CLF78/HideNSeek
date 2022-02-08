#include "common.h"

// Forward declarations
void CupScreenPatch();
void BattleCupScreenPatch();

// This function loads all the codes that HideNSeek uses after StaticR has loaded
void loadCodes() {

	// These values will be used as filler throughout the function
	u8 tempVal8;
	u16 tempVal16;
	u32 tempVal32;

	// Exception Handler (by Star)
	directWrite32(ShowExceptions, 0);

	// Wiimmfi Code Patches (by Leseratte)
	directWriteNop(WiimmfiPatch1);
	directWrite32(WiimmfiPatch2, 0x3BC00000);
	directWriteBranch(WiimmfiPatch3, WiimmfiASM1, false);
	directWriteBranch(WiimmfiPatch4, WiimmfiASM2, false);

	// Wiimmfi Domain Name Patches (by Seeky)
	directWriteString(WiimmfiVersionString, "LE-CODE GCT v1 ");
	directWriteString(WiimmfiURLs, "://ca.nas.wiimmfi.de/ca");
	directWriteStringOffset(WiimmfiURLs, 0x28, "://naswii.wiimmfi.de/ac");
	directWriteStringOffset(WiimmfiURLs, 0xA8, "://naswii.wiimmfi.de/pr");

	#ifdef REGION_P
	directWriteStringOffset(WiimmfiURLs, 0x4C, "://main.nas.wiimmfi.de/pp");
	#elif REGION_E
	directWriteStringOffset(WiimmfiURLs, 0x4C, "://main.nas.wiimmfi.de/pe");
	#elif REGION_J
	directWriteStringOffset(WiimmfiURLs, 0x4C, "://main.nas.wiimmfi.de/pj");
	#elif REGION_K
	directWriteStringOffset(WiimmfiURLs, 0x4C, "://main.nas.wiimmfi.de/pk");
	#endif

	directWriteStringOffset(WiimmfiURLs, 0x964, "wiimmfi.de"); // Available
	directWriteStringOffset(WiimmfiURLs, 0x10D4, "wiimmfi.de"); // GPCM
	directWriteStringOffset(WiimmfiURLs, 0x1AEC, "wiimmfi.de"); // GPSP
	directWriteStringOffset(WiimmfiURLs, 0x2C8D, "wiimmfi.de"); // Master
	directWriteStringOffset(WiimmfiURLs, 0x38A7, "wiimmfi.de"); // Natneg
	directWriteStringOffset(WiimmfiURLs, 0x38C3, "wiimmfi.de");
	directWriteStringOffset(WiimmfiURLs, 0x38DF, "wiimmfi.de");
	directWriteStringOffset(WiimmfiURLs, 0x3A2F, "wiimmfi.de"); // MS
	directWriteStringOffset(WiimmfiURLs, 0x3AB3, "wiimmfi.de"); // SAKE

	// Wiimmfi Login Region Changer (by Atlas)
	directWriteString(LoginRegion, "120053");

	// VS Matchmaking Region Patch (by Leseratte)
	tempVal32 = 0x38E04E55;
	directWrite32(VSRegion, 0x38A04E55);
	directWrite32(VSRegion2, tempVal32);
	directWrite32Offset(VSRegion2, 0x518, tempVal32);
	directWrite32(VSRegion3, 0x38800055);

	// Always Win Track Vote (by Star, modified by Seeky & CLF78)
	directWriteBranch(AlwaysWinVoteHook, VotePatch, true);

	// Automatic BRSAR Patching (by Elias)
	directWriteBranch(AutoBRSARHook, AutoBRSAR, true);

	// Battle Arena Fixes (by CLF78)
	directWriteBranch(BattleStartFixHook, BattleStartFix, true);
	directWriteBranch(BattleCCFixHook, BattleCCFix, true);
	directWriteBranch(BattleRespawnFixHook, BattleRespawnFixASM, false);

	// Battle Close-up Camera (by tZ and CLF78)
	directWrite8(BattleCamera, 1);
	directWrite8Offset(BattleCamera, 0x494, 1);

	// Disable 5:56 Disconnection (by Ro)
	tempVal16 = 0x4800;
	directWrite16(No556DC, tempVal16);

	// Disable Lakitu When Going Backwards (by CLF78)
	directWrite16(NoLakitu, tempVal16);

	// Disable Lap Counting (by Vega, modified by CLF78)
	directWrite16(NoLaps, tempVal16);

	// Disable Luma (by CLF78)
	directWrite16(NoLuma, tempVal16);

	// Disable Star Power Music (by Anarion and Dea)
	directWriteNop(NoStarMusic);
	directWriteBranch(NoStarMusic2Hook, NoStarMusic2, true);

	// Disable Title Demo Movie (by Diamond)
	directWrite16(NoTitleDemo, tempVal16);

	// Disable Various HUD Elements (by CLF78)
	directWriteBranch(HUDEditsHook, HideHUD, true);

	// Enable Score (by CLF78)
	directWrite32(InitScore, 0x809F01A0);
	directWriteBranch(UpdateScoreHook, UpdateScore, true);
	directWrite16(FixScoreColor, tempVal16);
	directWriteBranchOffset(UpdateScoreHook, 0x34, ScoreSoundASM, false); // Fixes sound

	// End Race on Command (by CLF78 and Leseratte)
	directWriteBranch(No5LimitHook, TimerEnd, false);
	directWrite8(FinishPoints, 1);
	directWrite8Offset(FinishPoints, 0xA0, 1);
	directWrite8Offset(FinishPoints, 0x1BC, 1);
	directWrite32Offset(FinishPoints, 0x229, 0x4800001C);
	directWrite32(StopUpdatingTimer, 0x48000020);
	directWriteBlr(StopUpdatingPosTracker);
	directWrite16(StopUpdatingPosTracker2, tempVal16);
	directWriteNopOffset(StopUpdatingPosTracker2, 0x204);
	directWrite32(StopUpdatingPosTracker3, 0x38000000);
	directWriteNop(StopUpdatingPosTracker4);
	directWrite32(FixStartPosition, 0x3BE60001);
	directWriteBlr(RaceAlonePatch);
	directWrite8(NoCheckpointsFix, 1);

	// Force 150cc (by XeR, modified by CLF78)
	directWriteBranch(ForceCCHook, ForceCC, true);

	// Force Teams On (by CLF78)
	directWrite32(FixResults, 0x38000000); // Disables team colors in the final room results
	directWrite32(ResetSeeker, 0x38C00001); // Forces blue team on each player (written later)
	directWrite32Offset(ResetSeeker, 0xB4, 0x38E00002); // Forces teams mode

	// Friend Room Race Count Modifier (by MrBean)
	directWriteBranch(FroomRaceCount1, RaceCountMod, true);
	directWriteBranch(FroomRaceCount2, RaceCountMod, true);

	// Glitch Prevention (by MrBean, stebler and CLF78)
	directWriteBranch(DisableWallrideHook, DisableWallride, true);
	directWriteBranch(DisableHWGHook, DisableHWG, false);

	// Go To Friends Menu Automatically (by Chadderz)
	directWrite8(AutoFriendsMenu, 0x8D);
	directWrite16(AutoFriendsMenu2, 0x28);
	directWrite16(AutoFriendsMenu3, 0x30);

	// Host Version Check (by CLF78 & Seeky)
	directWriteBranch(GuestSendHook, GuestSend, false);
	directWriteBranch(HostCheckHook, HostCheck, true);
	directWriteBranch(HostCheckHelperHook, HostCheckHelper, true);
	directWrite8(Version, 5);

	// Improved Position Interpolation (by stebler)
	directWrite32(NoInterpolation, 0x3F800000);

	// Increase Visual Distance (by davidevgen)
	directWrite32(DrawDistance, 0x49742400);

	// Infinite Star Timer + No Star Invincibility (by CLF78)
	directWrite32(InfiniteStarHook, 0x7C601B78);
	directWrite32(InfiniteStarHook2, 0x48000044);
	directWriteNop(NoStarInvincibility); // enable damage from items
	directWrite8Offset(NoStarInvincibility, 4, 0x54);
	directWrite8(NoStarInvincibility2, 0); // enable damage from objects
	directWriteNop(NoStarInvincibility3); // enable damage from players
	directWrite8Offset(NoStarInvincibility3, 5, 0xA0);
	directWrite16Offset(StarFunc, 0x74, tempVal16); // remove offroad invincibility

	// Instant Respawn + Respawn Cooldown (by davidevgen, CLF78 and stebler)
	directWrite8(InstantRespawn1, 0);
	directWriteBranch(InstantRespawn2, RespawnCooldown, true);

	// Invisibility (by CLF78)
	directWriteBranch(InvisibilityHook, Invisibility, true);

	// Item Hit Hooks (by CLF78 & stebler)
	directWriteBranch(ItemHitLocalHook, ItemHitLocalHelper, false);
	directWriteBranch(HitboxPatch1Hook, HitboxPatch1, true);
	directWriteBranch(HitboxPatch2Hook, HitboxPatch2, true);
	directWriteBranch(ItemHitRemoteHook, ItemHitRemote, true);
	directWriteBranch(PlayerDCHook, PlayerDC, false);

	// Item Mod (by CLF78 & XeR)
	directWriteBranch(ItemModHook, ItemMod, true);
	directWriteBranch(ItemRouletteHook, ItemMod, true);
	directWriteBranch(ItemRouletteHook2, ItemMod, true);
	directWriteBlr(NoSpecialItems);
	directWrite32(NoSpecialItems2, 0x3A200020);

	// Kill Data (by CLF78)
	directWriteBranch(InitKillDataHook, InitKillData, true);
	directWrite16(NoKillDataHide, tempVal16);

	// KMP - Track Identifier (by CLF78)
	directWriteBranch(TrackIdentifierHook, TrackIdentifier, false);
	directWrite32(TrackIdentifierHook2, 0x48000010);	// These initialize the ENPH/ENPT sections before the others so other sections can use the ENPT CRC to apply patches
	directWriteBranchOffset(TrackIdentifierHook2, 0x30, TrackIdentifier2, false);
	directWriteBranchOffset(TrackIdentifierHook2, 0xC, TrackIdentifier3, false);

	// KMP Injector - AREA (by CLF78)
	directWriteBranch(AREAHook, AREA1, true);
	directWriteBranchOffset(AREAHook, 0x40, AREA2, true);

	// KMP Patcher - GOBJ Fixes (by CLF78 & Ismy)
	directWriteBranch(GOBJRockFixHook, GOBJRockFix, true);
	directWriteBranch(GOBJRockFix2Hook, GOBJRockFix, true);
	directWriteBranch(GOBJGeyserFixHook, GOBJGeyserFix, true);
	directWriteBranch(GOBJTwanwanFixHook, GOBJTwanwanFix, true);
	directWriteBranchOffset(GOBJTwanwanFixHook, 0xC, GOBJTwanwanFix2, true);
	directWriteBranch(GOBJVenicenamiFixHook, GOBJVenicenamiFix, true);
	directWriteBranch(GOBJVenicesakuFixHook, GOBJVenicesakuFix, true);
	directWriteBranch(GOBJVenicehasiFixHook, GOBJVenicehasiFix, true);

	// License Unlocker (by _tZ)
	directWrite32(LicenseUnlocker, 0x38600001);

	// Main Menu Mod (by CLF78)
	directWriteBranch(MainMenuButtonSetup, MainMenuButtonSetup1, true); // Hides offline options and moves Wifi+Channel ones
	directWrite8Offset(MainMenuButtonSetup, 0x2B, 0); // Disables the buttons for the hidden options
	directWrite32Offset(MainMenuButtonSetup, 0x30, 0x480006DC);
	directWrite8Offset(MainMenuButtonSetup, 0x127, 0);
	directWrite32Offset(MainMenuButtonSetup, 0x12C, 0x480005E0);
	directWrite8Offset(MainMenuButtonSetup, 0x413, 1); // Disables 2P Wifi button
	directWrite8Offset(MainMenuButtonSetup, 0x48F, 0x18); // Expands 1P Wifi button to fill the empty space
	directWrite8Offset(MainMenuButtonSetup, 0x4F7, 0xA4); // Fixes THP cropping
	directWriteBranchOffset(MainMenuButtonSetup, 0x504, MainMenuButtonSetup2, false); // Removes text inside 1P Wifi button
	directWriteBranch(MainMenuCrashFixHook, MainMenuCrashFix, true); // Changes default button selection to prevent crashes
	directWrite8(MKChannelRedirect, 0x3B); // Redirects MK Channel to the Credits Part 2 scene

	// Message Editor (by WhatIsLoaf & CLF78)
	directWriteBranch(MessageEditorHook, MessageEditor, false);
	directWriteBranch(MessageEditorHook2, MessageEditor2, true);

	// Music Patches (by CLF78)
	directWriteNop(BattleCountdown);
	directWriteBranch(TimerFlash, TimerFlashFix, false);
	directWriteNop(BattleEnd);
	directWriteBranch(FastMusicHook, FastMusic, true);

	// No Clip (by Melg, modified by CLF78)
	directWriteBranch(NoClipHook, NoClip, true);
	directWriteNopOffset(NoClipHook, 0x698);
	directWriteNopOffset(NoClipHook, 0x6B8);

	// No Disconnect (by Bully)
	tempVal32 = 0x38000000;
	directWrite32(NoDisconnect1, tempVal32);
	directWrite32(NoDisconnect2, tempVal32);
	directWrite32(NoDisconnect3, tempVal32);
	directWrite32(NoDisconnect4, tempVal32);

	// Online Menu Edits (by CLF78 & Chadderz)
	directWrite8(NoWWButton1, 5);
	directWriteNop(NoWWButton2);
	directWriteNop(NoWWButton3);
	directWrite32(NoWWButton4, 0x48000010);
	directWrite8(NoWWButton5, 1);
	tempVal16 = 0x484;
	directWrite16(NoWWButton6, tempVal16);
	directWrite16(NoWWButton7, tempVal16);
	directWrite8(NoWWButton8, 0x18);
	directWrite8(BattleButton1, 0x18);
	directWrite8(BattleButton2, 0x6A);
	directWrite8(BattleButton3, 0x10);
	directWrite16(BattleButton4, 0x4800);
	tempVal16 = 8422;
	directWrite16(VersionString1, tempVal16);
	directWrite16(VersionString2, tempVal16);
	directWrite16(VersionString3, tempVal16);
	directWrite16(VersionString4, tempVal16);
	directWrite16(VersionString5, tempVal16);
	directWrite16(VersionString6, tempVal16);
	directWrite16(VersionString7, tempVal16);
	directWrite16(VersionString8, tempVal16);

	// Remove Mushroom Bug (by Vega)
	directWrite8(NoMushroomBug, 0);

	// Reversed Timer (by CLF78)
	directWriteBranch(TimerManagerHook, MainTimerUpdate, true);
	directWriteBranch(TimerEndManagerHook, TimerEndManager, true);
	directWrite16(TimerEndBranch, 0x98);

	// Room Message Handler (by CLF78)
	directWriteBranch(HostFlagsHook, HostFlags, false);
	directWriteBranch(GuestFlagsHook, GuestFlags, false);
	directWriteBranch(FlagResetHook, FlagReset, false);
	directWriteBranch(FlagResetHook2, FlagReset, false);
	directWriteBranch(FlagResetHook3, FlagReset, false);
	directWriteBranch(FlagResetHook4, FlagReset, false);
	directWrite8(MessageButtons, 0x6C);
	directWriteArray(MessageButtons2Hook, MessageButtons2, 8);
	directWriteBranch(MessageButtons3Hook, MessageButtons3, false);
	tempVal8 = 2;
	directWrite8(MessageButtons4, tempVal8);
	directWrite8(MessageButtons5, tempVal8);
	directWriteBranch(MessageButtons6Hook, MessageButtons6, true);
	directWriteBranch(SceneSwapHook, SceneSwap, true);

	// Screen Edits (by CLF78 & Kevin)
	directWriteBranch(ScreenLoadHook, ScreenLoad, false);
	directWriteBranch(ScreenLoadHook2, ScreenLoad, false);
	directWriteBranch(ScreenDSIFix1Hook, ScreenDSIFix1, false);
	directWriteBranch(ScreenDSIFix2Hook, ScreenDSIFix2, true);
	directWriteBranch(ScreenDSIFix3Hook, ScreenDSIFix2, true);
	directWrite32(CupScreenPatchHook, (u32)&CupScreenPatch);
	directWrite32(BattleCupScreenPatchHook, (u32)&BattleCupScreenPatch);
	directWriteNop(BattleCupScreenPatch2);
	directWrite16(TrackVoteFix, 0x14);
	directWrite16(TrackVoteFix2, 0x4C);
	directWrite8(TrackVoteFix3, 0x2A);
	directWrite8(TrackVoteFix4, 0x29);
	directWriteNop(TrackVoteFix5);
	directWriteNop(TimerShow);
	tempVal16 = 0x4800;
	directWrite16(TrackVoteLabel1, tempVal16);
	directWrite16(TrackVoteLabel2, tempVal16);
	tempVal32 = 0x38600D23;
	directWrite32(TrackVoteLabel3, tempVal32);
	directWrite32(TrackVoteLabel4, tempVal32);
	directWrite32(TrackVoteLabel5, tempVal32);

	// Seeker Picker (by CLF78)
	directWriteBranch(HNSDataHook, SetupHNS, false);
	directWriteBranch(HNSDataHook2, DeleteHNS, false);

	// Set Default Drift Type (by CLF78)
	directWrite32(DefaultDriftType, 0x38600001);

	// Spectator Mode (by tZ, Skullface, Geeh, EvilRobot and JoshuaMK, modified by CLF78)
	directWriteBranch(SpectatorModeHook, SpectatorModeFunc, false);
	directWriteBranch(ReplayCameraHook, ReplayCameraManager, true);
	directWriteBranch(BackwardsCameraHook, BackwardsCameraManager, true);

	// Speed Nullifier (by tZ and CLF78)
	directWriteBranch(StopperHook, Stopper1, false);
	directWriteBranch(StopperHook2, Stopper2, false);
	directWriteBranch(StopperHook3, Stopper3, false);
	directWriteBranch(StopperHook4, Stopper4, false);

	// Starting Time Modifier (by Bully, modified by CLF78)
	directWriteBranch(TimerInit, StartingTime, true);
	directWriteBranch(TimerInit2, StartingTime2, true);

	// Tag Modifier (by CLF78)
	directWriteBranch(TagDistanceHook, TagDistanceFunc, true);
	directWriteBranch(TagDistanceHook2, TagDistanceFunc, true);
	directWriteBranch(TagShowHook, HandleTags, true);

	// Disable Track Music (by CosmoCourtney)
	if (NoMusic == 1) {
		directWrite32(NoMusicHook, 0x38600000);
	}

	// 30 FPS (by CLF78)
	if (ThirtyFPS == 1) {
		directWrite32(ThirtyFPSHook, 0x3BE00002);
		directWrite8Offset(ThirtyFPSHook, 0x397, 2);
		directWriteNopOffset(ThirtyFPSHook, 0x3A0);
	}

	sync();
	isync();
}
