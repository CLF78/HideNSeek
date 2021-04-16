#include "common.h"

void flushAddr(void* addr) {
	dcbst(addr);
	sync();
	icbi(addr);
}

void _directWrite8(u8* addr, u8 value) {
	addr[0] = value;
	flushAddr(addr);
}

void _directWrite32(u32* addr, u32 value) {
	addr[0] = value;
	flushAddr(addr);
}

void _directWriteBlr(void* addr) {
	_directWrite32((u32*)addr, 0x4E800020);
}

void _directWriteBranch(void* addr, void* ptr, bool lk) {
	_directWrite32((u32*)addr, ((((u32)(ptr) - (u32)(addr)) & 0x3FFFFFF) | 0x48000000 | !!lk));
}
