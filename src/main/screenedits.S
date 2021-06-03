.include "asm_setup.S"

.extern ScreenLoadHook, ScreenDSIFix1Hook, ScreenDSIFix4Hook, MusicPitch
.extern createScreen, switchScreen
.global ScreenLoad, CupScreenPatch, BattleCupScreenPatch, ScreenDSIFix1, ScreenDSIFix2, ScreenDSIFix3, SceneSwap

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

#######################
# Fix DSI Exception 3 #
#######################

# Check if r5 is 0
ScreenDSIFix3:
cmpwi r5, 0
beq skip2

# Original instruction
mr r3, r5
b ScreenDSIFix4Hook+4

skip2:
b ScreenDSIFix4Hook+8

###############
# Screen Swap #
###############

# Reset Music Pitch (for when someone quits the race in an irregular way)
lis r31, 0x3F80
lis r6, MusicPitch@ha
stw r31, MusicPitch@l(r6)

# Check for Friend Room Team VS
SceneSwap:
cmpwi r4, 0x61
bne+ not61

# Switch to normal VS
li r4, 0x60
b return

# Check for Main Menu (from Game Menus)
not61:
cmpwi r4, 0x41
bne+ return

# Switch to Main Menu (from Settings)
li r4, 0x43

# Original instruction
return:
mr r31, r4
blr
