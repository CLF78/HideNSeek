.include "asm_setup.S"

.set MapleTreewayCRC, 0x3897A817
.set GrumbleVolcanoCRC, 0x7E2BB3AA
.set ToadFactoryCRC, 0x9F470CD9
.set BlockPlazaCRC, 0x3D92B8D7
.set ChainChompWheelCRC, 0xED1EB462
.set DelfinoPierCRC, 0x72836BEE

.extern MapleTreewayArea, ToadFactoryAreas
.extern GlitchesAllowed, ENPTCRC
.global AREA1, AREA2, GOBJRockFix, GOBJGeyserFix, GOBJTwanwanFix, GOBJTwanwanFix2, GOBJVenicenamiFix

##########################
# AREA Injector - Hook 1 #
##########################

# Check if glitches are allowed
AREA1:
lis r31, GlitchesAllowed@ha
lbz r31, GlitchesAllowed@l(r31)
cmpwi r31, 1
beq noAreas

# Get CRC
lis r31, ENPTCRC@ha
lwz r31, ENPTCRC@l(r31)

# Assume Toad's Factory -> 3
li r29, 3
lis r30, ToadFactoryCRC@h
ori r30, r30, ToadFactoryCRC@l
cmpw r30, r31
beq end

# Assume Maple Treeway -> 1
li r29, 1
lis r30, MapleTreewayCRC@h
ori r30, r30, MapleTreewayCRC@l
cmpw r30, r31
beq end

# No areas to be added
noAreas:
li r29, 0

# Original instruction
end:
lhz r30, 0x4(r4)

# Add to the count and return
add r30, r29, r30
blr

##########################
# AREA Injector - Hook 2 #
##########################

# Get original area count from the stack
AREA2:
lwz r27, 0x1C(r1)
lhz r27, 0x4(r27)

# Subtract current count to it
sub. r3, r29, r27

# If the result is equal or bigger than 0, load our custom areas
bge customAreas

# Original instruction
lwz r3, 0xC(r28)
blr

# Custom area logic! Move result of previous operation to r0
customAreas:
mr r0, r3

# Get CRC
lis r27, ENPTCRC@ha
lwz r27, ENPTCRC@l(r27)

# Check for Toad's Factory
lis r3, ToadFactoryAreas@h
ori r3, r3, ToadFactoryAreas@l
lis r4, ToadFactoryCRC@h
ori r4, r4, ToadFactoryCRC@l
cmpw r4, r27
beq return

# We cannot get here in any other way, so it must be Maple Treeway
lis r3, MapleTreewayArea@h
ori r3, r3, MapleTreewayArea@l

# Subtract 8 to account for later addi, then return
return:
subi r3, r3, 8
blr

####################################################
# GOBJ Patcher - Grumble Rocks/Block Plaza Statues #
####################################################

# Original instruction
GOBJRockFix:
lha r4, 0x2A(r4)

# Get CRC
lis r12, ENPTCRC@ha
lwz r12, ENPTCRC@l(r12)

# Check for Grumble Volcano
lis r11, GrumbleVolcanoCRC@h
ori r11, r11, GrumbleVolcanoCRC@l
cmpw r11, r12
beq override

# Check for Block Plaza
lis r11, BlockPlazaCRC@h
ori r11, r11, BlockPlazaCRC@l
cmpw r11, r12
bnelr+

# Override if applicable
override:
li r4, 660
blr

##################################
# GOBJ Patcher - Grumble Geysers #
##################################

# Get CRC
GOBJGeyserFix:
lis r12, ENPTCRC@ha
lwz r12, ENPTCRC@l(r12)

# Check for Grumble Volcano
lis r11, GrumbleVolcanoCRC@h
ori r11, r11, GrumbleVolcanoCRC@l
cmpw r11, r12
bne+ exit

# Replace value
li r0, 0
ori r0, r0, 39600

# Original instruction
exit:
stw r0, 0xE0(r30)
blr

##################################################
# GOBJ Patcher - Chain Chomp Wheel Rolling Chomp #
##################################################

# Original instruction
GOBJTwanwanFix:
lha r0, 0x32(r4)

# Get CRC
lis r12, ENPTCRC@ha
lwz r12, ENPTCRC@l(r12)

# Check for Chain Chomp Wheel (use cr7 to preserve cr0)
lis r11, ChainChompWheelCRC@h
ori r11, r11, ChainChompWheelCRC@l
cmpw cr7, r11, r12
bnelr+ cr7

# Override
li r0, 600
blr

# Original instruction
GOBJTwanwanFix2:
lhz r0, 0x34(r4)

# Since r11, r12 and cr7 have been unchanged since the last hook, brutally branch back
bnelr+ cr7

# Override
li r0, 660
blr

#####################################
# GOBJ Patcher - Delfino Pier Water #
#####################################

.set VnamiS1, 0x00101068
.set VnamiS2, 0x03981518
.set VnamiS3, 0x0A281C20
.set VnamiS4, 0x00050000

# Original instruction
GOBJVenicenamiFix:
lwz r6, 0(r31)

# Get CRC
lis r12, ENPTCRC@ha
lwz r12, ENPTCRC@l(r12)

# Check for Delfino Pier
lis r11, DelfinoPierCRC@h
ori r11, r11, DelfinoPierCRC@l
cmpw r11, r12
bnelr+ 

# Override all KMP settings
lis r7, VnamiS1@h
ori r7, r7, VnamiS1@l
stw r7, 0x2A(r6)

lis r7, VnamiS2@h
ori r7, r7, VnamiS2@l
stw r7, 0x2E(r6)

lis r7, VnamiS3@h
ori r7, r7, VnamiS3@l
stw r7, 0x32(r6)

lis r7, VnamiS4@h
stw r7, 0x36(r6)
blr
