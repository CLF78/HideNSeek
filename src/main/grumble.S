.include "asm_setup.S"

.global RockFix, GeyserFix

RockFix:
li r5, 0
ori r5, r5, 39600

# Check for the specific GV geysers delay values
GeyserFix:
cmpwi r0, 0xAF0
beq multiply

cmpwi r0, 0x122A
beq multiply

cmpwi r0, 0x16A8
bne+ end

# Replace value
multiply:
li r0, 0
ori r0, r0, 39600

# Original instruction
end:
stw r0, 0xE0(r30)
blr
