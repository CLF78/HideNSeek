.include "asm_setup.S"

.extern BattleRespawnFixHook, BattleRespawnFix
.global BattleSpawnFix, BattleCCFix, BattleRespawnFixASM, InfinityFloat

# Original instruction
BattleSpawnFix:
lwz r0, 0xB70(r7)

# Check if the track is a battle arena
lwz r4, 0xB68(r7)
cmpwi r4, 0x20
bltlr+

# If so force mission starting points (battle ones are buggy!)
li r0, 4
blr

# Get track slot
BattleCCFix:
lwz r30, 0xB68(r4)

# Check if battle arena and move condition to CR0+EQ
cmpwi r30, 0x20
crmove 2, 0
blr

# Modified original instruction
BattleRespawnFixASM:
bne returnOg

# Get respawn data from r5 and call our custom function
lwz r4, 0x34(r5)
bl BattleRespawnFix
b BattleRespawnFixHook+0x2B0

# Branch back if checkpoints are present
returnOg:
b BattleRespawnFixHook+4

InfinityFloat:
.align 4
.long 0x7F800000
