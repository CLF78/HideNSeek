.include "asm_setup.S"

.extern HideNSeekData, Racedata, SpectatorMode
.global MuteChars

# Did this one in ASM because lazy
MuteChars:

# Assume player is not Seeker
li r0, 0x40

# Check if Spectator Mode is on
lis r30, SpectatorMode@ha
lbz r30, SpectatorMode@l(r30)
cmpwi r30, 1
beq returnZero

# Get playerId
lwz r4, 0(r4)
lbz r4, 0x10(r4)

# Check if it's myself
lis r30, Racedata@ha
lwz r30, Racedata@l(r30)
lbz r30, 0xB84(r30)
cmpw r4, r30
beq returnZero

# Check if the player is a Seeker
slwi r4, r4, 2
lis r30, HideNSeekData@h
ori r30, r30, HideNSeekData@l+4
add r30, r30, r4
lbz r4, 0x1(r30)

# If so, return
cmpwi r4, 1
bnelr+

# Otherwise return 0
returnZero:
li r0, 0
blr
