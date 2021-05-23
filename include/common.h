#pragma once

/* ASM Helpers */
#define dcbf(_val) asm volatile("dcbf 0, %0" :: "r"(_val))
#define icbi(_val) asm volatile("icbi 0, %0" :: "r"(_val))
#define dcbst(_val) asm volatile("dcbst 0, %0" :: "r"(_val))
#define sync() asm volatile("sync")
#define isync() asm volatile("isync")

/* Common Number Types */
#define bool _Bool
#define true 1
#define false 0

typedef signed long long s64;
typedef signed int s32;
typedef signed short s16;
typedef signed char s8;

typedef unsigned long long u64;
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

typedef float f32;
typedef double f64;

/* Base Functions */
void flushAddr(void* addr);
void _directWrite8(u8* addr, u8 value);
void _directWrite16(u16* addr, u16 value);
void _directWrite32(u32* addr, u32 value);
void _directWriteNop(void* addr);
void _directWriteBlr(void* addr);
void _directWriteBranch(void* addr, void* ptr, bool lk);
void* _directWriteArray(void* dest, void* src, u32 count); // Actually memcpy but renamed so it isn't inlined

/* A hack because i don't want to do a million typecasts and declarations */
#define SIZEOF(object) (char *)(&object+1) - (char *)(&object)

#define directWrite8(addr, value) extern void* (addr);\
_directWrite8((u8*)&(addr), value)

#define directWrite16(addr, value) extern void* (addr);\
_directWrite16((u16*)&(addr), value)

#define directWrite32(addr, value) extern void* (addr);\
_directWrite32((u32*)&(addr), value)

#define directWriteNop(addr) extern void* (addr);\
_directWriteNop(&(addr))

#define directWriteBlr(addr) extern void* (addr);\
_directWriteBlr(&(addr))

#define directWriteBranch(addr, ptr, lk) extern void* (addr);\
void (ptr)();\
_directWriteBranch(&(addr), ptr, lk)

#define directWriteBranchEx(addr, ptr, lk) extern void* (addr);\
_directWriteBranch(&(addr), ptr, lk)

#define directWriteArray(dest, src, count) extern char (dest)[];\
extern char (src)[];\
_directWriteArray(&(dest), src, count)

#define directWriteString(dest, src) extern char (dest)[];\
_directWriteArray(&(dest), src, SIZEOF(src))

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

/* Common Functions */
void* memset(void* ptr, u32 value, u32 num);
u32 CalcCRC32(void* data, u32 length);

bool DVDOpen(const char* path, DVDHandle *fd);
bool DVDClose(DVDHandle* fd);
int DVDReadPrio(DVDHandle* fd, void* buffer, int length, int offset, int prio);

void OSFatal(u32* textColor, u32* backColor, const char* message);

int sprintf(char *s, const char *format, ...);

/* Common Vars */
char gameRegion;
char NoMusic, ThirtyFPS;

/* Timer code */
void updatePlayerFinishTimes(void);