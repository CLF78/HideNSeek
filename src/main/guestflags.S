.include "asm_setup.S"

.extern RKNetController
.extern SeekerCount, IsInfection, HalfTimer, AlwaysSeeker, BtGlitch, AlwaysWinVote
.global GuestFlags

# Check if mainType is 1
GuestFlags:
srwi r11, r3, 24
cmpwi r11, 1
bnelr+

# Get RKNetController->subs[currentSub].hostAid and check that it matches the aid in r4 (prevents guest from starting room, code by Seeky)
lwz r11, RKNetController@l(r24)
lwz r12, 0x291C(r11)
mulli r12, r12, 0x58
add r11, r11, r12
lbz r11, 0x5A(r11)
cmpw r11, r4
bne fakeHost

# Call FlagReset
mflr r0
bl FlagReset
mtlr r0

# Load 0x8000 in r12
lis r12, SeekerCount@ha

# Store SeekerCount
rlwinm r11, r3, 9, 31, 31
stb r11, SeekerCount@l(r12)

# Store IsInfection
rlwinm r11, r3, 10, 31, 31
stb r11, IsInfection@l(r12)

# Store HalfTimer
rlwinm r11, r3, 11, 31, 31
stb r11, HalfTimer@l(r12)

# Store AlwaysSeeker
rlwinm r11, r3, 12, 31, 31
stb r11, AlwaysSeeker@l(r12)

# Store BtGlitch
rlwinm r11, r3, 13, 31, 31
stb r11, BtGlitch@l(r12)

# Store AlwaysWinVote
rlwinm r11, r3, 14, 31, 31
stb r11, AlwaysWinVote@l(r12)

# Finally, clean up the subType to remove any flag
rlwinm r3, r3, 0, 22, 7
blr

# Replace room message to prevent room from starting
fakeHost:
li r3, 0
blr
