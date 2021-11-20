#pragma once
#include <common.h>

typedef struct {
	u8 unk[0x8C];
	u32 item;
	u32 itemAmount;
	u8 unk2[0x1B4];
} ItemHolderPlayer;

typedef struct {
	u8 unk[0x14];
	ItemHolderPlayer *players;
	// Incomplete
} _ItemHolder;

extern _ItemHolder* ItemHolder;
