.include "asm_setup.S"

.extern ENPTCRC, Raceinfo, HideNSeekData, StopperHook, StopperHook2, StopperHook3, StopperHook4, StopperHook5
.global Stopper1, Stopper2, Stopper3, Stopper4, Stopper5
.set ChainChompWheelCRC, 0xED1EB462
.set FunkyStadiumCRC, 0x36512E93

###############
# Stopper Sub #
###############

# Get player id
StopperSub:
lwz r11, 0(r3)
lwz r11, 0(r11)
lbz r11, 0x10(r11)
slwi r11, r11, 2

# Get HideNSeekPlayer struct
lis r12, HideNSeekData@h
ori r12, r12, HideNSeekData@l+4
add r12, r12, r11
blr

#############
# Stopper 1 #
#############

# Save LR
Stopper1:
mflr r4

# Get isStopped for player
bl StopperSub
lbz r12, 0(r12)
cmpwi r12, 1

# Restore LR
mtlr r4
beqlr

# If false, execute original instruction and resume function
stwu r1, -0x30(r1)
b StopperHook+4

#############
# Stopper 2 #
#############

# Save LR
Stopper2:
mflr r4

# Get isStopped for player
bl StopperSub
lbz r12, 0(r12)
cmpwi r12, 1

# Restore LR
mtlr r4
beqlr

# If false, execute original instruction and resume function
stwu r1, -0xD0(r1)
b StopperHook2+4

#############
# Stopper 3 #
#############

# Get isStopped for player
Stopper3:
bl StopperSub

# Addendum = (respawnTimer > 0) | !(isStopped)
lbz r11, 0x3(r12)
lbz r12, 0(r12)
neg r11, r11
xori r12, r12, 1
srwi r11, r11, 31
or r11, r11, r12
rlwinm r11, r11, 0, 0xFF

# Add resulting value
add r4, r4, r11
b StopperHook3+4

#############
# Stopper 4 #
#############

# Don't allow start boost if Seeker
Stopper4:
bl StopperSub
lbz r11, 0x1(r12)
cmpwi r11, 1
b StopperHook4+0x24

#############
# Stopper 5 #
#############

# If player is not local, ignore
Stopper5:
lwz r12, 0x14(r3)
rlwinm. r12, r12, 0, 28, 28
bne+ end

# If timer is past 3 seconds in the race, ignore
lis r12, Raceinfo@ha
lwz r12, Raceinfo@l(r12)
lwz r12, 0x20(r12)
cmpwi r12, 360
bgt+ end

# Load ENPTCRC
lis r11, ENPTCRC@ha
lwz r11, ENPTCRC@l(r11)

# If CRC matches Funky Stadium or Chain Chomp Wheel, ignore any input
lis r12, FunkyStadiumCRC@h
ori r12, r12, FunkyStadiumCRC@l
cmpw r11, r12
beqlr

lis r12, ChainChompWheelCRC@h
ori r12, r12, ChainChompWheelCRC@l
cmpw r11, r12
beqlr

# Original instruction
end:
stwu r1, -0x30(r1)
b StopperHook5+4
