.include "asm_setup.S"
.global AutoBRSAR

# Override
AutoBRSAR:
lis r31, 0x7FFF
ori r31, r31, 0xFFFF
blr
