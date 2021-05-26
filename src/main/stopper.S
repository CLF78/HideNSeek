.include "asm_setup.S"

.extern HideNSeekData, StopperHook, StopperHook2
.global Stopper1, Stopper2, Stopper3

#############
# Stopper 1 #
#############

# Get player id
Stopper1:
lwz r4, 0(r3)
lwz r4, 0(r4)
lbz r4, 0x10(r4)
slwi r4, r4, 2

# Get isStopped for player
lis r5, HideNSeekData@ha
ori r5, r5, HideNSeekData@l+4
add r5, r5, r4
lbz r4, 0(r5)
cmpwi r4, 1
beqlr

# If false, execute original instruction and resume function
stwu r1, -0x30(r1)
b StopperHook+4

#############
# Stopper 2 #
#############

# Get player id
Stopper2:
lwz r4, 0(r3)
lwz r4, 0(r4)
lbz r4, 0x10(r4)
slwi r4, r4, 2

# Get isStopped for player
lis r5, HideNSeekData@ha
ori r5, r5, HideNSeekData@l+4
add r5, r5, r4
lbz r4, 0(r5)
cmpwi r4, 1
beqlr

# If false, execute original instruction and resume function
stwu r1, -0xD0(r1)
b StopperHook2+4

#############
# Stopper 3 #
#############

# Get player id
Stopper3:
lwz r11, 0(r3)
lwz r11, 0(r11)
lbz r11, 0x10(r11)
slwi r11, r11, 2

# Get HideNSeekPlayer struct
lis r12, HideNSeekData@ha
ori r12, r12, HideNSeekData@l+4
add r12, r12, r11

# Check that the player is stopped
lbz r11, 0(r12)
cmpwi r11, 1
bne+ allowSSMT

# But if respawn cooldown is on, let the player charge SSMTs anyway
lbz r11, 0x3(r12)
cmpwi r11, 0
beqlr

# Execute original instruction and return
allowSSMT:
addi r4, r4, 1
blr
