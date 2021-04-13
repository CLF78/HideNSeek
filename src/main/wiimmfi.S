.include "asm_setup.S"

.global WiimmfiASM1, WiimmfiASM2
.extern WiimmfiPatch3, WiimmfiPatch4
.extern NETSHA1Init, NETSHA1Update, NETSHA1GetDigest

# Korea has some hardcoded r13 addresses, so here we go
.if (REGION == 'K')
	.set OFF1, -0x68A8
	.set OFF2, -0x5E94
.else
	.set OFF1, -0x68C8
	.set OFF2, -0x5EB4
.endif

###########
# Patch 1 #
###########
WiimmfiASM1:

# Original instruction
cmpwi r3, 0
ble end

lwz r3, 0xC(r1)
lwz r0, OFF1(r13)
cmpwi r0, 2
beq- continue

stw r3, OFF2(r13)
li r0, 2
stw r0, OFF1(r13)
b end

# Execute payload
continue:
addi r4, r3, 3
rlwinm r4, r4, 0, 0, 29
lbz r5, 0x0(r4)
add r5, r4, r5
dcbf 0, r5
mtlr r5
blrl

# Original instruction
end:
li r3, -1
cmpwi r3, 0
b WiimmfiPatch3+4

###########
# Patch 2 #
###########
WiimmfiASM2:

# Check if inited
lwz r4, OFF2(r13)
cmplwi r4, 1
ble nomatch

# Push stack
stwu r1, -0x80(r1)

# Call NETSHA1Init
addi r3, r1, 0x20
bl NETSHA1Init

# Call NETSHA1Update
addi r3, r1, 0x20
lwz r4, OFF2(r13)
li r5, 0x554
stw r5, 0xC4(r28)
bl NETSHA1Update

# Call NETSHA1GetDigest
addi r3, r1, 0x20
addi r4, r1, 0x10
bl NETSHA1GetDigest
b setupLoop

# Some SHA1 stuff
.long 0x0FFF1F07, 0x00E638C9, 0x49FBEFFA, 0x79022D3A, 0x84AB134F

# Setup loop
setupLoop:
mflr r3
addi r4, r1, 0xC
li r5, 5
mtctr r5

# Loop it!
loop:
lwzu r5, 0x4(r3)
lwzu r6, 0x4(r4)
cmpw r6, r5
bne exit
bdnz+ loop

# Check if we found a match and pop the stack
exit:
cmpw r6, r5
addi r1, r1, 0x80
lwz r4, OFF2(r13)
beq 0

# Return 0 otherwise
nomatch:
li r4, 0
b WiimmfiPatch4+4
