.include "asm_setup.S"

.extern HideNSeekData, Racedata, SpectatorMode
.global NoStarMusic2

# Check if Spectator Mode is enabled
NoStarMusic2:
lis r31, SpectatorMode@ha
lbz r31, SpectatorMode@l(r31)
cmpwi r31, 1
beq turnOff

# Check if we are a Seeker
lis r31, Racedata@ha
lwz r31, Racedata@l(r31)
lbz r31, 0xB84(r31)
slwi r31, r31, 2
lis r30, HideNSeekData@ha
ori r30, r30, HideNSeekData@l+5
lbzx r31, r31, r30
cmpwi r31, 1
bne end

# If any of these is true, turn off everyone's Star music
turnOff:
li r4, 0

# Original instruction
end:
mr r30, r4
blr
