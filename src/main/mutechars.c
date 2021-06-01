#include <common.h>
#include <hidenseek.h>
#include <player.h>
#include <racedata.h>

bool MuteChars2(PlayerHolderPlayer* player) {

	// Don't change anything if i'm hider
	if (!HideNSeekData.players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]].isSeeker)
		return 0;

	// Otherwise return True if not Seeker
	return (!HideNSeekData.players[player->playerPointers->params->playerId].isSeeker);
}
