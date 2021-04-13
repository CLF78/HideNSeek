#pragma once
#include <common.h>

// Documentation by Seeky

typedef struct {
	u8 unk[0x2920];
	u8 aidsToPids[12];
	// More but who cares
} _RKNetController;

extern _RKNetController* RKNetController;
