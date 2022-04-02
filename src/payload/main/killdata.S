.include "asm_setup.S"

.extern SystemManager, Racedata, PlayerHolder, ScreenHUD, Menudata
.extern KillData, MenuDataGetPlayerName, SetMSGID
.global InitKillData, GetBMGPlayer, ApplyKillData

#################################
# Change Element Position/Scale #
#################################

# Show element immediately
InitKillData:
li r4, 0
stb r4, 0x80(r3)

# 16:9 X Position = -120.0f
lis r4, 0xC2F0

# Check if widescreen
lis r5, SystemManager@ha
lwz r5, SystemManager@l(r5)
lwz r5, 0x58(r5)
cmpwi r5, 1
beq+ widescreen

# 4:3 X Position = -30.0f
lis r4, 0xC1F0

# Store position
widescreen:
stw r4, 0x1C(r3)

# Y Position = -160.0f
lis r4, 0xC320
stw r4, 0x20(r3)

# Alignment = Left
lwz r3, 0x114(r3)
lwz r3, 0(r3)
li r4, 0
stb r4, 0x100(r3)

#######################
# Initialize KillData #
#######################

# Get KillData
lis r3, KillData@h
ori r3, r3, KillData@l+4

# Does not require an update
li r4, 0
stw r4, -0x4(r3)

# Setup loop
li r4, 0
li r5, -1
li r6, 3
mtctr r6

# Loop!
loop:
stw r4, 0(r3)
stw r5, 0x4(r3)
addi r3, r3, 8
bdnz+ loop

# Original instruction
addi r3, r1, 0x28
blr

##################
# Get BMG Player #
##################

# Copied from player tags
GetBMGPlayer:
mr r4, r3
lis r3, MenuData@ha
lwz r3, MenuData@l(r3)
lwz r3, 0x98(r3)
addi r3, r3, 0x188
b MenuDataGetPlayerName

###################
# Apply Kill Data #
###################

# Doing it in ASM cuz lazy
ApplyKillData:
mr r5, r3
lis r3, ScreenHUD@ha
lwz r3, ScreenHUD@l(r3)
lwz r3, 0x5C(r3)
li r4, 0x45F
b SetMSGID
