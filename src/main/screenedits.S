.include "asm_setup.S"

.extern ScreenLoadHook, ScreenDSIFix1Hook
.extern createScreen, switchScreen
.global ScreenLoad, CupScreenPatch, BattleCupScreenPatch, ScreenDSIFix1, ScreenDSIFix2

################################
# Add Screens To Course Select #
################################

# Load screens 0x78 and 0x79
ScreenLoad:
mr r3, r31
li r4, 0x78
bl createScreen

mr r3, r31
li r4, 0x79
bl createScreen

# Original instruction
mr r3, r31
b ScreenLoadHook+4

###########################
# Patch Cup Select Screen #
###########################

# Call switch screen function
CupScreenPatch:
li r4, 0x78
li r5, 0
b switchScreen

##################################
# Patch Battle Cup Select Screen #
##################################

# Call switch screen function
BattleCupScreenPatch:
li r4, 0x6E
li r5, 0
b switchScreen

#######################
# Fix DSI Exception 1 #
#######################

# Check if r5 is 0
ScreenDSIFix1:
cmpwi r5, 0
beq skip

# Original instruction
mr r3, r5
b ScreenDSIFix1Hook+4

skip:
b ScreenDSIFix1Hook+8

#######################
# Fix DSI Exception 2 #
#######################

# Check if r4 is 0
ScreenDSIFix2:
cmpwi r4, 0
beqlr

# Original instruction
lfs f1, 0(4)
blr
