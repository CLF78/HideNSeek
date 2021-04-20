#include <common.h>
#include <hidenseek.h>
#include <player.h>

int DisableWheelie(int value, PlayerPointers* ptr) {

	// Get player id
	char pid = ptr->params->playerId;

	// Original instruction
	asm volatile("lwz 4, 0x4(4)");

	// Check if player is Seeker, and if so disable wheelie
	if (!Have30SecondsPassed && HideNSeekData.players[pid].isRealSeeker)
		return 0;

	if (HideNSeekData.players[pid].respawnTimer != 0)
		return 0;

	return value;
}
