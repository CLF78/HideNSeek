#include <hidenseek.h>
#include <player.h>

// Not actually PlayerHolderPlayer but i'm dumb so i can't load pointers correctly
bool NoClip(PlayerHolderPlayer* player1) {
	register PlayerHolderPlayer* player2 asm("r30");
	return (HideNSeekData.players[player1->playerPointers->params->playerId].isSeeker == HideNSeekData.players[player2->playerPointers->params->playerId].isSeeker);
}
