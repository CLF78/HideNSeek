.include "asm_setup.S"

.extern HalfTimer
.global RaceCountMod

# Get HalfTimer value
RaceCountMod:
lis r7, HalfTimer@ha
lbz r7, HalfTimer@l(r7)

# Get pointer to count array
lis r12, RaceCounts@h
ori r12, r12, RaceCounts@l

# Get corresponding race count
lbzx r0, r7, r12
blr

RaceCounts:
.byte 3, 1, 0
.align 4
