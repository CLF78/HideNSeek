.include "asm_setup.S"

.extern MusicState, MusicPitch
.global FastMusicEnable, FastMusicDisable

######################
# Music Pitch Enable #
######################

# Check if MusicState is already 1
FastMusicEnable:
lis r3, MusicState@ha
lbz r4, MusicState@l(r3)
cmpwi r4, 1
bne noPitch

# If not, set pitch
lis r5, 0x3F8C
lis r12, MusicPitch@ha
stw r5, MusicPitch@l(r12)

# Add 1 to MusicState
noPitch:
addi r4, r4, 1
stb r4, MusicState@l(r3)

# Original instruction
li r4, 0x74
blr

#######################
# Music Pitch Disable #
#######################

# Reset pitch
FastMusicDisable:
lis r28, 0x3F80
lis r4, MusicPitch@ha
stw r28, MusicPitch@l(r4)

# Original instruction
li r28, 0
blr
