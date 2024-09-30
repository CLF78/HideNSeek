#pragma once
#include "common.h"

typedef struct {
	u8 unk[0x40];
	u8 stateFlag;
} _MusicHandler;

void JingleFunc(_MusicHandler* handler, int stateFlag);
extern _MusicHandler* MusicHandler;
