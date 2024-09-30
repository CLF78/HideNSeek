#pragma once
#include "common.h"

typedef struct {
	float x, y, z;
} VEC3;

float PSVECSquareDistance(VEC3* vec1, VEC3* vec2);
