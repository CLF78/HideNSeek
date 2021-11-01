#include <hidenseek.h>
#include <player.h>

bool NoClip(PlayerPointers** player1) {
	register PlayerSub18* player2 asm("r30");
	return (HideNSeekData.players[player1[0]->params->playerId].isSeeker == HideNSeekData.players[player2->pointers->params->playerId].isSeeker);
}
