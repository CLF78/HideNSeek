#include <hidenseek.h>
#include <player.h>

bool NoClip(PlayerPointers* player1) {
	register PlayerPointers* player2 asm("r30");
	return (HideNSeekData.players[player1->params->playerId].isSeeker == HideNSeekData.players[player2->params->playerId].isSeeker);
}
