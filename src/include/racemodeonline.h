#pragma once
#include "common.h"
#include "raceinfo.h"

typedef struct {
    u8 packedBits[15];
    u8 _F;
    u8 localPlayerId[2];
    u8 _12;
    u8 localPlayerCount;
    u32 timeSinceLeaderFinish;
    u32 minimumRaceFinishTime;
    bool disconnecting;
    u8 _1D;
    u16 idleTimers[2];
    u16 idleCountdowns[2];
    u16 _26;
} RaceHeader2VS;

typedef struct {
    void* vtable;
    _Raceinfo *raceinfo;
} RaceMode;

typedef struct {
    RaceMode inherit;
    u8 unk[0xF0];
    RaceHeader2VS outPacket;
    u8 unk2[0x54];
} RaceModeOnlineVs; // Total size 0x174

RaceHeader2VS* GetRaceHeader2Buffer(u32 param_1, u32 playerId);
void clearSendRH2(u32 ptr_miscPacketHandler);
