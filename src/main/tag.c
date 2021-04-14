#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <utils.h>

void HandleTags(void* something, int pid) {
	
	// If battle glitch is off, the player is a Seeker, and the player id is that of a hider, don't execute the function
	if (!BtGlitch && HideNSeekData.players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]].isSeeker && !(HideNSeekData.players[pid].isSeeker))
		return;
		
	TagFunc(something, pid);
}
