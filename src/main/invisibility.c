#include <common.h>
#include <hidenseek.h>
#include <racedata.h>
#include <racepacket.h>
#include <rknetcontroller.h>
#include <utils.h>

void InvisibilityFunc(RacePacket* packet, int length, int aid) {

    // Calculate index anyway
    int index = packet->raceheader1_len + packet->raceheader2_len + packet->room_select_len;

	// Check if 30 seconds have not passed, that i am not a Seeker and that i'm sending this to an actual Seeker
	if (packet->racedata_len != 0 && !Have30SecondsPassed && !HideNSeekData.players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]].isSeeker && (aid == PrevSeekers[0] || aid == PrevSeekers[1])) {

		// Overwrite the position in the packet
		packet->data[index] = 0x9F;
		packet->data[index+1] = 0x42;
		packet->data[index+2] = 0x41;
		packet->data[index+3] = 0x09;
		packet->data[index+4] = 0xF4;
		packet->data[index+5] = 0x24;
		packet->data[index+6] = 0x10;
		packet->data[index+7] = 0x9F;
		packet->data[index+8] = 0x42;
		packet->data[index+9] = 0x41;

		// Since the last 4 bits overflow and their value is 0, clearing them will do the job.
		packet->data[index+10] &= ~((1 << 7) | (1 << 6) | (1 << 5) | (1 << 4));
	}

	if (packet->item_len != 0) {
		index += packet->racedata_len + packet->user_len;
		packet->data[index+7] = AmIDead;
	}

	// Call the original function
	CalcCRC32((void*)packet, length);
}
