.include "asm_setup.S"

.extern MessageEditorHook, MessageFunc, SCGetLanguage
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
bl MessageFunc

# Do bl trick
bl trick

# Messages go here
StartOfMessages:
.message "We're playing a Classic HnS!"
.message "We're playing an Infection HnS!"
.message "Double Seeker: ON!"
.message "Double Seeker: OFF!"
.message "Always Win Vote: ON!"
.message "Always Win Vote: OFF!"
.message "Timer: NORMAL!"
.message "Timer: HALF!"
.message "Timer: EXTREME!"
.message "Host Always: NORMAL!"
.message "Host Always: SEEKER!"
.message "Host Always: HIDER!"
.message "Allow Glitches: ON!"
.message "Allow Glitches: OFF!"
.message "Long Distance Names: ON!"
.message "Long Distance Names: OFF!"
.message "Respawn Cooldown: ON!"
.message "Respawn Cooldown: OFF!"
.message "\nTime's up!\nThe match has ended."
.message "\nAll players have been caught.\nThe match has ended."
.message "\nAll seekers left.\nThe match has ended."
.message "Hide and Seek v2.0"
.message "Classic"
.message "Infection"
.message "In a Worldwide HnS match!"
.message "Press +/START to vote for a Battle Arena!"
.message "Press +/START to vote for a Track!"
.align 2

trick:
mflr r12

# Friend Room Start
checkMsg 4110, 0
checkMsg 4111, 1

# Friend Room
checkMsg 8410, 2
checkMsg 8411, 3
checkMsg 8412, 4
checkMsg 8413, 5
checkMsg 8414, 6
checkMsg 8415, 7
checkMsg 8416, 8
checkMsg 8417, 9
checkMsg 8418, 10
checkMsg 8419, 11
checkMsg 8420, 12
checkMsg 8421, 13
checkMsg 8422, 14
checkMsg 8423, 15
checkMsg 8424, 16
checkMsg 8425, 17

# Race End
checkMsg 1340, 18
checkMsg 1342, 19
checkMsg 1341, 20

# Version String
checkMsg 8426, 21

# VS/Battle Button
checkMsg 4305, 22
checkMsg 4308, 23

# Online Status
checkMsg 5309, 24

# Voting Hints
checkMsg 3361, 25
checkMsg 3363, 26

# Store pointer before it gets overwritten (original instruction)
stw r3, 0x20(r1)

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

# If so replace it with 8426
li r6, 8426

# Original instruction
return:
mr r14, r6
blr
