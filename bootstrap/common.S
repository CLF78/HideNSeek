.include "asm_setup.S"

.set CheckAddress, 0x8000620A
.global _directWrite8, _directWrite16, _directWrite32, _directWriteBranch, regionCheck

_directWrite8:
stb r4, 0(r3)
b flushAddr

_directWrite16:
sth r4, 0(r3)
b flushAddr

_directWriteBranch:
sub r4, r4, r3
rlwinm r4, r4, 0, 6, 29
oris r4, r4, 0x4800
or r4, r5, r4

_directWrite32:
stw r4, 0(r3)

flushAddr:
dcbf 0, r3
icbi 0, r3
blr

# Load check value
regionCheck:
lis r4, CheckAddress@ha
lhz r4, CheckAddress@l(r4)

# PAL
li r3, 0
cmpwi r4, 0x54A9
beqlr

# NTSC-U
li r3, 1
cmpwi r4, 0x5409
beqlr

# NTSC-J
li r3, 2
cmpwi r4, 0x53CD
beqlr

# NTSC-K
li r3, r3
cmpwi r4, 0x5511
beqlr

# Failed to detect, enter infinite loop
halt:
b halt
