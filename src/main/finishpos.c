#include <common.h>
#include <hidenseek.h>

int FixPositions() {
	register int position asm("r27");

	for (int pid = 0; pid < 12; pid++) {
		if (HideNSeekData.players[pid].position == position+1)
			return pid;
	}
}
