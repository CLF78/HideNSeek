.include "asm_setup.S"

.extern Racedata
.extern HideNSeekData, BtGlitch
.global TagDistanceFunc

# Backup LR
TagDistanceFunc:
mflr r11

# Do bl trick
bl trick

.float 7500.0
.float 75000.0

trick:
mflr r3

# Get whether BtGlitch is on and load the float accordingly
lis r4, BtGlitch@ha
lbz r4, BtGlitch@l(r4)
slwi r4, r4, 2
lfsx f0, r3, r4

# Get my pid
lis r4, Racedata@ha
lwz r4, Racedata@l(r4)
lbz r4, 0xB84(r4)
slwi r4, r4, 2

# Check whether i am a Seeker or not
lis r5, HideNSeekData@h
ori r5, r5, HideNSeekData@l+4
add r5, r5, r4
lbz r4, 0x2(r5)
cmpwi r4, 0
beq+ end

# Set float to 0 otherwise
fsub f0, f0, f0

# Return one instruction later
end:
addi r11, r11, 4
mtlr r11
blr
