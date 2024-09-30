#include "common.h"
#include "killdata.h"
#include "screentext.h"

void AddNewKillData(u16 type, u16 int1, u16 int2) {
	
	// Move the first two entries
	memmove(&KillData.entries[0], &KillData.entries[1], 16);

	// Apply data
	KillData.entries[2].msgId = type;
	KillData.entries[2].int1 = int1;
	KillData.entries[2].int2 = int2;
	KillData.entries[2].timer = 300;

	// Mark as updated
	KillData.needsUpdate = true;
}

void UpdateKillDataText() {
	screenText textData;

	// Construct screenText
	screenText_construct(&textData);

	// Process each string
	for (int i = 0; i < 3; i++) {
		if (KillData.entries[i].msgId != 0 && KillData.entries[i].timer != 0)
			textData.bmgs[i] = 8450 + (KillData.entries[i].msgId - 1) * 3 + i;
		else
			textData.bmgs[i] = 0xFFFFFFFF;
		if (KillData.entries[i].int1 != 0xFFFF)
			textData.playerPtrs[2*i] = GetBMGPlayer(KillData.entries[i].int1);
		if (KillData.entries[i].int2 != 0xFFFF)
			textData.playerPtrs[2*i+1] = GetBMGPlayer(KillData.entries[i].int2);
	}

	// Call setTextSrc
	ApplyKillData(&textData);
}

void UpdateKillData() {

	// Update timers
	for (int i = 0; i < 3; i++) {
		if (KillData.entries[i].timer != 0) {
			KillData.entries[i].timer--;
			if (KillData.entries[i].timer == 0)
				KillData.needsUpdate = true;
		}
	}

	// If any timer goes to 0, update texts
	if (KillData.needsUpdate) {
		UpdateKillDataText();
		KillData.needsUpdate = false;
	}
}
