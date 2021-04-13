.include "asm_setup.S"

.extern SomeJingleThing, IsLastMinute
.global CustomJingleFunc, TimerFlashFix

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

# Return 0 or 1
TimerFlashFix:
lis r3, IsLastMinute@ha
lbz r3, IsLastMinute@l(r3)
blr
