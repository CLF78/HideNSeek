.include "asm_setup.S"

.extern HideNSeekData, Racedata, SpectatorMode
.extern NoInvincibility, NoStarInvincibilityHook
.global NoStarMusic2, NoStarInvincibility, NoStarInvincibility2, NoStarInvincibility3

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

# Modified skipped instruction
NoStarInvincibility:
rlwinm. r0, r3, 0, 27, 27

# Check if option is on
lis r12, NoInvincibility@ha
lbz r12, NoInvincibility@l(r12)
cmpwi cr7, r12, 1
beq cr7, return

# Modified original instruction
rlwimi. r0, r3, 0, 0, 0

# Return one instruction later
return:
b NoStarInvincibilityHook+8

# Get option
NoStarInvincibility2:
lis r28, NoInvincibility@ha
lbz r28, NoInvincibility@l(r28)

# NOT it
xori r28, r28, 1
blr

# Get option
NoStarInvincibility3:
lis r5, NoInvincibility@ha
lbz r5, NoInvincibility@l(r5)

# NOT it
xori r5, r5, 1

# Shift it
slwi r5, r5, 31
blr
