.include "asm_setup.S"

.extern DecrementScreenElements, HideNSeekData
.global HideHUD, UpdateScore

#############################
# Decrement Screen Elements #
#############################

# Load screen type
HideHUD:
lwz r5, 0x4(r3)

# Froom VS
cmpwi r5, 0x42
bne+ end

# Decrement
subi r4, r4, 2

# Original instruction
end:
mr r5, r4
b DecrementScreenElements+4

################
# Update Score #
################

UpdateScore:
lis r31, HideNSeekData@ha
lbz r31, HideNSeekData@l+1(r31)
blr
