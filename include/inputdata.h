#pragma once
#include <common.h>

// Documentation by Seeky, SwareJonge and _tZ

typedef struct {
	void* vtable;
	u16 buttonActions;
	u16 buttonRaw;
	float stickX, stickY;
	u8 quantisedStickX, quantisedStickY;
	u8 motionControlFlick, motionControlFlick2;
	u8 unk[0x4];
} InputState;

typedef struct {
	u8 unk[0x28];
	InputState inputStates[2];
} ControllerHolder;
