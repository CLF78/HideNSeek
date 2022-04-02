.include "asm_setup.S"

.global ItemMod

########################
# Item Probability Mod #
########################

# Assume Mushroom
ItemMod:
li r3, 4

# Get a random number using the timebase as a seed (modulo division)
mftbl r4
li r5, 100
divw r5, r4, r5
mulli r5, r5, 100
subf r4, r5, r4

# Since timebase-low might be negative, get absolute value
srawi r5, r4, 31
xor r4, r5, r4
subf r4, r5, r4

# If value is less than 90, give a Single Mushroom
cmpwi r4, 90
bltlr+

# Otherwise give Triple Mushroom
li r3, 5
blr
