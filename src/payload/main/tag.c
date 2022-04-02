#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <utils.h>

void HandleTags(void* something, int pid) {

	// If the player is a Seeker and the chosen pid is a hider, don't display their tag
	if (HideNSeekData.players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]].isSeeker && !(HideNSeekData.players[pid].isSeeker)) {

		// Only hide tags with Battle Glitch during the 30 second countdown
		if (BtGlitch) {
			if (!Have30SecondsPassed)
				return;

		// Otherwise hide them indiscriminately
		} else
			return;
	}
		

	// All checks passed, execute original function call
	TagFunc(something, pid);
}
