.include "asm_setup.S"

.extern SeekerCount, IsInfection, HalfTimer, AlwaysSeeker, GlitchesAllowed, BtGlitch, AlwaysWinVote, HostFlagsHook, PrevSeekers
.global HostFlags, SceneSwap

# Get message type
HostFlags:
srwi r11, r4, 24
cmpwi r11, 1
bne+ normalRoomMessage

# It's a Room Start message, attach all flags! Load 0x8000 in r11
lis r11, SeekerCount@ha

# Store IsInfection
rlwinm r12, r4, 24, 31, 31
stb r12, IsInfection@l(r11)

# Reset PrevSeekers
li r12, -1
sth r12, PrevSeekers@l(r11)

# Attach SeekerCount
lbz r12, SeekerCount@l(r11)
slwi r12, r12, 23
or r4, r4, r12

# Attach HalfTimer
lbz r12, HalfTimer@l(r11)
slwi r12, r12, 22
or r4, r4, r12

# Attach AlwaysSeeker
lbz r12, AlwaysSeeker@l(r11)
slwi r12, r12, 21
or r4, r4, r12

# Attach GlitchesAllowed
lbz r12, GlitchesAllowed@l(r11)
slwi r12, r12, 20
or r4, r4, r12

# Attach BtGlitch
lbz r12, BtGlitch@l(r11)
slwi r12, r12, 19
or r4, r4, r12

# Attach Always Win Vote
lbz r12, AlwaysWinVote@l(r11)
slwi r12, r12, 18
or r4, r4, r12

# Return
b end

# Check if it's a Room Message
normalRoomMessage:
cmpwi r11, 4
bne end

# It's a Room Chat message! Get message subtype
srwi r11, r4, 8
rlwinm r12, r11, 0, 0xFFFF

# Flag = !(subtype & 1)
rlwinm r11, r11, 0, 31, 31
xori r11, r11, 1

# Load 0x8000 in r6
lis r6, SeekerCount@ha

# Check if it's SeekerCount
cmpwi r12, 1
bgt+ notSeekerCount
stb r11, SeekerCount@l(r6)
b end

# Check if it's HalfTimer
notSeekerCount:
cmpwi r12, 3
bgt+ notHalfTimer
stb r11, HalfTimer@l(r6)
b end

# Check if it's AlwaysSeeker
notHalfTimer:
cmpwi r12, 5
bgt+ notAlwaysSeeker
stb r11, AlwaysSeeker@l(r6)
b end

# Check if it's GlitchesAllowed
notAlwaysSeeker:
cmpwi r12, 7
bgt+ notGlitchesAllowed
stb r11, GlitchesAllowed@l(r6)
b end

# Check if it's BtGlitch
notGlitchesAllowed:
cmpwi r12, 9
bgt+ notBtGlitch
stb r11, BtGlitch@l(r6)
b end

# Check if it's AlwaysWinVote
notBtGlitch:
cmpwi r12, 11
bgt+ end
stb r11, AlwaysWinVote@l(r6)

# Original instruction (we cannot use BL here since the function doesn't save the LR)
end:
li r0, 2
b HostFlagsHook+4

# Check for Friend Room Team VS
SceneSwap:
cmpwi r4, 0x61
bne+ not61

# Switch to normal VS
li r4, 0x60
b return

# Check for Battle Voting
not61:
cmpwi r4, 0x59
bne+ not59

# Set IsInfection and HalfTimer to 1 and switch to VS Voting
li r4, 1
lis r31, IsInfection@ha
stb r4, IsInfection@l(r31)
stb r4, HalfTimer@l(r31)
li r4, 0x58
b return

# Check for Battle Live View
not59:
cmpwi r4, 0x6E
bne+ return

# Set IsInfection and HalfTimer to 1 and switch to VS Live View
li r4, 1
lis r31, IsInfection@ha
stb r4, IsInfection@l(r31)
stb r4, HalfTimer@l(r31)
li r4, 0x6A

# Original instruction
return:
mr r31, r4
blr
