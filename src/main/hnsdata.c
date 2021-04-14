#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <rknetcontroller.h>
#include <selecthandler.h>
#include <utils.h>

char getRandomAid(void* random, s8 otheraid, _RKNetSelectHandler* handler) {

	s8 aid = -1;
	while (true) {
		aid = RandomNextLimited(random, 12);
		bool cond = ((RKNetController->availableAids) >> aid) & 1;
		if (cond && aid != otheraid)
			break;
	}

	handler->teams |= (1 << (aid * 2));
	return aid;
}

void* SetupHNSHost(void* random, int fake, _RKNetSelectHandler* selecthandler) {

	// Zero out existing teams
	selecthandler->teams &= 0xFF000000;

	// If playerCount <= 2, reduce Seeker count to 1
	char pcount = RKNetController->playerCount;
    if (pcount <= 2)
		SeekerCount = 0;

	// If playerCount <= 3, checking for the second Seeker would inevitably cause a repick (it's also unnecessary with less than two Seekers)
    if (pcount <= 3 || SeekerCount == 0)
		PrevSeekers[1] = -1;

	if (AlwaysSeeker) {
		PrevSeekers[0] = 0;
		selecthandler->teams |= 1;
		if (SeekerCount == 1)
			PrevSeekers[1] = getRandomAid(random, PrevSeekers[0], selecthandler);
	} else {
		PrevSeekers[0] = getRandomAid(random, -1, selecthandler);
		if (SeekerCount == 1)
			PrevSeekers[1] = getRandomAid(random, PrevSeekers[0], selecthandler);
	}

	// Original instruction
	asm volatile("li 4, -1");
	return random;
}

void SetupHNSGuest() {

	// Write playerCount and isInfection
	char pcount = Racedata->main.scenarios[0].playerCount;
    HideNSeekData.playerCount = pcount;
	HideNSeekData.isInfection = IsInfection;

	for (int pid = 0; pid < pcount; pid++) {
		if (Racedata->main.scenarios[0].players[pid].team == TEAM_RED) {
			PrevSeekers[HideNSeekData.totalSeekers] = RKNetController->aidsToPids[pid];
			HideNSeekData.totalSeekers++;
			HideNSeekData.players[pid].isSeeker = true;
			HideNSeekData.players[pid].isRealSeeker = true;
		}
		else
			HideNSeekData.totalSurvivors++;
	}

	// Set score accordingly
	Racedata->main.scenarios[0].mission.score = HideNSeekData.totalSurvivors;
}

void DeleteHNS() {
	memset(&HideNSeekData, 0, sizeof(HideNSeekData)+5);
}
