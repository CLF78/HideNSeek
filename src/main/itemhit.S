.include "asm_setup.S"

.extern ItemHolder
.extern ItemHitLocal, ItemHit1Hook
.global ItemHitLocalHelper

#####################
# Item Hit Helper 1 #
#####################

# Get player id
ItemHitLocalHelper:
lis r3, ItemHolder@ha
lwz r3, ItemHolder@l(r3)
lwz r3, 0x14(r3)
li r4, 0x248
sub r3, r30, r3
divw r3, r3, r4

# Call function
bl ItemHitLocal

# Restore some registers
mr r3, r30
mr r4, r31

# Original instruction and return
lbz r0, 0x1A(r3)
b ItemHitLocalHook+4
