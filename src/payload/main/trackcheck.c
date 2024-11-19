#include "common.h"
#include "dwc.h"
#include "hidenseek.h"
#include "os.h"
#include "racedata.h"
#include "raceinfo.h"
#include "racemodeonline.h"
#include "rknetcontroller.h"

extern u32 ptr_miscPacketHandler; // if this is a pointer shouldn't i be defining it as such?
bool finishedTrackCheck;

void InsertTrackIdent(RaceModeOnlineVs *RaceModeOnlineVs) {
    if(!DWC_IsServerMyself()){
        RaceModeOnlineVs->outPacket.minimumRaceFinishTime = ENPTCRC; // Replace unused field with CRC32 of the ENPT section for the current track
    }
    clearSendRH2(ptr_miscPacketHandler);
}

void CheckTrackIdent() {
    if(Raceinfo->timer == 240){
        
        u8 aid;
        for (aid = 0; aid < Racedata->main.scenarios[0].playerCount; aid++) {
            if (HideNSeekData.players[RKNetController->aidsToPids[aid]].doneTrackCheck || Racedata->main.scenarios->players[aid].playerType == PLAYER_REAL_LOCAL) {
                continue;
            }
            RaceHeader2VS* RH2 = GetRaceHeader2Buffer(ptr_miscPacketHandler, aid);
            
            if (RH2->minimumRaceFinishTime != ENPTCRC && aid != DWC_GetServerAid()) {
                HideNSeekData.players[RKNetController->aidsToPids[aid]].doneTrackCheck = 2; // We use this to show the right disconnection message later
                if (DWC_IsServerMyself()) {
                    bool ret = OSDisableInterrupts();
                    DWC_CloseConnectionHard(RKNetController->aidsToPids[aid]);
                    OSRestoreInterrupts(ret);
                }
                continue;
            }
            HideNSeekData.players[RKNetController->aidsToPids[aid]].doneTrackCheck = 1;
        }
        
    }
    return;
}