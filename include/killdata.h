#pragma once
#include <common.h>
#include <screentext.h>

extern void* GetBMGPlayer(u16 pid);
extern void ApplyKillData(screenText* textData);
void AddNewKillData(u16 type, u16 int1, u16 int2);
void UpdateKillData();

// Using bigger sizes for alignment purposes
typedef struct {
	u16 timer;
	u16 msgId, int1, int2;
} KillDataEntry;

typedef struct {
	u32 needsUpdate;
	KillDataEntry entries[3];
} _KillData;

extern _KillData KillData;
