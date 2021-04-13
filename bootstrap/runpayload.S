.include "asm_setup.S"

.set StartFunc, 0x808DD400

.global runPayload

runPayload:
lis r3, StartFunc@ha
lwz r3, StartFunc@l(r3)
mtctr r3
bctr
blr
