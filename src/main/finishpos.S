.include "asm_setup.S"

.extern FixPositions, FixPositionsHook
.global FixPositionsHelper

# Call function
FixPositionsHelper:
bl FixPositions

# Move pid to r24 and return
mr r24, r3
b FixPositionsHook+4
