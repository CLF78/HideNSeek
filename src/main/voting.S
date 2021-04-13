.include "asm_setup.S"

.extern AlwaysWinVote
.global VotePatch

# Check that it's a friend room
VotePatch:
lwz r12, 0(r31)
cmpwi r12, 3
bne end

# Check that the option was enabled
lis r12, AlwaysWinVote@ha
lbz r12, AlwaysWinVote@l(r12)
cmpwi r12, 1
bne end

# If both conditions are satisfied, replace the player id with the host's
li r4, 0

# Original instruction
end:
stb r4, 0x3E(r31)
blr
