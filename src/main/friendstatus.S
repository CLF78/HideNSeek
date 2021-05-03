.include "asm_setup.S"

.extern IsInfection
.global FriendStatusFix

# This is copied as an array and not actually executed
FriendStatusFix:
lis r3, IsInfection@ha
lbz r3, IsInfection@l(r3)
cmpwi r3, 0
beq +0x10
cmpwi r3, 1
