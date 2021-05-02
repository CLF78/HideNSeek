.include "asm_setup.S"

.extern FixPositions, FixPositionsHook, FixPositions5Hook, HideNSeekData
.global FixPositionsHelper, FixFanfare, FixPositions4, FixPositions5Helper

#############################
# Position Order Fix Helper #
#############################

# Call function
FixPositionsHelper:
bl FixPositions

# Move pid to r24 and return
mr r24, r3
b FixPositionsHook+4

#############################
# Position Order Fix 4 (WW) #
#############################

# Load our custom position
FixPositions4:
lis r3, HideNSeekData@h
ori r3, r3, HideNSeekData@l+4
add r3, r3, r19
lbz r23, 0(r3)
blr

#############################
# Position Order Fix 5 (WW) #
#############################

# Call function
FixPositions5Helper:
bl FixPositions

# Move pid to r25 and return
mr r25, r3
b FixPositions5Hook+4

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
