#include "common.h"
#include "dwc.h"
#include "hidenseek.h"
#include "os.h"
#include "racedata.h"
#include "racemodeonline.h"
#include "rknetcontroller.h"

extern u32 ptr_miscPacketHandler; // if this is a pointer shouldn't i be defining it as such?
bool finishedTrackCheck;

void DoInsertTrackIdent(RaceModeOnlineVs *RaceModeOnlineVs) {
    if(!DWC_IsServerMyself()){
        RaceModeOnlineVs->outPacket.minimumRaceFinishTime = ENPTCRC; // Replace unused field with CRC32 of the ENPT section for the current track
    }
    return;
}

void CheckTrackIdent() {
    if(DWC_IsServerMyself()){
        u8 playerId;
        for (playerId = 0; playerId < Racedata->main.scenarios[0].playerCount; playerId++) {
            if (HideNSeekData.players[RKNetController->aidsToPids[playerId]].doneTrackCheck) {
                continue;
            }
            if (Racedata->main.scenarios->players[playerId].playerType == PLAYER_REAL_LOCAL) {
                continue;
            }
            RaceHeader2VS* RH2 = GetRaceHeader2Buffer(ptr_miscPacketHandler, playerId);
            if (RH2->minimumRaceFinishTime == 0) {
                continue;
            }
            if (RH2->minimumRaceFinishTime != ENPTCRC) {
                bool ret = OSDisableInterrupts();
                DWC_CloseConnectionHard(RKNetController->aidsToPids[playerId]);
                OSRestoreInterrupts(ret);
            }
            HideNSeekData.players[RKNetController->aidsToPids[playerId]].doneTrackCheck = 1;
        }
        
    }
    return;
}