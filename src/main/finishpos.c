#include <common.h>
#include <hidenseek.h>

int FixPositions(void* unused, int position) {
	for (int pid = 0; pid < 12; pid++) {
		if (HideNSeekData.players[pid].position == position)
			return pid;
	}

	// Failsafe so that positions don't get fucked
	return 0;
}
