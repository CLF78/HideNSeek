.include "asm_setup.S"

.extern ItemHolder, DisconnectPlayer
.extern ItemHit1, ItemHit1Hook
.global ItemHit1Helper, RaceinfoCrashFix

#####################
# Item Hit Helper 1 #
#####################

# Get player id
ItemHit1Helper:
lis r3, ItemHolder@ha
lwz r3, ItemHolder@l(r3)
lwz r3, 0x14(r3)
li r4, 0x248
sub r3, r30, r3
divw r3, r3, r4

# Call function
bl ItemHit1

# Restore some registers
mr r3, r30
mr r4, r31

# Original instruction and return
lbz r0, 0x1A(r3)
b ItemHit1Hook+4

######################
# Raceinfo Crash Fix #
######################

# Null pointer check
RaceinfoCrashFix:
cmpwi r3, 0
beqlr

# Original instruction
stwu r1, -0x10(r1)
b DisconnectPlayer+4
