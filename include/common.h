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
void _directWrite8(void* addr, u8 value);
void _directWrite16(void* addr, u16 value);
void _directWrite32(void* addr, u32 value);
void _directWriteBranch(void* addr, void* ptr, bool lk);
void* _directWriteArray(void* dest, void* src, u32 count); // Actually memcpy but renamed so it isn't inlined

/* A hack because i don't want to do a million typecasts and declarations */
#define SIZEOF(object) (char *)(&object+1) - (char *)(&object)
#define calcoffs(addr, offset) (void*)((int)&(addr))+(offset)

#define directWrite8(addr, value) extern void* (addr);\
_directWrite8(&(addr), value);

#define directWrite8Offset(addr, offset, value) extern void* (addr);\
_directWrite8(calcoffs(addr, offset), value);

#define directWrite16(addr, value) extern void* (addr);\
_directWrite16(&(addr), value);

#define directWrite16Offset(addr, offset, value) extern void* (addr);\
_directWrite16(calcoffs(addr, offset), value);

#define directWrite32(addr, value) extern void* (addr);\
_directWrite32(&(addr), value);

#define directWrite32Offset(addr, offset, value) extern void* (addr);\
_directWrite32(calcoffs(addr, offset), value);

#define directWriteNop(addr) extern void* (addr);\
_directWrite32(&(addr), 0x60000000);

#define directWriteNopOffset(addr, offset) extern void* (addr);\
_directWrite32(calcoffs(addr, offset), 0x60000000);

#define directWriteBlr(addr) extern void* (addr);\
_directWrite32(&(addr), 0x4E800020);

#define directWriteBlrOffset(addr, offset) extern void* (addr);\
_directWrite32(calcoffs(addr, offset), 0x4E800020);

#define directWriteBranch(addr, ptr, lk) extern void* (addr);\
void (ptr)();\
_directWriteBranch(&(addr), ptr, lk);

#define directWriteBranchOffset(addr, offset, ptr, lk) extern void* (addr);\
void (ptr)();\
_directWriteBranch(calcoffs(addr, offset), ptr, lk);

#define directWriteArray(dest, src, count) extern void* (dest);\
extern void* (src);\
_directWriteArray(&(dest), &(src), count);

#define directWriteArrayOffset(dest, offset, src, count) extern void* (dest);\
extern void* (src);\
_directWriteArray(calcoffs(dest, offset), &(src), count);

#define directWriteString(dest, src) extern void* (dest);\
_directWriteArray(&(dest), src, SIZEOF(src));

#define directWriteStringOffset(dest, offset, src) extern void* (dest);\
_directWriteArray(calcoffs(dest, offset), src, SIZEOF(src));

/* Common Functions */
void* memset(void* ptr, u32 value, u32 num);
void* memmove(void* dst, void* src, u32 num);
u32 CalcCRC32(void* data, u32 length);

/* Common Vars */
char NoMusic, /* (DEPRECATED) CTSupport, */ ThirtyFPS;
