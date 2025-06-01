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
    if (Raceinfo->timer == 240) {
        
        u8 pid;
        for (pid = 0; pid < Racedata->main.scenarios[0].playerCount; pid++) {
            if (HideNSeekData.players[pid].doneTrackCheck || Racedata->main.scenarios->players[pid].playerType == PLAYER_REAL_LOCAL) {
                continue;
            }
            RaceHeader2VS* RH2 = GetRaceHeader2Buffer(ptr_miscPacketHandler, RKNetController->aidsToPids[pid]);
            
            if (RH2->minimumRaceFinishTime != ENPTCRC && RKNetController->aidsToPids[pid] != DWC_GetServerAid()) {
                HideNSeekData.players[pid].doneTrackCheck = 2; // We use this to show the right disconnection message later
                if (DWC_IsServerMyself()) {
                    bool ret = OSDisableInterrupts();
                    DWC_CloseConnectionHard(RKNetController->aidsToPids[pid]);
                    OSRestoreInterrupts(ret);
                }
                continue;
            }
            HideNSeekData.players[pid].doneTrackCheck = 1;
        }
        
    }
    return;
}