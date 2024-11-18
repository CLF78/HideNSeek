#pragma once
#include "common.h"

// Documentation by Seeky

typedef struct {
	u8 unk[0x44];
	u32 playerCount;
	u32 availableAids;
	u8 unk2[0xE];
	u8 hostAid;
	u8 unk3[0x28C5];
	u8 aidsToPids[12];
	// More but who cares
} _RKNetController;

extern _RKNetController* RKNetController;
