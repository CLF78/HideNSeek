.include "asm_setup.S"

.extern ScreenHUD, TeamLineColors, ZeroFloat, PlayAnim
.extern BtGlitch, Racedata
.global TagDistanceFunc, UpdateTag

#########################
# Tag Distance Modifier #
#########################

# Backup LR
TagDistanceFunc:
mflr r11

# Do bl trick
bl trick

.float 7500.0
.float 75000.0

trick:
mflr r3

# Get whether BtGlitch is on
lis r4, BtGlitch@ha
lbz r4, BtGlitch@l(r4)
slwi r4, r4, 2

# Check if CTSupport was enabled
lis r12, CTSupport@ha
lbz r12, CTSupport@l(r12)
cmpwi r12, 1
beq continue

# Get track slot
lis r12, Racedata@ha
lwz r12, Racedata@l(r12)
lwz r12, 0xB68(r12)

# Check if it's Funky Stadium, Chain Chomp Wheel or N64 Skyscraper
cmpwi r12, 0x22
beq apply

cmpwi r12, 0x23
beq apply

cmpwi r12, 0x29
bne+ continue

# OR with 4 to load second float regardless
apply:
ori r4, r4, 4

# Load the float
continue:
lfsx f0, r3, r4

# Return one instruction later
end:
addi r11, r11, 4
mtlr r11
blr

#########################
# Real Time Tag Updater #
#########################

# Get hud instance
UpdateTag:
lis r5, ScreenHUD@ha
lwz r5, ScreenHUD@l(r5)
cmpwi r5, 0
beqlr

# Get player tag array
lwz r5, 0x1D0(r5)

# Setup loop
li r6, 0

# Get tag
loop:
mulli r7, r6, 0x188
add r7, r7, r5

# Get tag player id
lwz r8, 0x178(r7)
cmpw r8, r3
beq foundPid

# Exit loop if r6 is 3
addi r6, r6, 1
cmpwi r6, 3
blt+ loop
blr

# We found the pid! Free registers = r5, r6, r8
foundPid:

# Get line color
slwi r5, r4, 2
lis r6, TeamLineColors@h
ori r6, r6, TeamLineColors@l
lwzx r6, r6, r5

# Store it
lwz r5, 0x184(r7)
stw r6, 0xD8(r5)
stw r6, 0xDC(r5)
stw r6, 0xC0(r5)
stw r6, 0xC4(r5)

# Call function to change text color
lwz r3, 0x98(r7)
addi r3, r3, 0x44
lis r5, ZeroFloat@ha
lfs f1, ZeroFloat@l(r5)
b PlayAnim
