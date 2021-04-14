.include "asm_setup.S"

.extern SomeJingleThing
.global CustomJingleFunc

# Move sfx id to r4
CustomJingleFunc:
mr r4, r3

# Instructions copied from original game
lis r3, SomeJingleThing@ha
lwz r3, SomeJingleThing@l(r3)
li r5, -1
lwz r12, 0(r3)
lwz r12, 0x20(r12)
mtctr r12
bctr
