#pragma once
#include <common.h>

typedef struct {
	u32 checksum[2];
	u8 headerLen;
	u8 raceheader1_len;
	u8 raceheader2_len;
	u8 room_select_len;
	u8 racedata_len;
	u8 user_len;
	u8 item_len;
	u8 event_len;
	u8 data[0x2D0]; // Filler to be used for various things
} RacePacket;


typedef struct {
	u8 data[0x40];
} RacedataPacket;

typedef struct {
	u8 data[0x7];
	u8 isPlayerDead;
} ItemPacket;
