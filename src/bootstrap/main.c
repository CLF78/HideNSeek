#include "common.h"
#include "loader.h"

// External functions and data (made in ASM to prevent random unnecessary zeroes)
loaderFunctions funcs[4];
char filename[19];
void* StartFunc;
void ThirtyFPS1();
int regionCheck();

// This function loads all the codes that HNS uses after StaticR has loaded
void readPayload() {

	// Get region
	int region = regionCheck();

	// Compose filename (this is never run again so we can be cheeky and avoid using sprintf)
	filename[14] = funcs[region].letter;

	// Open the file
	DVDHandle fd;
	bool ret = funcs[region].DVDOpen(filename, &fd);

	// Failsafe
	if (!ret) {
		u32 fataltextcolor = 0xFFFFFFFF;
		u32 fatalbackcolor = 0;
		funcs[region].OSFatal(&fataltextcolor, &fatalbackcolor, "Could not find Hide and Seek payload.\nPlease check that your installation is correct.");
	}

	// Read the file (destination must be aligned by 32!)
	funcs[region].DVDReadPrio(&fd, &StartFunc, fd.length, 0, 0);

	// Close it
	funcs[region].DVDClose(&fd);

	// Run the payload
	((void(*)(void))StartFunc)();
}

// Initial function. This hooks at the end of init_registers
void start() {

	// Get region
	int region = regionCheck();

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
