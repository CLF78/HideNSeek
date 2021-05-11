.include "asm_setup.S"

.extern SpectatorModeMain, SpectatorModeHook, UseReplayCams, UseBackwardsView, BackwardsCameraHook
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

# Check if UseBackwardsView is on
BackwardsCameraManager:
lis r4, UseBackwardsView@ha
lbz r4, UseBackwardsView@l(r4)
cmpwi r4, 1
bne+ end

# If so, branch further in the function
b BackwardsCameraHook+0x44

# Original instruction
end:
lhz r0, 0x2C(r3)
b BackwardsCameraHook+4
