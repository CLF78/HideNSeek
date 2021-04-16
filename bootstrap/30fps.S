.include "asm_setup.S"

.global ThirtyFPS1

# Use a different register as r7 is also used elsewhere
ThirtyFPS1:
li r0, 2

# Modified original instruction
stb r0, 0x69(r8)
blr
