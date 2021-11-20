.include "asm_setup.S"

.extern HideNSeekData, UpdateScoreHook, ScoreSound
.global HideHUD, UpdateScore, ScoreSoundASM

#############################
# Disable Screen Elements #
#############################

# Turn off position, lap and minimap
HideHUD:
rlwinm r3, r3, 0, 29, 25

# Enable score and kill info text
ori r31, r3, 0x1400
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

# Call C function
ScoreSoundASM:
mr r3, r31
bl ScoreSound

# Check result
cmpwi r3, 0
beq noSound
cmpwi r3, 1
beq yesSound

# Negative jingle
b UpdateScoreHook+0x4C

# Positive jingle
yesSound:
b UpdateScoreHook+0x38

# No jingle
noSound:
b UpdateScoreHook+0x5C
