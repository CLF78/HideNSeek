#pragma once
#include "common.h"

// Documentation by Kevin

typedef struct {
	u32 integers[9];
	u32 bmgs[9];
	void* playerPtrs[9];
	u8 licenseIds[9];
	u8 unk[3];
	u32 playerIds[9];
	u16* strings[9];
	bool useColoredBorder;
	u8 unk2[3];
} screenText;

void screenText_construct(screenText* this);
