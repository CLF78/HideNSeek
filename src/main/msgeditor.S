.include "asm_setup.S"

.extern EndReason
.extern MessageEditorHook, MessageFunc, SCGetLanguage
.global MessageEditor, MessageEditor2, MessageEditor3

###########
# Patch 1 #
###########

# Original instruction
MessageEditor:
bl MessageFunc

# Do bl trick
bl trick

# Messages go here
.string16 "Double Seeker: ON!"
.string16 "Double Seeker: OFF!"
.string16 "Infection Mode: ON!"
.string16 "Infection Mode: OFF!"
.string16 "Halved Timer: ON!"
.string16 "Halved Timer: OFF!"
.string16 "Host Always Seeker: ON!"
.string16 "Host Always Seeker: OFF!"
.string16 "Battle Glitch: ON!"
.string16 "Battle Glitch: OFF!"
.string16 "Host Always Wins Vote: ON!"
.string16 "Host Always Wins Vote: OFF!"
.string16 "\nTime's up!\nThe match has ended."
.string16 "\nAll players have been caught.\nThe match has ended."
.string16 "\nAll seekers left.\nThe match has ended."
.string16 "Hide and Seek v1.7"
.align 2

trick:
mflr r12

# Begin messages
cmpwi r14, 4568
bne+ not4568
mr r3, r12

not4568:
cmpwi r14, 4569
bne+ not4569
addi r3, r12, 0x26

not4569:
cmpwi r14, 4570
bne+ not4570
addi r3, r12, 0x4E

not4570:
cmpwi r14, 4571
bne+ not4571
addi r3, r12, 0x76

not4571:
cmpwi r14, 4572
bne+ not4572
addi r3, r12, 0xA0

not4572:
cmpwi r14, 4573
bne+ not4573
addi r3, r12, 0xC4

not4573:
cmpwi r14, 4574
bne+ not4574
addi r3, r12, 0xEA

not4574:
cmpwi r14, 4575
bne+ not4575
addi r3, r12, 0x11A

not4575:
cmpwi r14, 4576
bne+ not4576
addi r3, r12, 0x14C

not4576:
cmpwi r14, 4577
bne+ not4577
addi r3, r12, 0x172

not4577:
cmpwi r14, 4578
bne+ not4578
addi r3, r12, 0x19A

not4578:
cmpwi r14, 4579
bne+ not4579
addi r3, r12, 0x1D0

not4579:
cmpwi r14, 1340
bne+ not1340
addi r3, r12, 0x208

not1340:
cmpwi r14, 1342
bne+ not1342
addi r3, r12, 0x24A

not1342:
cmpwi r14, 1341
bne+ not1341
addi r3, r12, 0x2B2

not1341:
cmpwi r14, 4002
bne+ not4002
addi r3, r12, 0x302

# Store pointer before it gets overwritten (original instruction)
not4002:
stw r3, 0x20(r1)

.if (REGION == 'P' || REGION == 'E')

	# Call SCGetLanguage
	bl SCGetLanguage

	# Check if language is Spanish
	cmpwi r3, 4

	# This snippet differs between PAL and NTSC-U
	.if (REGION == 'P')
		li r4, 55
		beq messageChecks2
		
		# Check if language is English
		cmpwi r3, 1
		li r4, 57
	.else
		li r4, 53
	.endif

	# Shared branch
	bne+ end

	# Check that the messages match
	cmpwi r14, 0x14C7
	beq doReplacement

	cmpwi r14, 0x14C8
	beq doReplacement

	messageChecks2:
	cmpwi r14, 0x14BF
	beq doReplacement

	cmpwi r14, 0x14C0
	bne+ end

	# Load character we want to replace
	doReplacement:
	li r12, '2'

	# Reload pointer
	lwz r3, 0x20(r1)

	# Store byte at index
	stbx r12, r4, r3

.endif

# Return
end:
b MessageEditorHook+8

###########
# Patch 2 #
###########

# Check if BMG is between 4500 and 4511 (use cr7 because cr0 is reserved atm)
MessageEditor2:
subi r14, r6, 4500
cmplwi cr7, r14, 11
bgt+ cr7, notFirstTen

# If so add 68
addi r6, r6, 68
b return

# Check if BMG is between 4510 and 4579 (use cr7 because cr0 is reserved atm)
notFirstTen:
cmplwi cr7, r14, 79
bgt+ cr7, return

# If so subtract 12
subi r6, r6, 12

# Original instruction
return:
mr r14, r6
blr

###########
# Patch 3 #
###########

# Use EndReason rather than the field in RaceinfoPlayer to determine the message
MessageEditor3:
lis r3, EndReason@ha
lbz r3, EndReason@l(r3)
addi r3, r3, 1
mr r0, r3
blr
