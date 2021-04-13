.include "asm_setup.S"

.extern HideNSeekData
.global UpdateCompletions, UpdatePoints

# TODO: CHECK IF THIS WORKS FOR DCD PLAYERS

######################
# Update Completions #
######################

# Push stack
UpdateCompletions:
stwu r1, -0x10(r1)

# Load 4.0 in f3
lis r3, 0x4080
stw r3, 0x8(r1)
lfs f3, 0x8(r1)

# Load -0.25 in f4
lis r3, 0xBE80
stw r3, 0x8(r1)
lfs f4, 0x8(r1)

# Load HideNSeekData
lis r3, HideNSeekData@h
ori r3, r3, HideNSeekData@l+4

# Get player id * 4
lbz r4, 0x8(r30)
slwi r4, r4, 2

# Get position
add r4, r4, r3
lbz r4, 0(r4)

# Begin float conversion - load first magic number
lis r3, 0x5980
ori r3, r3, 0x0004
stw r3, 0x8(r1)
lfs f1, 0x8(r1)

# Load second magic number
lis r3, 0x4330
xoris r4, r4, 0x8000
stw r3, 0x8(r1)
stw r4, 0xC(r1)
lfd f2, 0x8(r1)

# Convert
fsub f1, f2, f1
frsp f1, f1

# Do maths
fmadds f1, f1, f4, f3

# Store resulting float in both raceCompletion and raceCompletionMax
stfs f1, 0xC(r30)
stfs f1, 0x10(r30)

# Return a bit later than usual - skip all the float calculation stuff
mflr r3
addi r3, r3, 0x180
mtlr r3
addi r1, r1, 0x10
blr

#################
# Update Points #
#################

UpdatePoints:
lis r3, HideNSeekData@h
ori r3, r3, HideNSeekData@l+4
slwi r12, r17, 2
add r3, r3, r12
lbz r3, 0x3(r3)
blr
