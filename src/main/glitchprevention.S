.include "asm_setup.S"

.extern AllowGlitches
.global DisableWallride, DisableHWG

####################
# Disable Wallride #
####################

# Original instruction
DisableWallride:
lwz r0, 0x4(r3)

# Check if glitches are allowed
lis r3, AllowGlitches@ha
lbz r3, AllowGlitches@l(r3)
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
lis r21, AllowGlitches@ha
lbz r21, AllowGlitches@l(r21)
blr
