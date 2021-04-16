#include <hidenseek.h>
#include <player.h>

bool NoClip(PlayerHolderPlayer* player) {
	return (!HideNSeekData.players[player->playerPointers->params->playerId].isSeeker);
}
