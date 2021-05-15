.include "asm_setup.S"

.extern BtGlitch, Racedata
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

# Get whether BtGlitch is on
lis r4, BtGlitch@ha
lbz r4, BtGlitch@l(r4)
slwi r4, r4, 2

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
