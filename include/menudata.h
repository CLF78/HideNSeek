#pragma once
#include <common.h>
#include <inputdata.h>

typedef struct {
	u32 controllerInfo, unk, wantsController;
	ControllerHolder* controllerHolder;
} MenuDataSubHolder;

typedef struct {
	void* vtable;
	MenuDataSubHolder holders[4];
	// Incomplete
} MenuDataSub;

typedef struct {
	u8 unk[0x34];
	MenuDataSub sub;
} _MenuData;

extern _MenuData* MenuData;
