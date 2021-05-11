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
lis r3, GlitchesAllowed@ha
lbz r3, GlitchesAllowed@l(r3)
cmpwi r3, 1
beqlr

# If not, force 0 in r0
li r0, 0
blr

##################################
# Disable Horizontal Wall Glitch #
##################################

# Return whether glitches are allowed in r21
DisableHWG:
lis r21, GlitchesAllowed@ha
lbz r21, GlitchesAllowed@l(r21)
blr
