.include "asm_setup.S"

.extern HideNSeekData, Racedata
.global HideHUD, UpdateScore, ScoreSound

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

###############
# Score Sound #
###############

# Check if we are not a Seeker
ScoreSound:
lis r3, Racedata@ha
lwz r3, Racedata@l(r3)
lbz r3, 0xB84(r3)
slwi r3, r3, 2
lis r4, HideNSeekData@ha
ori r4, r4, HideNSeekData@l+5
lbzx r3, r3, r4
cmpwi r3, 0
blr
