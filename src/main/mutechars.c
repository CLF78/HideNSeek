#include <common.h>
#include <hidenseek.h>
#include <player.h>
#include <racedata.h>

bool MuteChars2(PlayerHolderPlayer* player) {

	// Get pid
	char pid = player->playerPointers->params->playerId;

	// Check if it's myself
	if (pid == Racedata->main.scenarios[0].settings.hudPlayerIds[0])
		return 0;

	// Check if Spectator Mode is on
	if (SpectatorMode)
		return 0;

	// Otherwise return True if not Seeker
	return (!HideNSeekData.players[pid].isSeeker);
}
