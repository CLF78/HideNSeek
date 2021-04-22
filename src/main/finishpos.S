.include "asm_setup.S"

.extern FixPositions, FixPositionsHook, HideNSeekData
.global FixPositionsHelper, FixFanfare

#############################
# Position Order Fix Helper #
#############################

# Call function
FixPositionsHelper:
bl FixPositions

# Move pid to r24 and return
mr r24, r3
b FixPositionsHook+4

###############
# Fanfare Fix #
###############

# Replace position with our own
FixFanfare:
lis r28, HideNSeekData@h
ori r28, r28, HideNSeekData@l+4
slwi r4, r30, 2
add r28, r28, r4
lbz r28, 0(r28)
blr
