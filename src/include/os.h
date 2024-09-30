#pragma once

#include "common.h"

bool OSDisableInterrupts();
bool OSRestoreInterrupts(bool);
void OSReport(const char *format, ...);
