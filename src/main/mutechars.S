.include "asm_setup.S"

.extern HideNSeekData, Racedata, SpectatorMode
.global MuteChars

# Did this one in ASM because lazy
MuteChars:

# Assume mute
li r0, 0x40

# Preload HideNSeekData in r6
lis r6, HideNSeekData@h
ori r6, r6, HideNSeekData@l+5

# Get my pid
lis r30, Racedata@ha
lwz r30, Racedata@l(r30)
lbz r30, 0xB84(r30)
slwi r30, r30, 2

# If i'm Seeker, always return 0
lbzx r30, r30, r6
cmpwi r30, 0
beq returnZero

# Get playerId
lwz r4, 0(r4)
lbz r4, 0x10(r4)
slwi r4, r4, 2

# If the player is a Hider, return
lbzx r4, r4, r6
cmpwi r4, 0
beqlr+

# Otherwise return 0
returnZero:
li r0, 0
blr
