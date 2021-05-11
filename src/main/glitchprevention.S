.include "asm_setup.S"

.extern GlitchesAllowed, Racedata
.global DisableWallride, DisableHWG, FallBoundary1, FallBoundary2

####################
# Disable Wallride #
####################

# Original instruction
DisableWallride:
lwz r0, 0x4(r3)

# Check if glitches are allowed
lis r3, GlitchesAllowed@ha
lbz r3, GlitchesAllowed@l(r3)
cmpwi r3, 1
beqlr

# If not, force 0 in r0
li r0, 0
blr

##################################
# Disable Horizontal Wall Glitch #
##################################

# Return whether glitches are allowed in r21
DisableHWG:
lis r21, GlitchesAllowed@ha
lbz r21, GlitchesAllowed@l(r21)
blr

###################################
# Fall Boundary Injector - Hook 1 #
###################################

# Original instruction
FallBoundary1:
lhz r30, 0x4(r4)

# Store original count in stack
sth r30, 0x8(r1)

# Get track slot
lis r29, Racedata@ha
lwz r29, Racedata@l(r29)
lwz r29, 0xB68(r29)

# Load the amount of additional areas
lis r31, AreaCounts@h
ori r31, r31, AreaCounts@l
lbzx r29, r29, r31

# Check if glitches are allowed
lis r31, GlitchesAllowed@ha
lbz r31, GlitchesAllowed@l(r31)
cmpwi r31, 1
bne+ end

# If not, replace r29 with 0
li r29, 0

# Add to the count and return
end:
add r30, r29, r30
blr

###################################
# Fall Boundary Injector - Hook 2 #
###################################

# Subtract current count to original count
FallBoundary2:
lwz r27, 0x8(r1)
sub. r3, r29, r27

# If the result is bigger than 0, load our custom areas
bgt customAreas

# Original instruction
lwz r3, 0xC(r28)
blr

# Custom area logic! Move result of previous operation to r0
customAreas:
mr r0, r3

# Get track slot
lis r27, Racedata@ha
lwz r27, Racedata@l(r27)
lwz r27, 0xB68(r27)
slwi r27, r27, 2

# Load pointer to areas
lis r3, AreaPointers@h
ori r3, r3, AreaPointers@l
lwzx r3, r3, r27

# Subtract 8 to account for later addi, then return
subi r3, r3, 8
blr

########################################
# Fall Boundary Injector - Area Counts #
########################################

AreaCounts:
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 0, 0
.align 2

##########################################
# Fall Boundary Injector - Area Pointers #
##########################################

AreaPointers:
.long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.long 0, 0
