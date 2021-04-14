.include "asm_setup.S"

.extern SetupHNSHost, RKNetSelectHandler, RKNetController 
.global SetupHNSHostHelper, ForceTeams4

# Fuck you GCC
SetupHNSHostHelper:
mr r5, r31
b SetupHNSHost

# Multiply pid by 2
ForceTeams4:
slwi r4, r17, 1

# Get received packets array
lis r5, RKNetSelectHandler@ha
lwz r5, RKNetSelectHandler@l(r5)
addi r5, r5, 8

# Get host aid
lis r6, RKNetController@ha
lwz r6, RKNetController@l(r6)
lbz r7, 0x5A(r6)
lbz r6, 0x59(r6)
cmpw r7, r6
beq host

# Not host, get received packet
addi r5, r5, 0x38
mulli r6, r7, 0x38
b keepGoing

# Am host, get sent packet
host:
li r6, 0

# Get offset of packet
keepGoing:
add r5, r5, r6

# Get battle flag
addi r5, r5, 0x24
lwz r6, 0(r5)

# Get the team bit
srw r6, r6, r4
rlwinm r6, r6, 0, 30, 31

# Not it and move it to r0
xori r0, r6, 1
blr
