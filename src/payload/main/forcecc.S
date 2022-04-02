.include "asm_setup.S"

.global ForceCC

# Force 150cc
ForceCC:
li r5, 2

# Store it directly
stb r5, 0x3F(r3)
blr
