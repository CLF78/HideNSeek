#pragma once
#include "common.h"

// Documentation by Seeky, _tZ, Kevin, Leseratte, stebler and Melg

typedef struct {
	void* vtable;
	u16 minutes;
	u8 seconds;
	u8 pad;
	u16 milliseconds;
	u8 unk[0x2];
} Timer;
	

typedef struct {
	void* vtable;
	Timer timers[3];
	u8 unk[0x20];
	u32 frames;
	u8 unk2[0x4];
} TimerManager;	// Total size 0x50

typedef struct {
	void* vtable;
	u8 unk[0x4];
	u8 id;
	u8 unknown_0x9;
	u16 checkpoint;
	float raceCompletion;
	float raceCompletionMax;
	float firstKcpLapCompletion;
	float nextCheckpointLapCompletion;
	float nextCheckpointLapCompletionMax;
	u8 position;
	u8 respawn;
	u16 battleScore;
	u16 currentLap;
	u8 maxLap;
	u8 currentKCP;
	u8 maxKCP;
	u8 unk2[0x3];
	u32 frameCounter;
	u32 framesInFirst;
	u8 unk3[0x4];
	u32 stateFlags;
	/*
	  64 is coming last animation?
	  32 is finishing the race?
	  16 is a dc?
	  4 is driving wrong way
	  2 is end of race camera
	  1 is in race?
	*/
	Timer** lapFinishTimes;
	Timer* raceFinishTime;
	u32 endReason;
	void* controllerHolder;
	u8 unk5[0x8];
} RaceinfoPlayer;	// Total size 0x54

typedef struct {
    void* vtable;
    void* random1;
    void* random2;
    RaceinfoPlayer **players;
    void* gamemodeData;
    TimerManager* timerManager;
    u8 unk[8];
    u32 timer;
    u8 unk2[4];
    u32 raceState;
} _Raceinfo;

extern _Raceinfo* Raceinfo;
