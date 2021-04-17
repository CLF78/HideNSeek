#pragma once
#include <common.h>

// Documentation by stebler, SwareJonge and 1superchip 

typedef struct PlayerPointers PlayerPointers;

typedef struct {
	PlayerPointers *pointers;
	u8 unk[0x28];
	u32 hardSpeedLimit; // actually float but who cares?
	u8 unk2[0x15A];
	u16 starTimer;
	// Incomplete
} PlayerSub10;

typedef struct {
	PlayerPointers *pointers;
	u8 unk[0x18];
	u32 damage;
	// Incomplete
} PlayerSub14;

typedef struct {
	void* vtable;
	PlayerPointers *pointers;
	// Incomplete, needs research
} PlayerSub18;

typedef struct {
	u32 isBike;
	u32 vehicle;
	u32 character;
	u16 wheelCount0;
	u16 wheelCount1;
	u8 playerId;
	u8 pad[0x3];
	void* statsAndBsp;
	void* unk;
	void* kartDriverDispParams;
	void* kartPartsDispParams;
	void* bikePartsDispParams;
	void* driverDispParams;
	float wheelCountRecip;
	float wheelCountPlusOneRecip;
	void* gpStats;
	u8 unk2[0x4];
} PlayerParams;			// Total size 0x3c

struct PlayerPointers {
	PlayerParams* params;
	u8 unk[0x24];
	PlayerSub10* playerSub10;
	PlayerSub14* playerSub14;
	PlayerSub18* playerSub18;
	u8 unk2[0x2C];
};		// Total size 0x64

typedef struct {
	PlayerPointers* playerPointers;
	u8 unk[0x10];
	PlayerParams* params;
	u8 unk2[0x4];
	PlayerPointers pointers;
} PlayerHolderPlayer;	// Total size 0x80

typedef struct {
	u8 unk[0x20];
	PlayerHolderPlayer **players;
	u8 playerCount;
} _PlayerHolder;

extern _PlayerHolder* PlayerHolder;
