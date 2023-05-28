.include "asm_setup.S"

.extern GuestSendHook, HostCheckHook, DWCiCheckResvCommand, Version, Original30
.global GuestSend, HostCheck, HostCheckHelper

##############
# Guest Send #
##############

# Check if command is reservation
GuestSend:
cmpwi r3, 1
bne+ end

# If so, attach version
lwz r11, 0x14(r7)
lis r12, Version@ha
lbz r12, Version@l(r12)
or r11, r11, r12
stw r11, 0x14(r7)

# Original instruction
end:
stwu r1, -0x570(r1)
b GuestSendHook+4

##############
# Host Check #
##############

# Skipped instruction
HostCheck:
addi r8, r1, 0xD0

# Check if command is reservation
cmpwi r30, 1

# Restore r30
lis r30, Original30@h
ori r30, r30, Original30@l

# Branch
bne+ sendCommand

# If so, check the version
lwz r9, 0x14(r31)
rlwinm r9, r9, 0, 0xFF
lis r12, Version@ha
lbz r12, Version@l(r12)
cmpw r9, r12
beq+ sendCommand

# Conditions were not met, send RESV_DENY
deny:
li r3, 3
b end2

# Otherwise call the original function
sendCommand:
bl DWCiCheckResvCommand

# Return later because of the Wiimmfi hook
end2:
b HostCheckHook+8

#####################
# Host Check Helper #
#####################

# A shitty helper because the code kills our beloved r29
HostCheckHelper:
mr r30, r29

# Original instruction
rlwinm r29, r0, 0x10, 0x0, 0x1F
blr
