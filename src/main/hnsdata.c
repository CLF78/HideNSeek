#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <rknetcontroller.h>
#include <utils.h>

int pidHelper(char currentpid, char prevaid1, char prevaid2, int index) {

	// Setup loop
	s32 aid = -1;
	u32 pid;

    do {
		// 0 = any player can seek
		// 1 = host always seeks
		// 2 = host never seeks
		if (AlwaysSeeker == 0)
			aid = UtilRandint(0, 12);
		else if (AlwaysSeeker == 1)
			aid++;
		else
			aid = UtilRandint(SeekerCount+1, 12);

		// Check if the aid meets the conditions
        for (pid = 0; pid < 12; pid++) {
            if (RKNetController->aidsToPids[pid] == aid && pid != currentpid) {
				if (AlwaysSeeker == 1 || Racedata->main.scenarios[0].settings.gamemode == MODE_PUBLIC_VS) {
					PrevSeekers[index] = aid;
					break;
				} else if (aid != prevaid1 && aid != prevaid2) {
					PrevSeekers[index] = aid;
					break;
				}
			}
        }
    } while (PrevSeekers[index] == 0xFF);

	return pid;
}

void SetupHNS() {

	// Set random seed to selectid
	register int selectid asm("r6");
	UtilRandomSeed(selectid);

	// Write playerCount and isInfection
	char pcount = Racedata->main.scenarios[0].playerCount;
    HideNSeekData.playerCount = pcount;
	HideNSeekData.isInfection = IsInfection;

	// If playerCount <= 2, reduce Seeker count to 1
    if (pcount <= 2)
		SeekerCount = 0;

	// Calculate totalSeekers
	HideNSeekData.totalSeekers = SeekerCount+1;

	// Calculate totalSurvivors and set score accordingly
    HideNSeekData.totalSurvivors = pcount - HideNSeekData.totalSeekers;
	Racedata->main.scenarios[0].mission.score = pcount - HideNSeekData.totalSeekers;

	// If playerCount <= 3, checking for the second Seeker would inevitably cause a repick (it's also unnecessary with less than two Seekers)
    if (pcount <= 3 || SeekerCount == 0)
		PrevSeekers[1] = -1;

	// Setup loop
    char pid = -1;
	char prevaid1 = PrevSeekers[0];
	char prevaid2 = PrevSeekers[1];
	PrevSeekers[0] = -1;
	PrevSeekers[1] = -1;

	// Get the Seekers!
    for (int amount = 0; amount < HideNSeekData.totalSeekers; amount++) {
        pid = pidHelper(pid, prevaid1, prevaid2, amount);
		HideNSeekData.players[pid].isStopped = true;
        HideNSeekData.players[pid].isSeeker = true;
        HideNSeekData.players[pid].isRealSeeker = true;
        Racedata->main.scenarios[0].players[pid].team = 0;
    }
}

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstringop-overflow"
void DeleteHNS() {
	memset(&HideNSeekData, 0, sizeof(HideNSeekData)+9);
}
#pragma GCC diagnostic pop
