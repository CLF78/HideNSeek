#include <hidenseek.h>
#include <player.h>

bool NoClip(PlayerHolderPlayer* player, PlayerHolderPlayer* player2) {
	return (HideNSeekData.players[player->playerPointers->params->playerId].isSeeker == HideNSeekData.players[player2->playerPointers->params->playerId].isSeeker);
}
