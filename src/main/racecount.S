.include "asm_setup.S"

.extern HalfTimer
.global RaceCountMod

# Original instruction
RaceCountMod:
li r0, 3

# Check if half timer is on
lis r7, HalfTimer@ha
lbz r7, HalfTimer@l(r7)
cmpwi r7, 1
beqlr+

# If not, set race count to 2
li r0, 1
blr
