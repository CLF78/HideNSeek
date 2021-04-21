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

	// Always Win Track Vote (by Star, modified by Seeky & CLF78)
	directWriteBranch(AlwaysWinVoteHook, VotePatch, true);

	// Automatic BRSAR Patching (by Elias)
	directWriteBranch(AutoBRSARHook, AutoBRSAR, true);

	// Battle Arena Fixes (by CLF78)
	directWriteBranch(BattleSpawnFixHook, BattleSpawnFix, true);
	directWriteBranch(BattleCCFixHook, BattleCCFix, true);
	directWrite16(BattleCCFix2, 0x40A1);

	// Decrement Screen Elements (by stebler)
	directWriteBranch(DecrementScreenElements, HideHUD, false);

	// Disable Position, Lap and Minimap (by CLF78)
	tempVal16 = 0x4800;
	directWrite16(DisablePosition, tempVal16);
	directWrite16(DisableLap, tempVal16);
	directWrite16(DisableMap, tempVal16);

	// Disable 5:56 Disconnection (by CLF78)
	directWrite16(No556DC, tempVal16);

	// Disable Lap Counting (by Vega, modified by CLF78)
	directWrite16(NoLaps, tempVal16);

	// Disable Luma (by CLF78)
	directWrite16(NoLuma, tempVal16);

	// Disable Lakitu When Going Backwards (by CLF78)
	directWrite16(NoLakitu, tempVal16);

	// Disable Star Power Music (by Anarion)
	directWriteNop(NoStarMusic);

	// Disable Title Demo Movie (by Diamond)
	directWrite16(NoTitleDemo, tempVal16);

	// Disable Wheelie (by Luis, modified by CLF78)
	directWriteBranch(DisableWheelieHook, DisableWheelie, true);

	// Enable Score (by CLF78)
	directWriteNop(EnableScore);
	directWriteBranch(UpdateScoreHook, UpdateScore, true);
	directWrite16(FixScoreColor, tempVal16);
	directWriteNop(FixScoreSound);

	// End Race on Command (by CLF78)
	directWriteBranch(No5LimitHook, TimerEnd, false);

	// Finish Position/Points Updater (by CLF78)
	directWrite32(FinishPoints, 0x48000014);
	directWriteBranch(FixPositionsHook, FixPositionsHelper, false);

	// Force 150cc (by XeR, modified by CLF78)
	directWriteBranch(ForceCCHook, ForceCC, true);

	// Force Teams On (by CLF78)
	directWrite32(FixResults, 0x38000000);
	directWrite32(ForceTeams, 0x38E00002);
	directWrite32(ResetSeeker, 0x38C00001);

	// Friend Room Race Count Modifier (by MrBean)
	directWrite16(FroomRaceCount1, 1);
	directWrite16(FroomRaceCount2, 1);

	// Go To Friends Menu Automatically (by Chadderz)
	directWrite8(AutoFriendsMenu, 0x8D);
	directWrite16(AutoFriendsMenu2, 0x28);
	directWrite16(AutoFriendsMenu3, 0x30);

	// Grumble Volcano Fixes (by CLF78 & Ismy)
	directWriteArray(RockFixHook, RockFix, 8);
	directWriteArray(RockFix2Hook, RockFix, 8);
	directWriteBranch(GeyserFixHook, GeyserFix, true);

	// Host Version Check (by CLF78 & Seeky)
	directWriteBranch(GuestSendHook, GuestSend, false);
	directWriteBranch(HostCheckHook, HostCheck, true);
	directWriteBranch(HostCheckHelperHook, HostCheckHelper, true);
	directWrite8(Version, 1);

	// Increase Visual Distance (by davidevgen)
	directWrite32(DrawDistance, 0x49742400);

	// Infinite Star Timer (by CLF78)
	directWrite32(InfiniteStarHook, 0x7C601B78);
	directWrite32(InfiniteStarHook2, 0x7C802378);

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

	// Remove Mushroom Bug (by Vega)
	directWrite8(NoMushroomBug, 0);

	// Respawn Cooldown (by CLF78 & stebler)
	directWriteBranch(RespawnCooldownHook, RespawnCooldown, true);

	// Reversed Timer (by CLF78)
	directWriteBranch(TimerManagerHook, MainTimerUpdate, true);

	// Room Message Handler (by CLF78)
	directWriteBranch(HostFlagsHook, HostFlags, false);
	directWriteBranch(GuestFlagsHook, GuestFlags, false);
	directWriteBranch(FlagResetHook, FlagReset, false);

	// Screen Edits (by CLF78 & Kevin, currently disabled)
	// directWriteBranch(ScreenLoadHook, ScreenLoad, false);
	// directWriteBranch(ScreenDSIFix1Hook, ScreenDSIFix1, false);
	// directWriteBranch(ScreenDSIFix2Hook, ScreenDSIFix2, true);
	// directWriteBranch(ScreenDSIFix3Hook, ScreenDSIFix2, true);
	// directWrite32(CupScreenPatchHook, (u32)&CupScreenPatch);
	// directWrite32(BattleCupScreenPatchHook, (u32)&BattleCupScreenPatch);
	// directWrite16(TrackVoteFix, 0x14);
	// directWrite16(TrackVoteFix2, 0x4C);
	// directWrite8(TrackVoteFix3, 0x2A);
	// directWrite8(TrackVoteFix4, 0x29);
	// directWriteNop(TrackVoteFix5);

	// Seeker Picker (by CLF78)
	directWriteBranch(HNSDataHook, SetupHNS, false);
	directWriteBranch(HNSDataHook2, DeleteHNS, false);

	// Spectator Mode (by tZ & Skullface, modified by CLF78)
	directWriteBranch(SpectatorModeHook, SpectatorModeFunc, false);
	directWriteBranch(ReplayCameraHook, ReplayCameraManager, true);

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

	sync();
	isync();
}
