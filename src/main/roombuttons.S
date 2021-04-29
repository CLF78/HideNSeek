.include "asm_setup.S"

.global MessageButtons2, MessageButtons3, MessageButtons6

# Update limit
MessageButtons2:
li r7, 0x6C
xori r0, r0, 0x6C

# Original instruction
MessageButtons3:
rlwinm r0, r0, 0x18, 0x10, 0x1F

# Custom messages
cmplwi r0, 0xC
blt useCustomIndexes

# Normal messages
cmplwi r0, 0x6C
blt returnOriginal

# Original failsafe
li r3, 0
b end

# Custom messages go from 8410 to 8421
useCustomIndexes:
li r3, 8410
add r3, r3, r0
b end

# Copy of game's instruction (plus the subtraction)
returnOriginal:
mr r3, r0
subi r3, r3, 0xC
mr r0, r3
slwi r0, r0, 2
addi r3, r1, 0x18
lwzx r3, r3, r0

# Copy of game's instructions
end:
addi r1, r1, 0x1A0
blr

# Original instruction
MessageButtons6:
mr r20, r3

# If r3 is 0 the button must be hidden
cmpwi r3, 0
bnelr+

# Hide the button
li r20, -1
blr
