.include "asm_setup.S"

.extern GlitchesAllowed
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

# Return whether glitches are allowed in r21
DisableHWG:
lis r21, GlitchesAllowed@ha
lbz r21, GlitchesAllowed@l(r21)
blr
