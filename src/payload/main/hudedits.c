#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <raceinfo.h>

int ScoreSound(int score) {

	// Online spectator, don't play any jingle since they will get bunched up when entering, playing it very loudly
	if (Racedata->main.scenarios[0].settings.gameType == TYPE_ONLINE_SPECTATOR)
		return 0;

	// Get my pid
	int mypid = Racedata->main.scenarios[0].settings.hudPlayerIds[0];

	// Seeker, play positive jingle (plus hack because this would also trigger when getting caught)
	if (HideNSeekData.players[mypid].isSeeker && Raceinfo->players[mypid]->position != score + SeekerCount + 2)
		return 1;

	// Hider or dead in Classic mode, play negative jingle
	return 2;
}
