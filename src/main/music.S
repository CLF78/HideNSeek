.include "asm_setup.S"

.extern SomeJingleThing
.global CustomJingleFunc

# Check if race is still going
CustomJingleFunc:
lis r4, Raceinfo@ha
lwz r4, Raceinfo@l(r4)
lwz r4, 0x28(r4)
cmpwi r4, 4
beqlr

# If so, move sfx id to r4
mr r4, r3

# Instructions copied from original game
lis r3, SomeJingleThing@ha
lwz r3, SomeJingleThing@l(r3)
li r5, -1
lwz r12, 0(r3)
lwz r12, 0x20(r12)
mtctr r12
bctr
