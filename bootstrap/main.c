#include "common.h"

// Forward declarations (these strings were made in ASM to prevent random alignment zeroes)
char filename, fatalstring;
loaderFunctions funcs[4];

// External vars
char region;
u16 CheckAddress;
void* StartFunc;

// ASM Functions
void ThirtyFPS1();

// This function loads all the codes that HNS uses after StaticR has loaded
void readPayload() {

	// Compose filename
	char buffer[32];
	funcs[region].sprintf(buffer, &filename, funcs[region].letter);

	// Open the file
	DVDHandle fd;
	bool ret = funcs[region].DVDOpen(buffer, &fd);

	// Failsafe
	if (!ret) {
		u32 fataltextcolor = 0xFFFFFFFF;
		u32 fatalbackcolor = 0;
		funcs[region].OSFatal(&fataltextcolor, &fatalbackcolor, &fatalstring);
	}

	// Read the file (destination must be aligned by 32!)
	funcs[region].DVDReadPrio(&fd, (void*)0x808DD400, fd.length, 0, 0);

	// Close it
	funcs[region].DVDClose(&fd);

	// Run the payload
	((void(*)(void))StartFunc)();
}

// Initial function. This hooks at the end of init_registers
void start() {

	// Detect region
	if (CheckAddress == 0x54A9)			// PAL
		region = 0;
	else if (CheckAddress == 0x5409)	// NTSC-U
		region = 1;
	else if (CheckAddress == 0x53CD)	// NTSC-K
		region = 2;
	else if (CheckAddress == 0x5511)	// NTSC-K
		region = 3;
	else
		do {} while (true);				// Failed to detect, enter infinite loop

	// Main Hook
	_directWriteBranch(funcs[region].RelHook, readPayload, false);

	// 30 FPS (by CLF78)
	if (ThirtyFPS == 1) {
		_directWriteBranch(funcs[region].ThirtyFPS1, ThirtyFPS1, true);
		_directWrite8(funcs[region].ThirtyFPS2, 2);
		_directWrite8(funcs[region].ThirtyFPS2+0x1FC, 2);
	}

	// Flush cache
	sync();
	isync();
}
