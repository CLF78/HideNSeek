.include "asm_setup.S"

.extern GlitchesAllowed, DisableHWGHook, ActivateOob
.global DisableWallride, DisableHWG

####################
# Disable Wallride #
####################

# Original instruction
DisableWallride:
lwz r0, 0x4(r3)

# Check if glitches are allowed
lis r4, GlitchesAllowed@ha
lbz r4, GlitchesAllowed@l(r4)
cmpwi r4, 1
beqlr

# Check if we are hitting a wall
andi. r4, r0, 0x60
beqlr

# If so unset the jump pad bit
rlwinm r0, r0, 0, 2, 0
stw r0, 0x4(r3)
blr

##################################
# Disable Horizontal Wall Glitch #
##################################

# Original instruction
DisableHWG:
stw r0, 0x10(r3)

# If glitches are allowed, don't do anything
lis r25, GlitchesAllowed@ha
lbz r25, GlitchesAllowed@l(r25)
cmpwi r25, 1
beq end

# If we didn't get here through the horizontal wall glitch, don't do anything either
rlwinm. r0, r0, 27, 31, 31
beq end

# Call respawn function
lwz r3, 0(r26)
lwz r3, 0x30(r3)
li r4, 1
li r5, 0
li r6, 0
li r7, 0
bl ActivateOob

# Restore r3
mr r3, r20

# Return
end:
b DisableHWGHook+4
