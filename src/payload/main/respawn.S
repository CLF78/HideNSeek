.include "asm_setup.S"

.extern HideNSeekData, Have30SecondsPassed
.global RespawnCooldown

# Original instruction
RespawnCooldown:
lhz r3, 0x234(r30)

# Check if 30 seconds have passed
lis r5, Have30SecondsPassed@ha
lbz r5, Have30SecondsPassed@l(r5)
cmpwi r5, 0
beqlr

# Get player id
lwz r5, 0(r30)
lwz r5, 0(r5)
lbz r5, 0x10(r5)
slwi r5, r5, 2

# Get offset of player in HideNSeekData
lis r6, HideNSeekData@ha
ori r6, r6, HideNSeekData@l+4
add r5, r5, r6

# Check if player is seeker
lbz r5, 0x1(r5)
cmpwi r5, 1
beqlr

# Add 60 to respawn timer if not
addi r4, r4, 60
blr
