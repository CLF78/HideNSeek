#pragma once
#include <common.h>

typedef struct {
	u8 unk[0x8C];
	u32 item;
	u32 itemAmount;
	u8 unk2[0x1B4];
} ItemHolderPlayer;

// I didn't know how to do it so there we go
typedef struct {
	ItemHolderPlayer players[12];
} ItemHolderArray;

typedef struct {
	u8 unk[0x14];
	ItemHolderArray *ptr;
	// Incomplete
} _ItemHolder;

extern _ItemHolder* ItemHolder;
