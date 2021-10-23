.include "asm_setup.S"

.global BattleSpawnFix, BattleCCFix

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
