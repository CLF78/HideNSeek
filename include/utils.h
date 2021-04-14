#pragma once
#include <common.h>
#include <itemholder.h>
#include <raceinfo.h>

int UtilRandint(int lo, int hi);
void UtilRandomSeed(int seed);
u32 CalcCRC32(void* data, u32 length);

void DisconnectPlayer(_Raceinfo* raceinfo, int pid);
void StarFunc(ItemHolderPlayer* player);

void CustomJingleFunc(int sfx);
void TagFunc(void* something, int pid);
