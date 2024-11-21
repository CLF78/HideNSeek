#include "common.h"
#include "hidenseek.h"
#include "kartdynamics.h"
#include "os.h"
#include "racedata.h"

extern u8 InstantRespawn3;
void RespawnCooldown(KartDynamics* kartDynamics){
    if (Have30SecondsPassed && !HideNSeekData.players[Racedata->main.scenarios[0].settings.hudPlayerIds[0]].isSeeker){
        kartDynamics->noGravity = 1;
        InstantRespawn3 = 0x6E;
    } else {
        kartDynamics->noGravity = 0;
        InstantRespawn3 = 0;
    }
}

