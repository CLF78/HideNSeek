.include "asm_setup.S"

.extern CTSupport
.global RockFix, GeyserFix

#########
# Rocks #
#########

# Original instruction
RockFix:
lha r4, 0x2A(r4)

# Check if CTSupport is on and if so return
lis r5, CTSupport@ha
lbz r5, CTSupport@l(r5)
cmpwi r5, 1
beqlr

# Otherwise override
li r4, 660
blr

###########
# Geysers #
###########

# Check if CTSupport is on
GeyserFix:
lis r12, CTSupport@ha
lbz r12, CTSupport@l(r12)
cmpwi r12, 1
beq end

# Check for the specific GV geysers delay values
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
