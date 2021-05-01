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
.string16 "We're playing Hide and Seek!"
.string16 "We're playing Infection Mode!"
.string16 "Double Seeker: ON!"
.string16 "Double Seeker: OFF!"
.string16 "Halved Timer: ON!"
.string16 "Halved Timer: OFF!"
.string16 "Host Always Seeker: ON!"
.string16 "Host Always Seeker: OFF!"
.string16 "Allow Glitches: ON!"
.string16 "Allow Glitches: OFF!"
.string16 "Long Distance Names: ON!"
.string16 "Long Distance Names: OFF!"
.string16 "Host Always Wins Vote: ON!"
.string16 "Host Always Wins Vote: OFF!"
.string16 "\nTime's up!\nThe match has ended."
.string16 "\nAll players have been caught.\nThe match has ended."
.string16 "\nAll seekers left.\nThe match has ended."
.string16 "Hide and Seek v1.7"
.string16 "Hide and Seek"
.string16 "Hide and Seek Infection"
.string16 "In a Worldwide HnS Race!"
.align 2

trick:
mflr r12

# Friend Room Start messages
cmpwi r14, 4110
bne+ not4110
mr r3, r12

not4110:
cmpwi r14, 4111
bne+ not4111
addi r3, r12, 0x3A

# Room Flag messages
not4111:
cmpwi r14, 8410
bne+ not8410
addi r3, r12, 0x76

not8410:
cmpwi r14, 8411
bne+ not8411
addi r3, r12, 0x9C

not8411:
cmpwi r14, 8412
bne+ not8412
addi r3, r12, 0xC4

not8412:
cmpwi r14, 8413
bne+ not8413
addi r3, r12, 0xE8

not8413:
cmpwi r14, 8414
bne+ not8414
addi r3, r12, 0x10E

not8414:
cmpwi r14, 8415
bne+ not8415
addi r3, r12, 0x13E

not8415:
cmpwi r14, 8416
bne+ not8416
addi r3, r12, 0x170

not8416:
cmpwi r14, 8417
bne+ not8417
addi r3, r12, 0x198

not8417:
cmpwi r14, 8418
bne+ not8418
addi r3, r12, 0x1C2

not8418:
cmpwi r14, 8419
bne+ not8419
addi r3, r12, 0x1F4

not8419:
cmpwi r14, 8420
bne+ not8420
addi r3, r12, 0x228

not8420:
cmpwi r14, 8421
bne+ not8421
addi r3, r12, 0x25E

# Race end messages
not8421:
cmpwi r14, 1340
bne+ not1340
addi r3, r12, 0x296

not1340:
cmpwi r14, 1342
bne+ not1342
addi r3, r12, 0x2D8

not1342:
cmpwi r14, 1341
bne+ not1341
addi r3, r12, 0x340

# VS/Battle Buttons
not1341:
cmpwi r14, 0x10D1
bne+ not10D1
addi r3, r12, 0x3B6

not10D1:
cmpwi r14, 0x10D4
bne+ not10D4
addi r3, r12, 0x3D2

# Version string
not10D4:
cmpwi r14, 8422
bne+ not4002
addi r3, r12, 0x390

# Status messages
not4002:
cmpwi r14, 0x14BD
bne+ not14BD
addi r3, r12, 0x402

# Store pointer before it gets overwritten (original instruction)
not14BD:
stw r3, 0x20(r1)

# Friend status messages
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

# If so replace it with 8422
li r6, 8422

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
