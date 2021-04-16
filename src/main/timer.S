.include "asm_setup.S"

.extern TimerChecks, No5LimitHook2, No5LimitHook3, EndReason, Have30SecondsPassed
.global StartingTime, StartingTime2, TimerEnd

##########################
# Starting Time Modifier #
##########################

# Set timer
StartingTime:
li r31, 1800

# Original instruction
stw r31, 0x48(r29)
blr

############################
# Starting Time Modifier 2 #
############################

# Load 30 in r12
StartingTime2:
li r12, 30

# Modified original instruction
stb r12, 0x16(r3)
blr

##########################
# Disable 5 Minute Limit #
##########################

# This is an ASM helper for the main function in C

# Check if Have30SecondsPassed is 0
TimerEnd:
lis r3, Have30SecondsPassed@ha
lbz r3, Have30SecondsPassed@l(r3)
cmpwi r3, 0
beq noEndRace

# Check if EndReason is not 0
lis r3, EndReason@ha
lbz r3, EndReason@l(r3)
cmpwi r3, 0
bne endRace

# Load Raceinfo and call function
lwz r3, 0x4(r31)
bl TimerChecks

# Store EndReason and return
lis r4, EndReason@ha
stb r3, EndReason@l(r4)

noEndRace:
b No5LimitHook3

# End the race
endRace:
b No5LimitHook2
