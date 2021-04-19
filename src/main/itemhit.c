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
	HideNSeekData.players[pid].position = HideNSeekData.totalSurvivors + SeekerCount + 1;
	Raceinfo->players[pid]->battleScore = HideNSeekData.totalSurvivors + SeekerCount + 1;
	HideNSeekData.totalSurvivors--;

	// If only one hider is left, play the jingle
	if (HideNSeekData.totalSurvivors == 1)
		JingleFunc(MusicHandler, 5);

	// If isInfection, switch the player's team, set them as Seeker and increase totalSeekers
	if (HideNSeekData.isInfection) {
		Racedata->main.scenarios[0].players[pid].team = TEAM_RED;
		HideNSeekData.players[pid].isSeeker = true;
		HideNSeekData.totalSeekers++;

	// If infection is not enabled, simply run the disconnection function
	} else
		DisconnectPlayer(Raceinfo, pid);
}

bool ItemHitLocal(bool result, PlayerHolderPlayer* player) {

	// Get pid
	char pid = player->playerPointers->params->playerId;

	// Check that a collision happened, that we're in the game, that the player is local, and that this functions has not already run
	if (result && Have30SecondsPassed && pid == Racedata->main.scenarios[0].settings.hudPlayerIds[0] && HideNSeekData.players[pid].position == 0 && !HideNSeekData.players[pid].isSeeker) {

		// Kill the player
		PlayerKiller(pid);
		AmIDead = 1;

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
	if (packet->isPlayerDead && HideNSeekData.players[pid].position == 0)
		PlayerKiller(pid);

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
			HideNSeekData.players[pid].position = HideNSeekData.totalSurvivors + SeekerCount + 1;
			Raceinfo->players[pid]->battleScore = HideNSeekData.totalSurvivors + SeekerCount + 1;
			HideNSeekData.totalSurvivors--;
			
			// If infection is on, turn said player red
			if (HideNSeekData.isInfection)
				Racedata->main.scenarios[0].players[pid].team = TEAM_RED;
		}
	}
}
