#pragma once
#include <common.h>
#include <vec.h>

typedef struct {
	VEC3 pos, rot;
	u16 id;
	s16 range;
} JGPT;

typedef struct {
	JGPT*** pointArray;
	u16 pointCount, unk;
	void* raw;
} JGPTSection;
