.include "asm_setup.S"

.extern InvisibilityFunc
.global Invisibility

# Move aid to r5
Invisibility:
mr r5, r31

# Call function
b InvisibilityFunc
