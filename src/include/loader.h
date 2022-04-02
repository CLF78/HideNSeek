#pragma once
#include "common.h"
#include "dvd.h"

/* Loader Functions */
typedef void (*OSFatal_t) (u32 *fg, u32 *bg, const char *str, ...);
typedef bool (*DVDOpen_t) (char* path, DVDHandle *handle);
typedef bool (*DVDClose_t) (DVDHandle *handle);
typedef int (*DVDReadPrio_t) (DVDHandle *handle, void *buffer, int length, int offset, int prio);

typedef struct {
	OSFatal_t OSFatal;
	DVDOpen_t DVDOpen;
	DVDClose_t DVDClose;
	DVDReadPrio_t DVDReadPrio;
	void* RelHook;
	void* ThirtyFPS1;
	void* ThirtyFPS2;
	u8 letter;
} loaderFunctions;
