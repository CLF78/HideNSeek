.include "asm_setup.S"

.extern BtGlitch
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

# Return one instruction later
end:
addi r11, r11, 4
mtlr r11
blr
