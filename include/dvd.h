#pragma once
#include "common.h"

/* Common Structures */
typedef struct DVDHandle DVDHandle;
typedef struct DVDCommandBlock DVDCommandBlock;

struct DVDCommandBlock {
	DVDCommandBlock* next;	// 00
	DVDCommandBlock* prev;	// 04
	u32 command;			// 08
	s32 state;				// 0C
	u32 offset;				// 10
	u32 length;				// 14
	void* addr;				// 18
	u32 currTransferSize;	// 1C
	u32 transferredSize;	// 20
	void* id;				// 24
	void* cb;				// 28
	void* userData;			// 2C
};

struct DVDHandle {
	DVDCommandBlock block;	// 00
	int address;			// 30
	int length;				// 34
	void* callback;			// 38
};
