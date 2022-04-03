.include "asm_setup.S"

.extern SeekerCount, IsInfection, HalfTimer, AlwaysSeeker, GlitchesAllowed, BtGlitch, AlwaysWinVote, HostFlagsHook, PrevSeekers, NoInvincibility
.global HostFlags

# Load 0x8000 in r5
HostFlags:
lis r5, IsInfection@ha

# Move mainType to r12
srwi r12, r4, 24

# Check mainType 1 (ROOM START)
cmplwi r12, 1
bne+ continueMainCheck

##############
# Room Start #
##############

# Reset PrevSeekers
li r12, -1
sth r12, PrevSeekers@l(r5)

# Save game mode
ori r5, r5, IsInfection@l
srwi r11, r4, 8
stb r11, 0(r5)

# Setup loop
li r12, 7
mtctr r12
lis r12, shifts@h
ori r12, r12, shifts@l-1

# Load flag and shift
loop:
lbzu r11, 1(r5)
lbzu r6, 1(r12)

# Shift and OR
slw r11, r11, r6
or r4, r4, r11

# Continue the loop
bdnz+ loop

# Go to end
b end

################
# Room Message #
################

# Check mainType 4 (ROOM MESSAGE)
continueMainCheck:
cmplwi r12, 4
bne+ end

# Move subtype to r12
rlwinm r12, r4, 24, 16, 31

# Store SeekerCount
cmpwi r12, 1
bgt continueSubCheck

# Flag = !MSG
xori r12, r12, 1
stb r12, SeekerCount@l(r5)
b end

# Store AlwaysWinVote
continueSubCheck:
cmpwi r12, 3
bgt continueSubCheck2

# Flag = !(MSG & 1)
rlwinm r12, r12, 0, 31, 31
xori r12, r12, 1
stb r12, AlwaysWinVote@l(r5)
b end

# Store HalfTimer
continueSubCheck2:
cmpwi r12, 6
bgt continueSubCheck3

# Flag = MSG & 3
rlwinm r12, r12, 0, 30, 31
stb r12, HalfTimer@l(r5)
b end

# Store AlwaysSeeker
continueSubCheck3:
cmpwi r12, 9
bgt continueSubCheck4

# Flag = (MSG - 7)
subi r12, r12, 7
stb r12, AlwaysSeeker@l(r5)
b end

# Store GlitchesAllowed
continueSubCheck4:
cmpwi r12, 11
bgt continueSubCheck5

# Flag = !(MSG & 1)
rlwinm r12, r12, 0, 31, 31
xori r12, r12, 1
stb r12, GlitchesAllowed@l(r5)
b end

# Store BtGlitch
continueSubCheck5:
cmpwi r12, 13
bgt continueSubCheck6

# Flag = !(MSG & 1)
rlwinm r12, r12, 0, 31, 31
xori r12, r12, 1
stb r12, BtGlitch@l(r5)
b end

# Store NoInvincibility
continueSubCheck6:
cmpwi r12, 13
bgt end

# Flag = !(MSG & 1)
rlwinm r12, r12, 0, 31, 31
xori r12, r12, 1
stb r12, NoInvincibility@l(r5)

# Original instruction
end:
li r0, 2
b HostFlagsHook+4

########
# Data #
########

shifts:
.byte 23, 22, 20, 18, 17, 16, 15
.align 4
