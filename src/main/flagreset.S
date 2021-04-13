.include "asm_setup.S"

.extern SeekerCount, PrevSeekers
.global FlagReset

FlagReset:
li r12, 0
lis r11, SeekerCount@ha
stw r12, SeekerCount@l(r11)
stw r12, SeekerCount@l+4(r11)

li r12, -1
sth r12, PrevSeekers@l(r11)
blr
