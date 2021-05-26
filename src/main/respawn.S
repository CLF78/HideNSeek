.include "asm_setup.S"

.extern HideNSeekData, Have30SecondsPassed
.global RespawnCooldown

# Original instruction
RespawnCooldown:
lha r0, 0x236(r29)

# Check if 30 seconds have passed
lis r4, Have30SecondsPassed@ha
lbz r4, Have30SecondsPassed@l(r4)
cmpwi r4, 0
beqlr

# Get player id
lwz r3, 0(r3)
lbz r4, 0x10(r3)
slwi r4, r4, 2

# Get offset of player in HideNSeekData
lis r3, HideNSeekData@ha
ori r3, r3, HideNSeekData@l+4
add r3, r3, r4

# Check if player is seeker
lbz r4, 0x1(r3)
cmpwi r4, 1
beqlr

# Store 1 to isStopped
li r4, 1
stb r4, 0(r3)

# Store 60 to respawnTimer
li r4, 60
stb r4, 0x3(r3)

# Disable the boost and return
li r0, 0
blr
