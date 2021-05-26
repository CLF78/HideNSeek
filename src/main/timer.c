#include <common.h>
#include <hidenseek.h>
#include <musichandler.h>
#include <player.h>
#include <racedata.h>
#include <raceinfo.h>
#include <utils.h>

void MainTimerUpdate(u32 timer) {
	register TimerManager* tmanager asm("r29");

	// Modified original instruction
	if (timer > 0)
		tmanager->frames = timer-1;

	// Update respawn timer for each player
	for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {
		if (HideNSeekData.players[pid].respawnTimer > 0) {
			HideNSeekData.players[pid].respawnTimer--;
			if (HideNSeekData.players[pid].respawnTimer == 0)
				HideNSeekData.players[pid].isStopped = false;
		}
	}

	// Some things happen before 30 seconds have passed
	if (!Have30SecondsPassed) {

		// Play the countdown jingle again
		if (timer % 60 == 0 && timer <= 180 && Raceinfo->raceState != 4)
			CustomJingleFunc(0xD8);

		// If timer is 1, reset it back to 10 minutes (minus 1 frame because it will give 1 point otherwise)
		else if (timer == 2) {

			if (HalfTimer)
				tmanager->frames = 0x4650;
			else
				tmanager->frames = 0x8CA0;

			Have30SecondsPassed = true;

			// Allow the Seekers to move
			for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {
				if (HideNSeekData.players[pid].isRealSeeker)
					HideNSeekData.players[pid].isStopped = false;
			}

			// Play the GO jingle again!
			if (Raceinfo->raceState != 4)
				CustomJingleFunc(0xD9);
		}
	}

	else {

		// Only play sounds if the race has not ended
		if (Raceinfo->raceState != 4) {

			// If one minute is remaining, play the final lap jingle and enable faster music
			if (timer == 3600)
				JingleFunc(MusicHandler, 5);

			// Play the countdown jingle in the last 10 seconds
			else if (timer % 60 == 0) {
				if (timer >= 240 && timer <= 600)
					CustomJingleFunc(0xEB);
				else if (timer > 0 && timer <= 180)
					CustomJingleFunc(0xEC);
			}
		}

		// Run the Star function for each Seeker (unless they already have a Star)
		for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {
			if (HideNSeekData.players[pid].isSeeker && PlayerHolder->players[pid]->pointers.playerSub10->starTimer == 0)
				StarFunc(&ItemHolder->ptr->players[pid]);
		}
	}
}

u32 TimerChecks(_Raceinfo* rinfo) {

	// Make some quick bools
	bool timeOver = (rinfo->timerManager->frames == 0);
	bool noSeekers = (HideNSeekData.totalSeekers == 0);
	bool noSurvivors = (HideNSeekData.totalSurvivors == 0);

	if (timeOver || noSeekers || noSurvivors) {

		// Disable Spectator Mode
		SpectatorMode = 0;

		// Setup loop
		int survivorpos = 1;
		int seekerpos = 1;
		for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {

			// For Seekers, set their position to be the amount of survivors + 1, and their points to the total amount of players caught (or 15 if all players were caught)
			if (HideNSeekData.players[pid].isRealSeeker) {
				rinfo->players[pid]->battleScore = (noSurvivors) ? HideNSeekData.playerCount - SeekerCount + 2 : HideNSeekData.playerCount - HideNSeekData.totalSurvivors - SeekerCount;
				rinfo->players[pid]->position = HideNSeekData.totalSurvivors + seekerpos;
				
				seekerpos++;

			// For all uncaught Hiders, set position to survivorpos and points to 15
			} else if (rinfo->players[pid]->position == 0) {
				rinfo->players[pid]->position = survivorpos;
				rinfo->players[pid]->battleScore = HideNSeekData.playerCount - SeekerCount + 2;
				survivorpos++;
			}
		}

		updatePlayerFinishTimes();
	}

	// Return a different value based on which bool is true
	if (timeOver)
		return 1;
	else if (noSurvivors)
		return 2;
	else if (noSeekers)
		return 3;
	return 0;
}

bool TimerFlashFix() {
	return (Have30SecondsPassed && Raceinfo->timerManager->frames <= 3600);
}

void updatePlayerFinishTimes() {

	// Set the player's finish time to their position in minutes
	for (int pid = 0; pid < HideNSeekData.playerCount; pid++)
		Raceinfo->players[pid]->raceFinishTime->minutes = Raceinfo->players[pid]->position;
}
