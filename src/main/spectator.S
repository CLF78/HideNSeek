.include "asm_setup.S"

.extern SpectatorModeMain, SpectatorModeHook, SpectatorMode, UseReplayCams
.global SpectatorModeFunc, ReplayCameraManager

# Another shitty ASM helper

# Modified original instruction
SpectatorModeFunc:
lbz r3, 0x9C(r29)

# Call main function
bl SpectatorModeMain

# Move r3 to r4 and return
mr r4, r3
b SpectatorModeHook+4

############################
# Replay Cameras Activator #
############################

# Original instruction
ReplayCameraManager:
lwz r0, 0xB74(r3)

# Check if Spectator Mode is on
lis r4, SpectatorMode@ha
lbz r4, SpectatorMode@l(r4)
cmpwi r4, 1
bnelr+

# Check if UseReplayCams is on
lis r4, UseReplayCams@ha
lbz r4, UseReplayCams@l(r4)
cmpwi r4, 1
bnelr+

# If both are valid, force 5 in r0
li r0, 5
blr
