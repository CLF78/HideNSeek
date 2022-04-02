.include "asm_setup.S"

.extern IsInfection, PrevSeekers
.global FlagReset

FlagReset:
li r12, 0
lis r11, IsInfection@ha
stw r12, IsInfection@l(r11)
stw r12, IsInfection@l+4(r11)
sth r12, IsInfection@l+8(r11)

li r12, -1
sth r12, PrevSeekers@l(r11)
blr
