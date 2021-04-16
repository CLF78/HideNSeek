#include "common.h"

// Forward declaration
void runPayload();

// This function loads all the codes that HideNSeek uses after StaticR has loaded
void readPayload() {

	// Compose filename
	char buffer[32];
	sprintf(buffer, "/hns/HideNSeek%c.bin", gameRegion);

	// Open the file
	DVDHandle fd;
	bool ret = DVDOpen(buffer, &fd);

	// Failsafe
	if (!ret) {
		u32 fataltextcolor = 0xFFFFFFFF;
		u32 fatalbackcolor = 0;
		OSFatal(&fataltextcolor, &fatalbackcolor, "Could not find Hide and Seek payload.\nPlease check that your installation is correct.");
	}

	// Read the file (destination must be aligned by 32!)
	DVDReadPrio(&fd, (void*)0x808DD400, fd.length, 0, 0);

	// Close it
	DVDClose(&fd);

	// Run the payload
	runPayload();
}

// Initial function. This hooks at the end of init_registers
void start() {

	// "Anticheat"

	#ifndef DEBUG
	// Overwrite all commonly used hooks
	directWriteBlr(VIHook);
	directWriteBlr(KPADHook);
	directWriteBlr(GXDrawHook);
	directWriteBlr(GXFlushHook);
	directWriteBlr(OSSleepHook);
	directWriteBlr(AXNextFrameHook);

	// Wipe area at 0x80001800-0x80003000
	memset((void*)0x80001800, 0, 0x1800);

	// Disable Dolphin's codehandler
	_directWriteBlr((void*)0x800018A8);
	#endif

	// Main Hook
	directWriteBranchEx(RelHook, readPayload, false);

	// 30 FPS (by CLF78)
	if (ThirtyFPS == 1) {
		directWriteBranch(ThirtyFPSHook1, ThirtyFPS1, true);
		directWrite8(ThirtyFPSHook2, 2);
		directWrite8(ThirtyFPSHook3, 2);
	}

	// Flush cache
	sync();
	isync();
}
