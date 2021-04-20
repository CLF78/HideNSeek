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

# Store 0 to hardSpeedLimit
li r4, 0
stw r4, 0x2C(r29)

# Get player id
lwz r3, 0(r3)
lbz r4, 0x10(r3)
slwi r4, r4, 2

# Get offset of player in HideNSeekData
lis r3, HideNSeekData@ha
ori r3, r3, HideNSeekData@l+4
add r3, r3, r4

# Store 60 to respawnTimer and return
li r4, 60
stb r4, 0x3(r3)
blr
