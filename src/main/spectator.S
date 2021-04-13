.include "asm_setup.S"

.extern SpectatorModeMain, SpectatorModeHook
.global SpectatorModeFunc

# Another shitty ASM helper

# Modified original instruction
SpectatorModeFunc:
lbz r3, 0x9C(r29)

# Call main function
bl SpectatorModeMain

# Move r3 to r4 and return
mr r4, r3
b SpectatorModeHook+4
