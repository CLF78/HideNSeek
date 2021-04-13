.include "asm_setup.S"

.extern Racedata
.global BattleSpawnFix, BattleCCFix

# Original instruction
BattleSpawnFix:
lwz r0, 0xB70(r7)

# Check if the track is a battle arena
lwz r4, 0xB68(r7)
cmpwi r4, 0x20
bltlr+

# If so force battle starting points
li r0, 3
blr

# Load current track from Racedata
BattleCCFix:
lis r3, Racedata@ha
lwz r3, Racedata@l(r3)
lwz r3, 0xB68(r3)
cmpwi r3, 0x20
blr
