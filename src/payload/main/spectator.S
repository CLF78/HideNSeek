.include "asm_setup.S"

.extern SpectatorModeMain, SpectatorModeHook, UseReplayCams, PlayerHolder, Racedata
.global SpectatorModeFunc, ReplayCameraManager, BackwardsCameraManager

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

# Check if UseReplayCams is on
lis r4, UseReplayCams@ha
lbz r4, UseReplayCams@l(r4)
cmpwi r4, 1
bnelr+

# If so, force 5 in r0
li r0, 5
blr

##############################
# Backwards Camera Activator #
##############################

# Original instruction
BackwardsCameraManager:
mr r30, r3

# Get my pid
lis r4, Racedata@ha
lwz r4, Racedata@l(r4)
lbz r4, 0xB84(r4)
slwi r4, r4, 2

# Get my PlayerHolder
lis r3, PlayerHolder@ha
lwz r3, PlayerHolder@l(r3)
lwz r3, 0x20(r3)
lwzx r3, r3, r4
blr
