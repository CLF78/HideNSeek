#pragma once
#include "common.h"

typedef struct {
    u8 unk[0x171]; // Values we don't need to know
    bool noGravity;
    bool isHit;
    bool force0xVelY;
    bool inBullet;
    // Incomplete (more values we don't need to know)
} KartDynamics;



