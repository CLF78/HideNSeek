#include <common.h>
#include <hidenseek.h>
#include <musichandler.h>
#include <player.h>
#include <racedata.h>
#include <racepacket.h>
#include <rknetcontroller.h>
#include <utils.h>

void PlayerKiller(char pid) {

	// Set the player's position to totalSurvivors+SeekerCount and decrease totalSurvivors
	Raceinfo->players[pid]->battleScore = HideNSeekData.playerCount - HideNSeekData.totalSurvivors - SeekerCount;
	HideNSeekData.players[pid].position = HideNSeekData.totalSurvivors + SeekerCount + 1;
	HideNSeekData.totalSurvivors--;

	// If only one hider is left, play the jingle
	if (HideNSeekData.totalSurvivors == 1)
		JingleFunc(MusicHandler, 5);

	// If isInfection, switch the player's team, set them as Seeker and increase totalSeekers
	if (HideNSeekData.isInfection) {
		Racedata->main.scenarios[0].players[pid].team = TEAM_RED;
		HideNSeekData.players[pid].isSeeker = true;
		HideNSeekData.totalSeekers++;
		if (HideNSeekData.players[pid].respawnTimer > 0) {
			HideNSeekData.players[pid].respawnTimer = 0;
			PlayerHolder->players[pid]->pointers.playerSub10->hardSpeedLimit = 0x42F00000;
		}

	// If infection is not enabled, simply run the disconnection function
	} else
		DisconnectPlayer(Raceinfo, pid);
}

bool ItemHitLocal(bool result, PlayerHolderPlayer* player, PlayerSub18* player2) {

	// Get pid
	char pid = player->playerPointers->params->playerId;
	char pid2 = player2->pointers->params->playerId;

	// Check that a collision happened, that we're in the game, that the player is local, and that this functions has not already run
	if (result && Have30SecondsPassed && pid == Racedata->main.scenarios[0].settings.hudPlayerIds[0] && HideNSeekData.players[pid].position == 0 && !HideNSeekData.players[pid].isSeeker) {

		// Kill the player
		PlayerKiller(pid);

		// Store AmIDead along with the aid of who hit me
		AmIDead = 1 | (RKNetController->aidsToPids[pid2] << 1);

		// Give the point bonus if the second player is an infected seeker (will never be true in regular mode anyway)
		if (!HideNSeekData.players[pid2].isRealSeeker)
			Raceinfo->players[pid2]->battleScore++;

		// Enable Spectator Mode is isInfection is false
		if (!HideNSeekData.isInfection) {
			SpectatorMode = true;
			CurrentSpectated = pid;
		}
	}

	return result;
}

void ItemHitRemote(void* something, ItemPacket* packet, int length) {
	register char pid asm("r26");

	// Check that this functions has not already run
	if (packet->isPlayerDead && HideNSeekData.players[pid].position == 0) {
		PlayerKiller(pid);

		// Get the pid of who killed me
		char killeraid = packet->isPlayerDead >> 1;
		char pid2;
		for (pid2 = 0; pid2 < 12; pid2++) {
			if (RKNetController->aidsToPids[pid2] == killeraid)
				break;
		}
		
		// Assign the point bonus (again won't do anything on normal mode)
		if (!HideNSeekData.players[pid2].isRealSeeker)
			Raceinfo->players[pid2]->battleScore++;
	}

	// Original function call
	_directWriteArray(something, (void*)packet, length);
}

void PlayerDC() {
	register _RKNetController* rknet asm("r29");
	register int aid asm("r28");

	// Failsafe
	if (Raceinfo != 0) {

		// Get the player's pid from the aid
		int pid;
		for (pid = 0; pid < 12; pid++) {
			if (rknet->aidsToPids[pid] == aid)
				break;
		}

		// If the player is a Seeker, just decrease totalSeekers
		if (HideNSeekData.players[pid].isSeeker)
			HideNSeekData.totalSeekers--;

		// If the player is an uncaught Hider, place them totalSurvivors + SeekerCount
		else if (HideNSeekData.players[pid].position == 0) {
			Raceinfo->players[pid]->battleScore = HideNSeekData.playerCount - HideNSeekData.totalSurvivors - SeekerCount;
			HideNSeekData.players[pid].position = HideNSeekData.totalSurvivors + SeekerCount + 1;
			HideNSeekData.totalSurvivors--;
			
			// If infection is on, turn said player red
			if (HideNSeekData.isInfection)
				Racedata->main.scenarios[0].players[pid].team = TEAM_RED;
		}
	}
}
