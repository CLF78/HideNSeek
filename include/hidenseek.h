#pragma once
#include <common.h>

typedef struct {
 	u8 position, isSeeker, isRealSeeker, respawnTimer;
} HideNSeekPlayer;

typedef struct {
	u8 playerCount, totalSurvivors, totalSeekers, isInfection;
    HideNSeekPlayer players[12];
} _HideNSeekData;

extern _HideNSeekData HideNSeekData;
extern char SeekerCount, PrevSeekers[2], IsInfection, HalfTimer, GlitchesAllowed, BtGlitch, AlwaysWinVote, AlwaysSeeker, SpectatorMode, CurrentSpectated, AmIDead, EndReason, Have30SecondsPassed, UseReplayCams, UseBackwardsView;
