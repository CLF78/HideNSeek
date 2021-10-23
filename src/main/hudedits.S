.include "asm_setup.S"

.extern HideNSeekData
.global HideHUD, UpdateScore

#############################
# Disable Screen Elements #
#############################

# Turn off position, lap and minimap
HideHUD:
rlwinm r3, r3, 0, 29, 25

# Enable score
ori r31, r3, 0x400
blr

################
# Update Score #
################

UpdateScore:
lis r31, HideNSeekData@ha
lbz r31, HideNSeekData@l+1(r31)
blr
