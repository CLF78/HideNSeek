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

void _directWrite16(u16* addr, u16 value) {
	addr[0] = value;
	flushAddr(addr);
}

void _directWrite32(u32* addr, u32 value) {
	addr[0] = value;
	flushAddr(addr);
}

void _directWriteNop(void* addr) {
	_directWrite32((u32*)addr, 0x60000000);
}

void _directWriteBlr(void* addr) {
	_directWrite32((u32*)addr, 0x4E800020);
}

void _directWriteBranch(void* addr, void* ptr, bool lk) {
	_directWrite32((u32*)addr, ((((u32)(ptr) - (u32)(addr)) & 0x3FFFFFF) | 0x48000000 | !!lk));
}
