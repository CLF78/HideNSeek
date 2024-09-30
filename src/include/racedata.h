#pragma once
#include "common.h"

// Documentation by Seeky, TheLordScruffy, WhatIsLoaf and riidefi

typedef enum {
    PLAYER_REAL_LOCAL,
    PLAYER_CPU,
    PLAYER_UNKNOWN2,
    PLAYER_GHOST,
    PLAYER_REAL_ONLINE,
    PLAYER_NONE,
} PlayerType;

typedef enum {
    TEAM_RED,
    TEAM_BLUE,
	TEAM_NONE,
} Team;

typedef enum {
    BATTLE_BALLOON,
    BATTLE_COIN,
} BattleType;

typedef enum {
    CPU_EASY,
    CPU_NORMAL,
    CPU_HARD,
    CPU_NONE,
} CpuMode;

typedef enum {
    MODE_GRAND_PRIX,
    MODE_VS_RACE,
    MODE_TIME_TRIAL,
    MODE_BATTLE,
    MODE_MISSION_TOURNAMENT,
    MODE_GHOST_RACE,
    MODE_6,
    MODE_PRIVATE_VS,
    MODE_PUBLIC_VS,
    MODE_PUBLIC_BATTLE,
    MODE_PRIVATE_BATTLE,
    MODE_AWARD,
    MODE_CREDITS,
} GameMode;

typedef enum {
    TYPE_TT,
    TYPE_CPU_RACE = 5,
    TYPE_ONLINE_SPECTATOR,
} GameType;

typedef enum {
    CC_50,
    CC_100,
    CC_150,
    CC_BATTLE,
} EngineClass;

typedef enum {
    ITEMS_BALANCED,
    ITEMS_FRANTIC,
    ITEMS_STRATEGIC,
    ITEMS_NONE,
} ItemMode;

typedef struct {
	u8 unk[0x30];
	u32 score;
	u8 unk2[0x34];
} KMTFile;	// Total size 0x70

typedef struct {
    u32 courseId;
    EngineClass engineClass;
    GameMode gamemode;
    GameType gameType;
    BattleType battleType;
    CpuMode cpuMode;
    ItemMode itemMode;
    u8 hudPlayerIds[4];
    u32 cupId;
    u8 raceNumber;
    u8 lapCount;
    u8 unknown_0x26;
    u8 unknown_0x27;
    u32 modeFlags;
    u32 selectId;
    u32 unknown_0x30;
} RacedataSettings;	// Total size 0x34

typedef struct {
    void* vtable;
    u8 unknown_0x4;
    s8 localPlayerNum;
    s8 realControllerId;
    u8 unknown_0x7;
    u32 vehicleId;
    u32 characterId;
    PlayerType playerType;
	u8 unk[0xB8];
    Team team;
	u8 unk2[0x8];
    u16 previousScore;
    u16 score;
    u8 unk3[0x2];
    s16 gpRankScore;
    u8 unk4;
    u8 prevFinishPos;
    u8 unk5[0x6];
    s16 rating;
    u8 unk6[0x6];
} RacedataPlayer;	// Total size 0xF0

typedef struct {
    void* vtable;
    u8 playerCount;
	u8 unk[0x3];
    RacedataPlayer players[12];
    RacedataSettings settings;
    KMTFile mission;
    void* ghost;
} RacedataScenario;	// Total size 0xBF0

typedef struct {
	void* vtable;
	RacedataScenario scenarios[3]; // 0 is in race, 1 is in menu, not sure what 2 is
	// RKGFile ghosts[2];
} RacedataMain;	// Total size 0x73D4

typedef struct {
	u8 unk[0x1C];
	RacedataMain main;
} _Racedata;	// Total size 0x73F0

extern _Racedata* Racedata;
