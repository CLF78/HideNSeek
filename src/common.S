.include "asm_setup.S"

.global _directWrite8, _directWrite16, _directWrite32, _directWriteBranch

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
