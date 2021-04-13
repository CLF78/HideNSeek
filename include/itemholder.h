#pragma once
#include <common.h>

typedef struct {
	u8 unk[0x248];
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
