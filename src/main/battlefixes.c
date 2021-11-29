#include <common.h>
#include <hidenseek.h>
#include <jgpt.h>
#include <raceinfo.h>
#include <player.h>
#include <vec.h>

#define DELFINOPIERCRC 0x72836BEE

float InfinityFloat;
VEC3* GetPlayerPosition(PlayerPointers**);

void BattleRespawnFix(RaceinfoPlayer* player, JGPTSection* respawns) {

	// Initial data
	s8 respawn = -1;
	float minDistance = InfinityFloat;
	VEC3* playerPos = GetPlayerPosition(&PlayerHolder->players[player->id]->playerPointers);
	int respawnCount = respawns->pointCount;
	JGPT*** respawnArray = respawns->pointArray;

	// Start loop
	for (int i = 0; i < respawnCount; i++) {

		// On Delfino Pier, ignore respawns with range 0 after 2 minutes of total gameplay
		if (ENPTCRC == DELFINOPIERCRC && player->frameCounter >= 7200 && respawnArray[i][0]->range == 0)
			continue;

		// Compute distance
		float currDistance = PSVECSquareDistance(playerPos, &respawnArray[i][0]->pos);

		// If distance is less than the one previously found, pick this respawn
		if (currDistance < minDistance) {
			minDistance = currDistance;
			respawn = i;
		}
	}
	
	// Set the respawn we found as the player's current respawn point
	player->respawn = (u8)respawn;
}
