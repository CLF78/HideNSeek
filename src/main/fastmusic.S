.include "asm_setup.S"

.extern MusicState, MusicPitch
.global FastMusic

# Original instruction
FastMusic:
mr r30, r3

# Check if music state change is important
cmpwi r4, 5
beq changeState
cmpwi r4, 7
bnelr+

# Reset pitch
lis r3, 0x3F80
lis r4, MusicPitch@ha
stw r3, MusicPitch@l(r4)

# Reset state
li r3, 0
lis r4, MusicState@ha
stw r3, MusicState@l(r4)
blr

# Check if MusicState is already 1
changeState:
lis r3, MusicState@ha
lbz r4, MusicState@l(r3)
cmpwi r4, 1
bne noPitch

# If not, set pitch
lis r11, 0x3F8C
lis r12, MusicPitch@ha
stw r11, MusicPitch@l(r12)

# Add 1 to MusicState
noPitch:
addi r4, r4, 1
stb r4, MusicState@l(r3)
blr
