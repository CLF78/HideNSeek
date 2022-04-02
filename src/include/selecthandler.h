#pragma once
#include <common.h>

// Documentation by Seeky

typedef struct {
	u64 timeSender;
	u64 timeReceiver;
	u8 unk[0x10];
	u32 selectId;
	u32 battleFlags;
	u8 aidsBelongingToPlayerIds[12];
	u8 winningTrack;
	u8 phase;
	u8 winningVoter;
	u8 engineClass;
} SelectPacket;

typedef struct {
	u8 unk[0x2C];
	u32 teams;
	u8 unk2[0x30];
	SelectPacket recvPackets[12];
	// Incomplete
} _RKNetSelectHandler;

extern _RKNetSelectHandler* RKNetSelectHandler;
