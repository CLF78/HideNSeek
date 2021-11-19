.include "asm_setup.S"

.global funcs, filename

# PAL Functions
funcs:
.long 0x801A4EC4
.long 0x8015E2BC
.long 0x8015E568
.long 0x8015E834
.long 0x801A6D30
.long 0x80009A3C
.long 0x800090AF
.byte 'P'
.align 2

# NTSC-U Functions
.long 0x801A4E24
.long 0x8015E21C
.long 0x8015E4C8
.long 0x8015E794
.long 0x801A6C90
.long 0x800099FC
.long 0x8000906F
.byte 'E'
.align 2

# NTSC-J Functions
.long 0x801A4DE4
.long 0x8015E1DC
.long 0x8015E488
.long 0x8015E754
.long 0x801A6C50
.long 0x80009998
.long 0x8000900B
.byte 'J'
.align 2

# NTSC-K Functions
.long 0x801A5220
.long 0x8015E334
.long 0x8015E5E0
.long 0x8015E8AC
.long 0x801A708C
.long 0x80009B44
.long 0x800091FF
.byte 'K'
.align 2

filename:
.string "/hns/HideNSeekX.bin"
.align 2
