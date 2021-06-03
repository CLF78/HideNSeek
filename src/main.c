#include "common.h"
#include "exception.h"

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
	directWrite16(ExcDispInfo, (u16)(EXCEPTION_INFO_DEFAULT | EXCEPTION_INFO_GPR));

	// Wiimmfi Code Patches (by Leseratte)
	directWriteNop(WiimmfiPatch1);
	directWrite32(WiimmfiPatch2, 0x3BC00000);
	directWriteBranch(WiimmfiPatch3, WiimmfiASM1, false);
	directWriteBranch(WiimmfiPatch4, WiimmfiASM2, false);

	// Wiimmfi Domain Name Patches (by Seeky)
	directWriteString(WiimmfiVersionString, "LE-CODE GCT v1 ");
	directWriteString(NaswiiURL, "://ca.nas.wiimmfi.de/ca");
	directWriteString(NaswiiURL2, "://naswii.wiimmfi.de/ac");
	directWriteString(NaswiiURL3, "://naswii.wiimmfi.de/pr");

	#ifdef REGION_P
	directWriteString(NaswiiURL4, "://main.nas.wiimmfi.de/pp");
	#elif REGION_E
	directWriteString(NaswiiURL4, "://main.nas.wiimmfi.de/pe");
	#elif REGION_J
	directWriteString(NaswiiURL4, "://main.nas.wiimmfi.de/pj");
	#elif REGION_K
	directWriteString(NaswiiURL4, "://main.nas.wiimmfi.de/pk");
	#endif

	directWriteString(AvailableURL, "wiimmfi.de");
	directWriteString(GPCMURL, "wiimmfi.de");
	directWriteString(GPSPURL, "wiimmfi.de");
	directWriteString(MasterURL, "wiimmfi.de");
	directWriteString(NatnegURL, "wiimmfi.de");
	directWriteString(NatnegURL2, "wiimmfi.de");
	directWriteString(NatnegURL3, "wiimmfi.de");
	directWriteString(MSURL, "wiimmfi.de");
	directWriteString(GSURL, "wiimmfi.de");

	// Wiimmfi Login Region Changer (by Atlas)
	directWriteString(LoginRegion, "120053");

	// VS Matchmaking Region Patch (by Leseratte)
	tempVal32 = 0x38E04E55;
	directWrite32(VSRegion, 0x38A04E55);
	directWrite32(VSRegion2, 0x38C04E55);
	directWrite32(VSRegion3, tempVal32);
	directWrite32(VSRegion4, tempVal32);
	directWrite32(VSRegion5, tempVal32);
	directWrite32(VSRegion6, tempVal32);
	directWrite32(VSRegion7, 0x38800055);
	directWrite32(VSRegion8, 0x38800055);

	// Always Win Track Vote (by Star, modified by Seeky & CLF78)
	directWriteBranch(AlwaysWinVoteHook, VotePatch, true);

	// Automatic BRSAR Patching (by Elias)
	directWriteBranch(AutoBRSARHook, AutoBRSAR, true);

	// Battle Arena Fixes (by CLF78)
	directWriteBranch(BattleSpawnFixHook, BattleSpawnFix, true);
	directWriteBranch(BattleCCFixHook, BattleCCFix, true);
	directWrite16(BattleCCFix2, 0x41A0);

	// Battle Close-up Camera (by tZ)
	directWrite8(BattleCamera, 1);

	// Decrement Screen Elements (by stebler)
	directWriteBranch(DecrementScreenElements, HideHUD, false);

	// Disable Position, Lap and Minimap (by CLF78)
	tempVal16 = 0x4800;
	directWrite16(DisablePosition, tempVal16);
	directWrite16(DisableLap, tempVal16);
	directWrite16(DisableMap, tempVal16);

	// Disable 5:56 Disconnection (by CLF78)
	directWrite16(No556DC, tempVal16);

	// Disable Lakitu When Going Backwards (by CLF78)
	directWrite16(NoLakitu, tempVal16);

	// Disable Lap Counting (by Vega, modified by CLF78)
	directWrite16(NoLaps, tempVal16);

	// Disable Luma (by CLF78)
	directWrite16(NoLuma, tempVal16);

	// Disable Star Power Music (by Anarion)
	directWriteNop(NoStarMusic);

	// Disable Title Demo Movie (by Diamond)
	directWrite16(NoTitleDemo, tempVal16);

	// Enable Score (by CLF78)
	directWriteNop(EnableScore);
	directWriteBranch(UpdateScoreHook, UpdateScore, true);
	directWrite16(FixScoreColor, tempVal16);
	directWriteNop(FixScoreSound);

	// End Race on Command (by CLF78)
	directWriteBranch(No5LimitHook, TimerEnd, false);

	// Finish Position/Points Updater (by CLF78 and Leseratte)
	directWrite32(FinishPoints, 0x48000014);
	directWrite32(StopUpdatingTimer, 0x4800001C);
	directWriteBlr(StopUpdatingPosTracker);
	directWriteNop(StopUpdatingPosTracker2);
	directWrite32(StopUpdatingPosTracker3, 0x38000000);
	directWriteNop(StopUpdatingPosTracker4);
	directWrite32(StopUpdatingPosTracker5, 0x3BE60001);
	directWrite16(StopUpdatingPosTracker6, tempVal16);
	directWriteNop(RaceAlonePatch);

	// Force 150cc (by XeR, modified by CLF78)
	directWriteBranch(ForceCCHook, ForceCC, true);

	// Force Teams On (by CLF78)
	directWrite32(FixResults, 0x38000000);
	directWrite32(ForceTeams, 0x38E00002);
	directWrite32(ResetSeeker, 0x38C00001);

	// Friend Room Race Count Modifier (by MrBean)
	directWrite16(FroomRaceCount1, 1);
	directWrite16(FroomRaceCount2, 1);

	// Glitch Prevention (by MrBean, stebler and CLF78)
	directWriteBranch(DisableWallrideHook, DisableWallride, true);
	directWriteBranch(DisableHWGHook, DisableHWG, true);
	directWriteBranch(FallBoundaryHook1, FallBoundary1, true);
	directWriteBranch(FallBoundaryHook2, FallBoundary2, true);

	// Go To Friends Menu Automatically (by Chadderz)
	directWrite8(AutoFriendsMenu, 0x8D);
	directWrite16(AutoFriendsMenu2, 0x28);
	directWrite16(AutoFriendsMenu3, 0x30);

	// Grumble Volcano Fixes (by CLF78 & Ismy)
	directWriteBranch(RockFixHook, RockFix, true);
	directWriteBranch(RockFix2Hook, RockFix, true);
	directWriteBranch(GeyserFixHook, GeyserFix, true);

	// Host Version Check (by CLF78 & Seeky)
	directWriteBranch(GuestSendHook, GuestSend, false);
	directWriteBranch(HostCheckHook, HostCheck, true);
	directWriteBranch(HostCheckHelperHook, HostCheckHelper, true);
	directWrite8(Version, 4);

	// Improved Position Interpolation (by CLF78, Leseratte & stebler)
	directWriteNop(ForceInterpolation);
	directWriteBranch(InterpolationHook, InterpFunc, false);
	directWriteBranch(InterpolationHook2, InterpFunc2, false);

	// Increase Visual Distance (by davidevgen)
	directWrite32(DrawDistance, 0x49742400);

	// Infinite Star Timer (by CLF78)
	directWrite32(InfiniteStarHook, 0x7C601B78);
	directWrite32(InfiniteStarHook2, 0x7C802378);
	directWrite32(InfiniteStarHook3, 0x48000044);
	directWrite16(StarFix, tempVal16);

	// Instant Respawn (by davidevgen)
	directWrite32(InstantRespawn1, 0x3800FFC3);
	directWrite32(InstantRespawn2, 0x3803FFFF);

	// Invisibility (by CLF78)
	directWriteBranch(InvisibilityHook, Invisibility, true);

	// Item Hit Hooks (by CLF78 & stebler)
	directWriteBranch(ItemHitLocalHook, ItemHitLocalHelper, false);
	directWriteBranch(HitboxPatch1Hook, HitboxPatch1, true);
	directWriteBranch(HitboxPatch2Hook, HitboxPatch2, true);
	directWriteBranch(ItemHitRemoteHook, ItemHitRemote, true);
	directWriteBranch(PlayerDCHook, PlayerDC, false);

	// Item Mod (by CLF78)
	directWriteBranch(ItemModHook, ItemMod, true);
	directWriteBranch(ItemRouletteHook, ItemMod, true);
	directWriteBranch(ItemRouletteHook2, ItemMod, true);
	directWriteBlr(NoSpecialItems);
	
	// License Unlocker (by _tZ)
	directWrite32(LicenseUnlocker, 0x38600001);

	// Message Editor (by WhatIsLoaf & CLF78)
	directWriteBranch(MessageEditorHook, MessageEditor, false);
	directWriteBranch(MessageEditorHook2, MessageEditor2, true);
	directWriteBranch(MessageEditorHook3, MessageEditor3, true);
	directWriteBranch(MessageEditorHook4, MessageEditor3, true);

	// Music Patches (by CLF78)
	directWriteNop(BattleCountdown);
	directWriteBranch(TimerFlash, TimerFlashFix, false);
	directWriteNop(BattleEnd);
	directWriteBranch(FastMusicEnableHook, FastMusicEnable, true);
	directWriteBranch(FastMusicDisableHook, FastMusicDisable, true);

	// Mute Characters (by Melg, modified by CLF78)
	directWriteBranch(MuteCharsHook, MuteChars, true);
	directWriteBranch(MuteCharsHook2, MuteChars2, true);
	directWriteNop(MuteCharsHook3);

	// No Clip (by Melg, modified by CLF78)
	directWriteBranch(NoClipHook, NoClip, true);

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

	// Respawn Cooldown (by CLF78 & stebler)
	directWriteBranch(RespawnCooldownHook, RespawnCooldown, true);

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
	directWriteBranch(ScreenDSIFix4Hook, ScreenDSIFix3, false);
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
	directWriteBranch(MainMenuFix1, MainMenuFix1Dest, false);
	directWrite32(MainMenuFix2, 0x38000004);
	directWrite32(MainMenuFix3, 0x38800004);
	directWrite32(MainMenuFix4, 0x3800FF9C);

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
	directWriteBranch(StopperHook3, Stopper3, true);

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
		directWrite32(ThirtyFPSHook4, 0x3BE00002);
		directWriteNop(ThirtyFPSHook5);
		directWrite8(ThirtyFPSHook6, 2);
	}

	// Disable Track Patches (by CLF78)
	if (CTSupport == 1){
		directWrite32(PatchFilename, 0x5F434C46);
	}

	sync();
	isync();
}
