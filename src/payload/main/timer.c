#include "common.h"
#include "hidenseek.h"
#include "killdata.h"
#include "musichandler.h"
#include "player.h"
#include "racedata.h"
#include "raceinfo.h"
#include "utils.h"

// External timer values
extern u32 TimerVals[3];

// Forward declarations
void UpdateMutes();

void MainTimerUpdate(u32 timer) {
	register TimerManager* tmanager asm("r29");

	// Modified original instruction
	if (timer > 0)
		tmanager->frames = timer-1;

	// Some things happen before 30 seconds have passed
	if (!Have30SecondsPassed) {

		// Play the countdown jingle again
		if (timer % 60 == 0 && timer <= 180)
			CustomJingleFunc(0xD8);

		// If timer is 1, reset it back to 10 minutes
		else if (timer == 2) {
			tmanager->frames = TimerVals[HalfTimer];
			Have30SecondsPassed = true;

			// Allow the Seekers to move
			for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {
				if (HideNSeekData.players[pid].isRealSeeker)
					HideNSeekData.players[pid].isStopped = false;
			}

			// Play the GO jingle again!
			CustomJingleFunc(0xD9);
		}
	}

	else {

		// If one minute is remaining, play the final lap jingle and enable faster music
		if (timer == 3600 && Raceinfo->raceState != 4)
			JingleFunc(MusicHandler, 5);

		// Play the countdown jingle in the last 10 seconds
		else if (timer % 60 == 0) {
			if (timer >= 240 && timer <= 600)
				CustomJingleFunc(0xEB);
			else if (timer > 0 && timer <= 180)
				CustomJingleFunc(0xEC);
		}

		// Run the Star function for each Seeker (unless they already have a Star)
		for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {
			if (HideNSeekData.players[pid].isSeeker && PlayerHolder->players[pid]->pointers.playerSub10->starTimer == 0)
				StarFunc(PlayerHolder->players[pid]->pointers.playerSub10);
		}
	}

	// Update KillData
	UpdateKillData();

	// Update Character/Vehicle sounds
	UpdateMutes();
}

u32 TimerChecks(_Raceinfo* rinfo) {

	// Return a different value based on which condition is true
	u32 ret = 0;
	if (rinfo->timerManager->frames == 0)
		ret = 1;
	else if (HideNSeekData.totalSurvivors == 0)
		ret = 2;
	else if (HideNSeekData.totalSeekers == 0)
		ret = 3;

	// If any of the conditions is met, end the race
	if (ret > 0) {

		// Disable Spectator Mode
		SpectatorMode = 0;

		// Move KillData text upwards so it doesn't clash with the race ended text
		memmove(&KillData.entries[0], &KillData.entries[1], 16);
		KillData.entries[2].timer = 1;

		// Setup loop
		int survivorpos = 1;
		int seekerpos = 1;
		for (int pid = 0; pid < HideNSeekData.playerCount; pid++) {

			// For Seekers, set their position to be the amount of survivors + 1, and their points to the total amount of players caught (+ 2 if all players were caught)
			if (HideNSeekData.players[pid].isRealSeeker) {
				rinfo->players[pid]->battleScore = HideNSeekData.playerCount - HideNSeekData.totalSurvivors - SeekerCount + (HideNSeekData.totalSurvivors == 0) * 2;
				rinfo->players[pid]->position = HideNSeekData.totalSurvivors + seekerpos;
				seekerpos++;

			// For all uncaught Hiders, set position to survivorpos and points to 15
			} else if (rinfo->players[pid]->position == 0) {
				rinfo->players[pid]->position = survivorpos;
				rinfo->players[pid]->battleScore = HideNSeekData.playerCount - SeekerCount + 2;
				survivorpos++;
			}

			rinfo->players[pid]->raceFinishTime->minutes = rinfo->players[pid]->position;
		}
	}

	rinfo->players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]]->endReason = ret + 1;
	return ret;
}

bool TimerFlashFix() {
	return (Have30SecondsPassed && Raceinfo->timerManager->frames <= 3600);
}
