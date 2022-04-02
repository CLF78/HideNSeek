.include "asm_setup.S"

.global MessageEditor, MessageEditor2

.macro .message str
Message\@:
.string16 "\str"
.endm

.macro getOffs id
addi r3, r12, (Message\id - StartOfMessages)
.endm

.macro checkMsg bmg id
cmpwi r14, \bmg
bne+ not\bmg
getOffs \id
not\bmg :
.endm

###########
# Patch 1 #
###########

# Original instruction
MessageEditor:
addi r5, r1, 0x8

# Get first character of BMG name
lbz r4, 0x8(r5)

# Check for StaffRoll
cmpwi r4, 'S'
beq staffRollBmg

# Check for Menu
cmpwi r4, 'M'
beq menuBmg

# Check for Race
cmpwi r4, 'R'
bnelr+

# Race BMG
li r4, 'L'
stb r4, 0x8(r5)
blr

# Staffroll BMG
staffRollBmg:
li r4, 'e'
stb r4, 0x10(r5)
blr

# Menu BMG
menuBmg:
li r4, 'a'
stb r4, 0x9(r5)
blr

###########
# Patch 2 #
###########

# Check if BMG is 4001
MessageEditor2:
cmplwi cr7, r6, 4001
bne+ cr7, not4001

# If so replace it with 4000
subi r6, r6, 1
b return

# Check if BMG is 0x7F1
not4001:
cmplwi cr7, r6, 0x7F1
bne+ cr7, return

# If so replace it with 8426
li r6, 8426

# Original instruction
return:
mr r14, r6
blr
