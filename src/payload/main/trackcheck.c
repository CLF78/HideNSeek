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
        OSReport("ENPTCRC: %x\n", ENPTCRC);
        RaceModeOnlineVs->outPacket.minimumRaceFinishTime = ENPTCRC; // Replace unused field with CRC32 of the ENPT section for the current track
    }
    return;
}

void CheckTrackIdent() {
    if(DWC_IsServerMyself()){
        u8 playerId;
        OSReport("Racedata->main.scenarios[0].playerCount: %x\n", Racedata->main.scenarios[0].playerCount);
        for (playerId = 0; playerId < Racedata->main.scenarios[0].playerCount; playerId++) {
            if (HideNSeekData.players[RKNetController->aidsToPids[playerId]].doneTrackCheck) {
                OSReport("Player %x has already checked track ident\n", playerId);
                continue;
            }
            OSReport("Checking Track Ident for %x\n", playerId);
            OSReport("Player Type: %x\n", Racedata->main.scenarios->players[playerId].playerType);
            if (Racedata->main.scenarios->players[playerId].playerType == PLAYER_REAL_LOCAL) {
                OSReport("Player %x is local\n", playerId);
                continue;
            }
            RaceHeader2VS* RH2 = GetRaceHeader2Buffer(ptr_miscPacketHandler, playerId);
            OSReport("Player returned %x, expecting %x\n", RH2->minimumRaceFinishTime, ENPTCRC);
            if (RH2->minimumRaceFinishTime == 0) {
                OSReport("Player %x has not sent track ident\n", playerId);
                continue;
            }
            if (RH2->minimumRaceFinishTime != ENPTCRC) {
                OSReport("Player %x has a different track\n", playerId);
                bool ret = OSDisableInterrupts();
                DWC_CloseConnectionHard(RKNetController->aidsToPids[playerId]);
                OSRestoreInterrupts(ret);
            }
            HideNSeekData.players[RKNetController->aidsToPids[playerId]].doneTrackCheck = 1;
        }
        
    }
    return;
}